package tpcs.listener;

import com.alibaba.fastjson.JSON;
import lombok.SneakyThrows;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Component;
import tpcs.TpcsApplication;
import tpcs.pojo.User;
import tpcs.service.IUserService;
import tpcs.util.MailUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class RegisterRequestListener implements MessageListener {
    @SneakyThrows
    @Override
    public void onMessage(Message message, byte[] bytes) {
        IUserService userService = (IUserService) TpcsApplication.configurableApplicationContext.getBean("userServiceImpl");
        MailUtil mailUtil = (MailUtil) TpcsApplication.configurableApplicationContext.getBean("mailUtil");

        List<User> adminUserList = userService.adminUserList();
        List<String> adminEmailList = new ArrayList<>();
        for (User user : adminUserList) {
            adminEmailList.add(user.getEmail());
        }
        Map<String, Object> userMap = (Map<String, Object>) JSON.parse(new StringRedisSerializer().deserialize(message.getBody()));
        User user = new User(
                String.valueOf(userMap.get("username")),
                String.valueOf(userMap.get("password")),
                String.valueOf(userMap.get("email")),
                String.valueOf(userMap.get("note")),
                Integer.valueOf(String.valueOf(userMap.get("status"))),
                "1".equals(String.valueOf(userMap.get("isAdministrator")))
        );
        for (String email : adminEmailList) {
            mailUtil.sendHtmlMail(email,
                    "TPCS：您有一个注册用户待审核",
                    "新用户 <strong>" + user.getUsername() + "</strong> 发起了注册请求，请尽快前往 <strong>TPCS & 教师管理</strong> 进行审核");
        }
    }
}
