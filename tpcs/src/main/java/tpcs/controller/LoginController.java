package tpcs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tpcs.pojo.User;
import tpcs.service.IUserService;
import tpcs.util.crypt.AESUtil;
import tpcs.util.crypt.SHAUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RequestMapping("/login")
@Controller
public class LoginController {
    @Autowired
    private IUserService userService;

    @GetMapping
    public String login(Model model) {
        model.addAttribute("title", "登 录");
        return "page/login";
    }

    @PostMapping
    public String doLogin(HttpServletRequest request,
                          HttpServletResponse response,
                          @RequestParam String username,
                          @RequestParam String password,
                          @Nullable @RequestParam("stay-login") String stayLogin,
                          Model model) throws Exception {
        User user = new User(username, SHAUtil.encryptBySHA512(password));
        User existingUser = userService.selectByUsernameAndPassword(user.getUsername(), user.getPassword());

        if (existingUser != null) {
            if (existingUser.getStatus() == 2) {
                model.addAttribute("title", "该账号已被冻结，请联系管理员");
                model.addAttribute("username", username);
                return "page/login";
            }
            if (existingUser.getStatus() == 1) {
                model.addAttribute("title", "用户名或密码输入错误");
                model.addAttribute("username", username);
                return "page/login";
            }
            String encryptUsername = AESUtil.encryptByAES(username);
            Cookie cookie = new Cookie("username", encryptUsername);
            cookie.setHttpOnly(true);
            cookie.setMaxAge("on".equals(stayLogin) ? 30 * 24 * 60 * 60 : -1);
            response.addCookie(cookie);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            return "redirect:";
        } else {
            model.addAttribute("title", "用户名或密码输入错误");
            model.addAttribute("username", username);
            return "page/login";
        }
    }
}