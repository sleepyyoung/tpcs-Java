package tpcs;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import tpcs.dao.QuestionMapper;
import tpcs.dao.UserMapper;
import tpcs.pojo.User;
import tpcs.service.IFileService;
import tpcs.service.IQuestionService;
import tpcs.service.IUserService;
import tpcs.util.MailUtil;
import tpcs.util.RedisUtil;

import java.util.List;

@SpringBootTest
class TpcsApplicationTests {
    @Autowired
    private QuestionMapper questionMapper;
    @Autowired
    private IQuestionService questionService;
    @Autowired
    private IFileService fileService;
    @Autowired
    private IUserService userService;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private MailUtil mailUtil;
    @Autowired
    private RedisUtil redisUtil;
    @Value("${upload.path}")
    private String uploadPath;
    @Value("${spring.profiles.active}")
    private String env;
    @Value("${spring.redis.subpub.topic.register}")
    private String topic;
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Test
    void contextLoads() {
        List<User> adminUserList = userService.adminUserList();
        System.out.println(adminUserList);
    }
}
