package tpcs.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSendException;
import org.springframework.web.bind.annotation.*;
import tpcs.pojo.Result;
import tpcs.pojo.User;
import tpcs.service.IUserService;
import tpcs.util.MailUtil;
import tpcs.util.RedisUtil;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RequestMapping("/api/user")
@RestController(value = "api-user-controller")
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private MailUtil mailUtil;

    /**
     * 更新用户名
     */
    @PostMapping("/{id}/update-username")
    public Result updateUsername(HttpServletRequest request,
                                 HttpServletResponse response,
                                 @PathVariable("id") Integer userId,
                                 @RequestBody String newUsername) {
        User user = userService.selectById(userId);
        String oldUsername = user.getUsername();
        user.setUsername(newUsername);

        if (userService.selectByUsername(newUsername) != null) {
            return new Result(false, "修改用户名失败，该用户名 " + newUsername + " 已存在！");
        }

        if (userService.modifyUser(user)) {
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
                if (oldUsername.equals(((User) obj).getUsername())) {
                    session.invalidate();
                }
            }
            return new Result(true, "");
        } else {
            return new Result(false, "修改用户名失败");
        }
    }

    /**
     * 向新邮箱发送验证码
     */
    @PostMapping("/{id}/send-vcode")
    public Result sendVcode(@PathVariable("id") Integer userId,
                            @RequestBody String email) {
        if (userService.selectUserCountByEmail(email) > 0) {
            return new Result(false, "该邮箱已被其他用户绑定！");
        }
        User user = userService.selectById(userId);
        int vcode = (int) ((Math.random() * 9 + 1) * 1000);
        if (!redisUtil.set(email, String.valueOf(vcode), 300)) {
            return new Result(false, "验证码发送失败，请重试！");
        }
        try {
            mailUtil.sendHtmlMail(email,
                    "TPCS Verify Code for Modify Email",
                    "您正在将该邮箱更新为TPCS用户 " + user.getUsername() + " 的默认邮箱，验证码为 <strong>" + vcode + "</strong> ，五分钟内有效");
            return new Result(true, "验证码发送成功！");
        } catch (MailSendException e) {
            return new Result(false, "验证码发送失败，请重试！（可能原因：新邮箱不存在或网络不稳定，请检查）");
        } catch (MessagingException e) {
            return new Result(false, "验证码发送失败，请重试！");
        }
    }

    /**
     * 更新邮箱
     */
    @PostMapping("/{id}/update-email")
    public Result updateEmail(@PathVariable("id") Integer userId,
                              @RequestParam String email,
                              @RequestParam String vcode) {
        if (userService.selectUserCountByEmail(email) > 0) {
            return new Result(false, "该邮箱已被其他用户绑定！");
        }
        if (!vcode.equals(String.valueOf(redisUtil.get(email)))) {
            return new Result(false, "邮箱验证码错误或已过期！");
        }
        User user = userService.selectById(userId);
        user.setEmail(email);
        if (userService.modifyUser(user)) {
            return new Result(true, null);
        } else {
            return new Result(false, "修改邮箱失败！");
        }
    }
}
