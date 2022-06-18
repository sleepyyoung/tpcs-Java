package tpcs.controller.api;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

@RestController
@RequestMapping("/")
public class UploadController {
    @Value("${upload.md-img-path}")
    private String uploadPath4MdImg;

    /** markdown中的图片上传 */
    @PostMapping("/upload")
    public JSONObject uploadMarkdownImg(@RequestParam(value = "editormd-image-file") MultipartFile file) {
        String trueFileName = file.getOriginalFilename();
        String suffix = trueFileName.substring(trueFileName.lastIndexOf("."));
        String fileName = System.currentTimeMillis() + suffix;

        JSONObject res = new JSONObject();
        int success = 1;
        String message = "upload success!";

        try {
            File realPath = new File(uploadPath4MdImg);
            InputStream is = file.getInputStream();
            OutputStream os = new FileOutputStream(new File(realPath, fileName));
            int len;
            byte[] buffer = new byte[1024];
            while ((len = is.read(buffer)) != -1) {
                os.write(buffer, 0, len);
                os.flush();
            }
            os.close();
            is.close();
            res.put("url", "/files/" + fileName);
        } catch (Exception e) {
            success = 0;
            message = "图片上传失败！详情： "+e.getMessage();
        }

        res.put("success", success);
        res.put("message", message);
        return res;
    }
}
