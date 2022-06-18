package tpcs.controller.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import tpcs.pojo.User;
import tpcs.service.IUserService;
import tpcs.util.crypt.AESUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RequestMapping("/user")
@Controller(value = "page-user-controller")
public class UserController {
    @Autowired
    private IUserService userService;

    /**
     * 用户详情
     */
    @GetMapping("/{username}")
    public String userDetail(HttpServletRequest request,
                             @PathVariable String username,
                             Model model) {
        Cookie[] cookies = request.getCookies();
        model.addAttribute("isMe", false);
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                try {
                    if (username.equals(AESUtil.decryptByAES(cookie.getValue()))) {
                        model.addAttribute("isMe", true);
                    }
                } catch (Exception ignored) {
                }
            }
        }
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj instanceof User) {
            User user = (User) obj;
            if (username.equals(user.getUsername())) {
                model.addAttribute("isMe", true);
            }
        }
        model.addAttribute("user", userService.selectByUsername(username));
        return "page/user-detail";
    }
}
