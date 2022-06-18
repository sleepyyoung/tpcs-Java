package tpcs.controller.api;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tpcs.pojo.File;
import tpcs.pojo.Result;
import tpcs.pojo.UploadStatus;
import tpcs.service.IFileService;
import tpcs.service.IUserService;
import tpcs.util.crypt.AESUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/api/file")
@RestController(value = "api-file-controller")
public class FileController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IFileService fileService;

    @Value("${upload.path}")
    private String uploadPath;
    @Value("${spring.profiles.active}")
    private String env;

    /** 文件列表 */
    @GetMapping("/list")
    public String fileList(HttpServletRequest request,
                           @RequestParam Integer page,
                           @RequestParam Integer limit) {
        @Data
        @AllArgsConstructor
        @NoArgsConstructor
        class InnerFile {
            private Integer id;
            private String name;
            private String path;
            private String teacher;
            private String gmtCreate;
        }

        Cookie[] cookies = request.getCookies();
        PageInfo<File> filePageInfo = null;
        List<File> fileList;
        List<InnerFile> innerFileList = new ArrayList<>();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                String username;
                try {
                    username = AESUtil.decryptByAES(cookie.getValue());
                    if ("username".equals(cookie.getName())) {
                        if (userService.isAdminByUsername(username)) {
                            filePageInfo = fileService.selectFileList(page, limit);
                        } else {
                            Integer userId = userService.selectByUsername(username).getId();
                            filePageInfo = fileService.selectFileListByUserId(userId, page, limit);
                        }
                        fileList = filePageInfo.getList();
                        for (File file : fileList) {
                            innerFileList.add(new InnerFile(
                                    file.getId(),
                                    file.getFileName(),
                                    file.getTruthName(),
                                    userService.queryUsernameById(file.getUserId()),
                                    file.getGmtCreate()
                            ));
                        }
                    }
                } catch (Exception ignored) {
                }
            }
        }
        if (filePageInfo != null) {
            return JSON.toJSONString(new Result(0, "", filePageInfo.getTotal(), innerFileList));
        }
        return JSON.toJSONString(null);
    }

    /** 文件下载 */
    @GetMapping("/download/{truthName}")
    public void downloadFile(@PathVariable String truthName, HttpServletResponse response) {
        if (truthName != null && !"".equals(truthName.trim())) {
            response.setHeader("Content-Type", "application/octet-stream");
            response.setHeader("X-Accel-Redirect", "/uploads/" + truthName);
            response.setHeader("X-Accel-Charset", "utf-8");
            response.setHeader("Content-Disposition", "attachment; filename=" + truthName);
        } else {
            System.out.println("error");
        }
    }

    /** 删除文件 */
    @PostMapping("/delete/{id}")
    public Result deleteFile(@PathVariable Integer id) {
        return fileService.deleteFile(id);
    }

    /** 批量删除文件 */
    @PostMapping("batch-delete")
    public Result batchDeleteFile(@RequestBody List<Integer> ids) {
        return fileService.batchDelete(ids);
    }

    /** 文件上传 */
    @PostMapping("/upload")
    public String fileUpload(HttpServletRequest request,
                             @RequestParam(value = "files", required = false) MultipartFile[] files
    ) throws IOException {
        Cookie[] cookies = request.getCookies();
        Integer userId = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                String username;
                try {
                    username = AESUtil.decryptByAES(cookie.getValue());
                    if ("username".equals(cookie.getName())) {
                        userId = userService.selectByUsername(username).getId();
                    }
                } catch (Exception ignored) {
                }
            }
        }

        java.io.File pathFile = new java.io.File(uploadPath);
        if (!pathFile.exists() && !pathFile.isDirectory()) {
            pathFile.mkdirs();
        }

        if (files != null && files.length > 0) {
            for (MultipartFile file : files) {
                String fileName = file.getOriginalFilename();
                String suffix = fileName.lastIndexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".")) : "";
                String truthName = System.currentTimeMillis() + suffix;

                if ("test".equals(env)) {
                    file.transferTo(new java.io.File(uploadPath + "/" + truthName));
                } else {
                    file.transferTo(new java.io.File(uploadPath + "\\" + truthName));
                }

                File f = new File(userId, fileName, truthName);
                fileService.addFile(f);
            }
        }
        return "{\"result\":\"success\"}";
    }

    @RequestMapping("/upload/status")
    public UploadStatus getStatus(HttpSession session) {
        return (UploadStatus) session.getAttribute("upload_status");
    }
}


