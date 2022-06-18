package tpcs.controller.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import tpcs.pojo.*;
import tpcs.service.ICourseService;
import tpcs.service.IQuestionGarbageService;
import tpcs.service.IQuestionService;
import tpcs.service.IUserService;
import tpcs.util.crypt.AESUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/")
@Controller(value = "page-question-controller")
public class QuestionController {
    @Autowired
    private IQuestionService questionService;
    @Autowired
    private IQuestionGarbageService questionGarbageService;
    @Autowired
    private ICourseService courseService;
    @Autowired
    private IUserService userService;

    /**
     * 题目列表
     */
    @GetMapping("question-list")
    public String questionList(HttpServletRequest request, Model model) {
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
                        model.addAttribute("isAdmin", userService.isAdminByUsername(username));
                    }
                } catch (Exception ignored) {
                }
            }
        }
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj instanceof User) {
            User user = (User) obj;
            User existingUser = userService.selectByUsernameAndPassword(((User) obj).getUsername(), ((User) obj).getPassword());
            if (existingUser != null) {
                model.addAttribute("isAdmin", userService.isAdminByUsername(user.getUsername()));
            }
        }
        List<QuestionType> questionTypeList = questionService.questionTypeList();
        List<QuestionDifficulty> questionDifficultyList = questionService.questionDifficultyList();
        List<Course> courseList = courseService.courseList();

        model.addAttribute("questionTypeList", questionTypeList);
        model.addAttribute("questionDifficultyList", questionDifficultyList);
        model.addAttribute("courseList", courseList);
        return "page/question-list";
    }

    /**
     * 题目分布
     */
    @GetMapping("question-distributed")
    public String questionDistributed(Model model) {
        model.addAttribute("courseList", courseService.courseList());
        return "page/question-distributed";
    }

    /**
     * 题目详情
     */
    @GetMapping("question/{id}")
    public String questionDetail(@PathVariable Integer id, Model model) {
        model.addAttribute("question", questionService.getQuestionById(id));
        return "page/question-detail";
    }

    /**
     * 回收站题目详情
     */
    @GetMapping("garbage/question/{id}")
    public String garbageQuestionDetail(@PathVariable Integer id, Model model) {
        model.addAttribute("question", questionGarbageService.getQuestionById(id));
        return "page/question-detail";
    }

    /** 编辑题目 */
    @GetMapping("question/edit/{id}")
    public String editQuestion(HttpServletRequest request, @PathVariable Integer id, Model model) {
        Cookie[] cookies = request.getCookies();
        model.addAttribute("user", null);
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                try {
                    model.addAttribute("userId", userService.selectByUsername(AESUtil.decryptByAES(cookie.getValue())).getId());
                } catch (Exception ignored) {
                }
            }
        }
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj instanceof User) {
            model.addAttribute("userId", userService.selectByUsername(((User) obj).getUsername()).getId());
        }

        Question question = questionService.getQuestionById(id);
        List<QuestionType> questionTypeList = questionService.questionTypeList();
        List<QuestionDifficulty> questionDifficultyList = questionService.questionDifficultyList();
        List<Course> courseList = courseService.courseList();

        model.addAttribute("question", question);
        model.addAttribute("questionTypeList", questionTypeList);
        model.addAttribute("questionDifficultyList", questionDifficultyList);
        model.addAttribute("courseList", courseList);
        return "page/question-edit";
    }

    /** 添加题目 */
    @GetMapping("question/add")
    public String addQuestion(HttpServletRequest request, Model model) {
        Cookie[] cookies = request.getCookies();
        model.addAttribute("user", null);
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                try {
                    model.addAttribute("userId", userService.selectByUsername(AESUtil.decryptByAES(cookie.getValue())).getId());
                } catch (Exception ignored) {
                }
            }
        }
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj instanceof User) {
            model.addAttribute("userId", userService.selectByUsername(((User) obj).getUsername()).getId());
        }

        List<QuestionType> questionTypeList = questionService.questionTypeList();
        List<QuestionDifficulty> questionDifficultyList = questionService.questionDifficultyList();
        List<Course> courseList = courseService.courseList();

        model.addAttribute("questionTypeList", questionTypeList);
        model.addAttribute("questionDifficultyList", questionDifficultyList);
        model.addAttribute("courseList", courseList);
        return "page/question-add";
    }

    /** 回收站 */
    @GetMapping("question-garbage")
    public String questionGarbage(HttpServletRequest request, Model model) {
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
                        model.addAttribute("isAdmin", userService.isAdminByUsername(username));
                    }
                } catch (Exception ignored) {
                }
            }
        }
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj instanceof User) {
            User user = (User) obj;
            User existingUser = userService.selectByUsernameAndPassword(((User) obj).getUsername(), ((User) obj).getPassword());
            if (existingUser != null) {
                model.addAttribute("isAdmin", userService.isAdminByUsername(user.getUsername()));
            }
        }
        List<QuestionType> questionTypeList = questionService.questionTypeList();
        List<QuestionDifficulty> questionDifficultyList = questionService.questionDifficultyList();
        List<Course> courseList = courseService.courseList();

        model.addAttribute("questionTypeList", questionTypeList);
        model.addAttribute("questionDifficultyList", questionDifficultyList);
        model.addAttribute("courseList", courseList);
        return "page/question-garbage";
    }
}
