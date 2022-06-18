package tpcs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tpcs.pojo.Result;
import tpcs.pojo.User;
import tpcs.service.IUserService;
import tpcs.util.crypt.AESUtil;
import tpcs.util.crypt.SHAUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@RequestMapping("/update")
@Controller
public class UpdateController {
    @Autowired
    private IUserService userService;

    @GetMapping("/{username}")
    public String update(@PathVariable String username, Model model) {
        Integer existingUserCount = userService.selectUserCountByUsername(username);
        if (existingUserCount == 0) {
            return "page/404";
        }
        model.addAttribute("username", username);
        return "page/update";
    }

    @ResponseBody
    @PostMapping
    public Result doUpdate(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map<String, Object> map) throws Exception {
        String username = String.valueOf(map.get("username"));
        String password = SHAUtil.encryptBySHA512(String.valueOf(map.get("password")));
        String password1 = SHAUtil.encryptBySHA512(String.valueOf(map.get("password1")));
        if (password.equals(password1)) {
            return new Result(false, "修改密码失败，新密码不能与原密码相同！");
        }
        if (String.valueOf(map.get("password1")).length() > 16 || String.valueOf(map.get("password1")).length() < 8) {
            return new Result(false, "新密码长度应在8-16位之间！");
        }
        User existingUser = userService.selectByUsernameAndPassword(username, password);
        if (existingUser == null) {
            return new Result(false, "修改密码失败，用户名或密码错误！");
        }
        Boolean modifyPasswordSuccess = userService.modifyPassword(new User(username, password1));
        if (!modifyPasswordSuccess) {
            return new Result(false, "修改密码失败！");
        }
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                if (username.equals(AESUtil.decryptByAES(cookie.getValue()))) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
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
