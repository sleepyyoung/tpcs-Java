package tpcs.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import tpcs.pojo.Result;
import tpcs.pojo.User;
import tpcs.service.IUserService;
import tpcs.util.MailUtil;
import tpcs.util.RedisUtil;
import tpcs.util.crypt.SHAUtil;

import javax.mail.MessagingException;

@RequestMapping("/register")
@Controller
public class RegisterController {
    @Autowired
    private IUserService userService;
    @Autowired
    private MailUtil mailUtil;
    @Autowired
    private RedisUtil redisUtil;

    @Value("${spring.redis.subpub.topic.register}")
    private String registerTopic;

    @GetMapping
    public String register() {
        return "page/register";
    }

    @ResponseBody
    @PostMapping
    public Result doRegister(@RequestParam String username,
                             @RequestParam String password,
                             @RequestParam String password2,
                             @RequestParam String email,
                             @RequestParam String vcode,
                             @RequestParam String note) throws Exception {
        if (username == null || "".equals(username.trim())) {
            return new Result(false, "用户名不能为空！");
        }
        if (username.trim().length() > 15) {
            return new Result(false, "用户名长度不能超过15个字符！");
        }
        if (email == null || "".equals(email.trim())) {
            return new Result(false, "请填写邮箱！");
        }
        if (password == null || "".equals(password.trim())) {
            return new Result(false, "密码不能为空！");
        }
        if (password2 == null || "".equals(password2.trim())) {
            return new Result(false, "确认密码不能为空！");
        }
        if (!password.equals(password2)) {
            return new Result(false, "两次输入的密码不一致！");
        }
        if (password.trim().length() > 16 || password.trim().length() < 8) {
            return new Result(false, "密码长度应在8-16位之间！");
        }
        User user = new User(
                username, SHAUtil.encryptBySHA512(password), email, note, 1, false
        );
        if (userService.selectUserCountByUsername(user.getUsername()) > 0) {
            return new Result(false, "用户 " + user.getUsername() + " 已存在！");
        }
        if (userService.selectUserCountByEmail(user.getEmail()) > 0) {
            return new Result(false, "该邮箱 " + user.getEmail() + " 已被其他用户绑定！");
        }
        if (vcode == null || "".equals(vcode.trim())) {
            return new Result(false, "请填写邮箱验证码！");
        }
        if (!vcode.equals(String.valueOf(redisUtil.get(email)))) {
            return new Result(false, "邮箱验证码错误或已过期！");
        }
        Boolean addUserSuccess = userService.addUser(user);
        if (addUserSuccess) {
            redisUtil.publish(registerTopic, JSON.toJSONString(user));
            return new Result(true, null);
        } else {
            return new Result(false, "注册申请失败，请稍后重试！");
        }
    }

    @ResponseBody
    @PostMapping("/send-vcode")
    public Result sendVcode(@RequestParam String email) {
        int vcode = (int) ((Math.random() * 9 + 1) * 1000);
        if (!redisUtil.set(email, String.valueOf(vcode), 300)) {
            return new Result(false, "验证码发送失败，请重试！");
        }
        try {
            mailUtil.sendHtmlMail(email,
                    "TPCS Verify Code for Register",
                    "您正在注册为TPCS用户，验证码为 <strong>" + vcode + "</strong> ，五分钟内有效");
            return new Result(true, "验证码发送成功！");
        } catch (MessagingException e) {
            return new Result(false, "验证码发送失败，请重试！");
        }
    }
}
