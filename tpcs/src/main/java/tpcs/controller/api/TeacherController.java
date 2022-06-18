package tpcs.controller.api;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;
import tpcs.pojo.Result;
import tpcs.pojo.User;
import tpcs.service.IUserService;
import tpcs.util.MailUtil;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@RequestMapping("/api/teacher")
@RestController(value = "api-teacher-controller")
public class TeacherController {
    private static final Logger logger = LoggerFactory.getLogger(TeacherController.class);

    @Autowired
    private IUserService userService;
    @Autowired
    private MailUtil mailUtil;

    private List<LinkedHashMap<String, Object>> list2Map4IndexCourse(List<User> list) {
        List<LinkedHashMap<String, Object>> result = new ArrayList<>();
        for (User user : list) {
            LinkedHashMap<String, Object> map = new LinkedHashMap<>();
            map.put("id", user.getId());
            map.put("name", user.getUsername());
            map.put("email", user.getEmail());
            map.put("status", user.getStatus());
            result.add(map);
        }
        return result;
    }

    /** 教师列表 */
    @GetMapping("/list")
    public String questionList(@RequestParam Integer page, @RequestParam Integer limit) {
        PageInfo<User> teacherPageInfo = userService.notAdminUserList(page, limit);
        return JSON.toJSONString(new Result(0, "", teacherPageInfo.getTotal(), list2Map4IndexCourse(teacherPageInfo.getList())));
    }

    /** 教师审核 */
    @PostMapping("/audit")
    public Result teacherAudit(@RequestParam Integer userid,
                               @RequestParam String username,
                               @RequestParam String email,
                               @RequestParam Boolean pass,
                               @RequestParam @Nullable String reason) {
        if (pass) {
            if (userService.updateUserStatus(userid, 0)) {
                try {
                    mailUtil.sendHtmlMail(email,
                            "TPCS 用户注册审核通过",
                            "您近期注册的TPCS用户 " + username + " 已通过审核，欢迎使用！");
                } catch (Exception e) {
                    logger.error("用户通过审核的邮件发送失败，原因：" + e.getMessage());
                    return new Result(false, "用户已通过审核，修改用户状态（待审核 -> 正常）成功，但是通知邮件发送失败！");
                }
                return new Result(true, null);
            } else {
                return new Result(false, "修改用户状态（待审核 -> 正常）失败！");
            }
        } else {
            if (userService.deleteUser(userid)) {
                try {
                    mailUtil.sendHtmlMail(email,
                            "TPCS 用户注册审核未通过",
                            "您近期注册的TPCS用户 " + username + " 审核未通过，请重新注册，原因：<textarea>" + reason + "</textarea>");
                } catch (Exception e) {
                    logger.error("用户未通过审核的邮件发送失败，原因：" + e.getMessage());
                    return new Result(false, "用户未通过审核通知邮件发送失败！");
                }
                return new Result(true, null);
            } else {
                return new Result(false, "删除未通过审核的用户信息失败！");
            }
        }
    }

    /** 教师冻结 */
    @PostMapping("/freeze")
    public Result teacherFreeze(@RequestParam Integer userid,
                                @RequestParam String username,
                                @RequestParam String email,
                                @RequestParam String reason) {
        if (userService.updateUserStatus(userid, 2)) {
            try {
                mailUtil.sendHtmlMail(email,
                        "TPCS 用户冻结通知",
                        "您的TPCS账号 " + username + " 已被冻结，解冻请联系管理员！原因：" + reason);
            } catch (Exception e) {
                logger.error("用户已冻结的邮件发送失败，原因：" + e.getMessage());
                return new Result(false, "用户已冻结，修改用户状态（待审核 -> 已冻结）成功，但是通知邮件发送失败！");
            }
            return new Result(true, null);
        } else {
            return new Result(false, "修改用户状态（待审核 -> 已冻结）失败！");
        }
    }

    /** 教师解冻 */
    @PostMapping("/thaw")
    public Result teacherThaw(@RequestParam Integer userid,
                              @RequestParam String username,
                              @RequestParam String email) {
        if (userService.updateUserStatus(userid, 0)) {
            try {
                mailUtil.sendHtmlMail(email,
                        "TPCS 用户解冻通知",
                        "您的TPCS账号 " + username + " 已解冻！");
            } catch (Exception e) {
                logger.error("用户已解冻的邮件发送失败，原因：" + e.getMessage());
                return new Result(false, "用户已解冻，修改用户状态（已冻结 -> 正常）成功，但是通知邮件发送失败！");
            }
            return new Result(true, null);
        } else {
            return new Result(false, "修改用户状态（已冻结 -> 正常）失败！");
        }
    }
}
