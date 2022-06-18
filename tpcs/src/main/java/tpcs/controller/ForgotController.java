package tpcs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tpcs.pojo.Result;
import tpcs.pojo.User;
import tpcs.service.IUserService;
import tpcs.util.MailUtil;
import tpcs.util.RedisUtil;
import tpcs.util.crypt.SHAUtil;

import javax.mail.MessagingException;

@RequestMapping("/forgot")
@Controller
public class ForgotController {
    @Autowired
    private IUserService userService;
    @Autowired
    private MailUtil mailUtil;
    @Autowired
    private RedisUtil redisUtil;

    @GetMapping("/{username}")
    public String forgot(@PathVariable String username, Model model) {
        User user = userService.selectByUsername(username);
        if (user == null) {
            return "page/404";
        } else {
            model.addAttribute("username", user.getUsername());
            model.addAttribute("email", user.getEmail());
            return "page/forgot";
        }
    }

    @ResponseBody
    @PostMapping
    public Result doUpdate(@RequestParam String username,
                           @RequestParam String password,
                           @RequestParam String password2,
                           @RequestParam String email,
                           @RequestParam String vcode) throws Exception {
        if (!password.equals(password2)) {
            return new Result(false, "两次输入的密码不一致！");
        }
        if (password.length() > 16 || password.length() < 8) {
            return new Result(false, "密码长度应在8-16位之间！");
        }
        User existingUser = userService.selectByUsernameAndPassword(username,SHAUtil.encryptBySHA512(password));
        if (existingUser!=null) {
            return new Result(false, "修改密码失败，新密码不能与原密码相同！");
        }
        if (!vcode.equals(String.valueOf(redisUtil.get(email)))) {
            return new Result(false, "修改密码失败，邮箱验证码错误或已过期！");
        }
        Boolean modifyPasswordSuccess = userService.modifyPassword(new User(username, SHAUtil.encryptBySHA512(password)));
        if (!modifyPasswordSuccess) {
            return new Result(false, "修改密码失败！");
        }
        return new Result(true, "修改密码成功！");
    }

    @ResponseBody
    @PostMapping("/send-vcode")
    public Result sendVcode(@RequestParam String username,
                            @RequestParam String email) {
        int vcode = (int) ((Math.random() * 9 + 1) * 1000);
        if (!redisUtil.set(email, String.valueOf(vcode), 300)) {
            return new Result(false, "验证码发送失败，请重试！");
        }
        try {
            mailUtil.sendHtmlMail(email,
                    "TPCS Verify Code for Modify Password",
                    "TPCS用户 " + username + " 正在修改密码，验证码为 <strong>" + vcode + "</strong> ，五分钟内有效");
            return new Result(true, "验证码发送成功！");
        } catch (MessagingException e) {
            return new Result(false, "验证码发送失败，请重试！");
        }
    }
}
