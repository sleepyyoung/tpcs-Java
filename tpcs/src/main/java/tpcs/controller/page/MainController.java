package tpcs.controller.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tpcs.pojo.Result;
import tpcs.pojo.User;
import tpcs.service.IUserService;
import tpcs.util.crypt.AESUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RequestMapping("/")
@Controller
public class MainController {
    @Autowired
    private IUserService userService;

    /** 首页 */
    @GetMapping("/")
    public String index(HttpServletRequest request, Model model) {
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
                        model.addAttribute("username", username);
                        if (userService.isAdminByUsername(username)) {
                            model.addAttribute("isAdmin", true);
                        }
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
            if (existingUser != null && existingUser.getStatus() == 0) {
                model.addAttribute("username", user.getUsername());
                if (userService.isAdminByUsername(user.getUsername())) {
                    model.addAttribute("isAdmin", true);
                }
            }
        }
        return "main";
    }

    @GetMapping("/index")
    public String welcome(HttpServletRequest request, Model model) {
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
                        model.addAttribute("username", username);
                        if (userService.isAdminByUsername(username)) {
                            model.addAttribute("isAdmin", true);
                        }
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
            if (existingUser != null && existingUser.getStatus() == 0) {
                model.addAttribute("username", user.getUsername());
                if (userService.isAdminByUsername(user.getUsername())) {
                    model.addAttribute("isAdmin", true);
                }
            }
        }
        return "page/index";
    }

    /** 403 */
    @GetMapping("/403")
    public String forbidden() {
        return "page/403";
    }

    /** 注销 */
    @ResponseBody
    @PostMapping("/logout")
    public Result logout(HttpServletRequest request,
                         HttpServletResponse response,
                         @RequestParam String username) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj instanceof User) {
            User user = (User) obj;
            if (username.equals(user.getUsername())) {
                session.invalidate();
            }
        }
        return new Result(true, null);
    }
}
