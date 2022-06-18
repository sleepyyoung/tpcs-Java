package tpcs.controller.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import tpcs.pojo.User;
import tpcs.service.IUserService;
import tpcs.util.crypt.AESUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RequestMapping("/")
@Controller(value = "page-file-controller")
public class FileController {
    @Autowired
    private IUserService userService;

    /** 文件列表 */
    @GetMapping("file-list")
    public String fileList(HttpServletRequest request, Model model) {
        Cookie[] cookies = request.getCookies();
        model.addAttribute("isAdmin", false);
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                String username;
                try {
                    username = AESUtil.decryptByAES(cookie.getValue());
                    if (userService.selectUserCountByUsername(username) > 0) {
                        model.addAttribute("isAdmin", userService.isAdminByUsername(username));
                    }
                } catch (Exception ignored) {
                }
            }
        }
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj instanceof User) {
            User user = (User) obj;
            User existingUser = userService.selectByUsernameAndPassword(user.getUsername(), user.getPassword());
            if (existingUser != null) {
                model.addAttribute("isAdmin", userService.isAdminByUsername(user.getUsername()));
            }
        }
        return "page/file-list";
    }

    /** 试卷上传 */
    @GetMapping("file-upload")
    public String uploadFile() {
        return "page/file-upload";
    }
}
