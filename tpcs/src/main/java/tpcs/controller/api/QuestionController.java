package tpcs.controller.api;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;
import tpcs.pojo.*;
import tpcs.service.IQuestionService;
import tpcs.service.IUserService;
import tpcs.util.crypt.AESUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@RestController(value = "api-question-controller")
@RequestMapping("/api/question")
public class QuestionController {
    private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);

    @Autowired
    private IQuestionService questionService;
    @Autowired
    private IUserService userService;

    private List<LinkedHashMap<String, Object>> list2Map4IndexQuestion(HttpServletRequest request, List<Question> list) {
        Integer userId = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                String username;
                try {
                    username = AESUtil.decryptByAES(cookie.getValue());
                    userId = userService.selectByUsername(username).getId();
                } catch (Exception ignored) {
                }
            }
        }
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj instanceof User) {
            User user = (User) obj;
            userId = userService.selectByUsername(user.getUsername()).getId();
        }

        List<LinkedHashMap<String, Object>> result = new ArrayList<>();
        for (Question question : list) {
            LinkedHashMap<String, Object> map = new LinkedHashMap<>();
            map.put("id", question.getId());
            map.put("score", question.getScore());
            map.put("type", question.getType().getName());
            map.put("difficulty", question.getDifficulty().getName());
            map.put("course", question.getCourse().getName());
            map.put("content", question.getQuestionTxt());
            map.put("LAY_DISABLED", !(userId != null && userId.equals(question.getUser().getId())));
            result.add(map);
        }
        return result;
    }

    /** 题目列表 */
    @GetMapping("/list")
    public String questionList(HttpServletRequest request,
                               @RequestParam Integer page,
                               @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionService.questionListSimple(page, limit);
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 题目分布 */
    @GetMapping("/distributed/{courseId}")
    public String questionDistributed(@PathVariable @Nullable Integer courseId) {
        Map<String, Object> result = new HashMap<>();
        List<String> y = new ArrayList<>();
        for (QuestionType questionType : questionService.questionTypeList()) {
            y.add(questionType.getName());
        }
        result.put("y", y);
        List<Double> x = questionService.scoreList();
        result.put("x", x);
        List<List<Object>> dExample = new ArrayList();
        for (int iy = 0; iy < y.size(); iy++) {
            for (int ix = 0; ix < x.size(); ix++) {
                Integer c = questionService.getQuestionCountByCourseIdAndQuestionTypeAndScoreAndDifficulty(
                        courseId,
                        questionService.getQuestionTypeByName(y.get(iy)).getId(),
                        x.get(ix),
                        1);
                if (c != 0) {
                    List<Object> list = new ArrayList<>();
                    list.add(x.get(ix));
                    list.add(questionService.getQuestionTypeByName(y.get(iy)).getName());
                    list.add(c);
                    dExample.add(list);
                }
            }
        }
        result.put("de", dExample);
        List<List<Object>> dMiddle = new ArrayList();
        for (int iy = 0; iy < y.size(); iy++) {
            for (int ix = 0; ix < x.size(); ix++) {
                Integer c = questionService.getQuestionCountByCourseIdAndQuestionTypeAndScoreAndDifficulty(
                        courseId,
                        questionService.getQuestionTypeByName(y.get(iy)).getId(),
                        x.get(ix),
                        2);
                if (c != 0) {
                    List<Object> list = new ArrayList<>();
                    list.add(x.get(ix));
                    list.add(questionService.getQuestionTypeByName(y.get(iy)).getName());
                    list.add(c);
                    dMiddle.add(list);
                }
            }
        }
        result.put("dm", dMiddle);
        List<List<Object>> dHard = new ArrayList();
        for (int iy = 0; iy < y.size(); iy++) {
            for (int ix = 0; ix < x.size(); ix++) {
                Integer c = questionService.getQuestionCountByCourseIdAndQuestionTypeAndScoreAndDifficulty(
                        courseId,
                        questionService.getQuestionTypeByName(y.get(iy)).getId(),
                        x.get(ix),
                        3);
                if (c != 0) {
                    List<Object> list = new ArrayList<>();
                    list.add(x.get(ix));
                    list.add(questionService.getQuestionTypeByName(y.get(iy)).getName());
                    list.add(c);
                    dHard.add(list);
                }
            }
        }
        result.put("dh", dHard);
        return JSON.toJSONString(new Result(0, "", result));
    }

    /** 新增题目 */
    @PostMapping("/add")
    public Result addQuestion(@RequestBody SimplifyQuestion question) {
        return questionService.addQuestion(question);
    }

    /** 编辑题目 */
    @PostMapping("/edit")
    public Result editQuestion(HttpServletRequest request,
                               @RequestBody SimplifyQuestion question) {
        logger.error(question.toString());
        Cookie[] cookies = request.getCookies();
        Integer userId = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                try {
                    userId = userService.selectByUsername(AESUtil.decryptByAES(cookie.getValue())).getId();
                } catch (Exception ignored) {
                }
            }
        }
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj instanceof User) {
            userId = userService.selectByUsername(((User) obj).getUsername()).getId();
        }
        logger.error(userId + "");
        if (userId == null || !userId.equals(question.getUser())) {
            return new Result(false, "修改题目失败，原因：您并非该题目的创建者，无权编辑！");
        }
        return questionService.updateQuestion(question);
    }

    /** 移动题目至回收站 */
    @PostMapping("/remove/{id}")
    public Result removeQuestion2Garbage(HttpServletRequest request,
                                         @PathVariable Integer id) {
        Cookie[] cookies = request.getCookies();
        Integer userId = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                try {
                    userId = userService.selectByUsername(AESUtil.decryptByAES(cookie.getValue())).getId();
                } catch (Exception ignored) {
                }
            }
        }
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj instanceof User) {
            userId = userService.selectByUsername(((User) obj).getUsername()).getId();
        }

        if (userId == null || !userId.equals(questionService.getQuestionById(id).getUser().getId())) {
            return new Result(false, "修改题目失败，原因：您并非该题目的创建者，无权移除！");
        }
        return questionService.removeQuestion2Garbage(id);
    }

    /** 批量移动至回收站 */
    @PostMapping("/batch-remove/")
    public Result removeQuestion2Garbage(HttpServletRequest request,
                                         @RequestBody List<Integer> ids) {
        Cookie[] cookies = request.getCookies();
        Integer userId = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                try {
                    userId = userService.selectByUsername(AESUtil.decryptByAES(cookie.getValue())).getId();
                } catch (Exception ignored) {
                }
            }
        }
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj instanceof User) {
            userId = userService.selectByUsername(((User) obj).getUsername()).getId();
        }

        for (Integer id : ids) {
            if (userId == null || !userId.equals(questionService.getQuestionById(id).getUser().getId())) {
                return new Result(false, "修改题目失败，原因：您并非这些题目中某些或全部题目的的创建者，无权移除！");
            }
        }
        return questionService.batchRemoveQuestion2Garbage(ids);
    }

    /** 根据题目分值查询 */
    @GetMapping("/query/score/{score}")
    public String queryByScore(HttpServletRequest request,
                               @PathVariable Double score,
                               @RequestParam Integer page,
                               @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionService.queryByScore(score, page, limit);
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 根据题目分值查询 */
    @GetMapping("/query/score/{min}/{max}")
    public String queryByScore(HttpServletRequest request,
                               @PathVariable Double min,
                               @PathVariable Double max,
                               @RequestParam Integer page,
                               @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo;
        if (min < 0 && max > 0) {
            questionPageInfo = questionService.queryByScore(null, max, page, limit);
        } else if (max < 0 && min > 0) {
            questionPageInfo = questionService.queryByScore(min, null, page, limit);
        } else if (max < 0 && min < 0) {
            questionPageInfo = new PageInfo<>();
        } else {
            questionPageInfo = questionService.queryByScore(min, max, page, limit);
        }
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 根据题型查询 */
    @GetMapping("/query/type/{type}")
    public String queryByType(HttpServletRequest request,
                              @PathVariable Integer type,
                              @RequestParam Integer page,
                              @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionService.queryByType(type, page, limit);
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 根据难度查询 */
    @GetMapping("/query/difficulty/{difficulty}")
    public String queryByDifficulty(HttpServletRequest request,
                                    @PathVariable Integer difficulty,
                                    @RequestParam Integer page,
                                    @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionService.queryByDifficulty(difficulty, page, limit);
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 根据所属课程查询 */
    @GetMapping("/query/course/{course}")
    public String queryByCourse(HttpServletRequest request,
                                @PathVariable Integer course,
                                @RequestParam Integer page,
                                @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionService.queryByCourse(course, page, limit);
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 根据题目内容查询 */
    @GetMapping("/query/question-content/{content}")
    public String queryByQuestionContent(HttpServletRequest request,
                                         @PathVariable String content,
                                         @RequestParam Integer page,
                                         @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionService.queryByQuestionContent(content, page, limit);
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 根据答案内容查询 */
    @GetMapping("/query/answer-content/{content}")
    public String queryByAnswerContent(HttpServletRequest request,
                                       @PathVariable String content,
                                       @RequestParam Integer page,
                                       @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionService.queryByAnswerContent(content, page, limit);
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 综合所有条件查询 */
    @GetMapping("/query")
    public String queryByAnything(HttpServletRequest request,
                                  @RequestParam("page") Integer page,
                                  @RequestParam("limit") Integer limit,
                                  @RequestParam("score") String scoreS,
                                  @RequestParam("type") Integer type,
                                  @RequestParam("difficulty") Integer difficulty,
                                  @RequestParam("course") Integer course,
                                  @RequestParam("questionContent") String questionContent,
                                  @RequestParam("answerContent") String answerContent) {
        questionContent = "".equals(questionContent) ? null : questionContent;
        answerContent = "".equals(answerContent) ? null : answerContent;
        Double score = null;
        Double min = null;
        Double max = null;
        PageInfo<Question> questionPageInfo;
        if ("".equals(scoreS.trim())) {
            questionPageInfo = questionService.queryByAnything(null, type, difficulty, course, questionContent, answerContent, page, limit);
        } else {
            try {
                score = Double.parseDouble(scoreS);
                questionPageInfo = questionService.queryByAnything(score, type, difficulty, course, questionContent, answerContent, page, limit);
            } catch (NumberFormatException e) {
                String[] split = scoreS.split(",");
                String minS, maxS;
                if (split.length == 2) {
                    minS = split[0];
                    maxS = split[1];
                } else {
                    minS = split[0];
                    maxS = "";
                }
                if ("".equals(minS) && "".equals(maxS) || !"".equals(minS) && !"".equals(maxS)) {
                    questionPageInfo = questionService.queryByAnything(null, type, difficulty, course, questionContent, answerContent, page, limit);
                } else if (!"".equals(minS)) {
                    min = Double.parseDouble(minS);
                    questionPageInfo = questionService.queryByAnything(min, null, type, difficulty, course, questionContent, answerContent, page, limit);
                } else {
                    max = Double.parseDouble(maxS);
                    questionPageInfo = questionService.queryByAnything(null, max, type, difficulty, course, questionContent, answerContent, page, limit);
                }
            }
        }
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 只看我的 */
    @GetMapping("/query/only-me/")
    public String queryByOnlyMe(HttpServletRequest request,
                                @RequestParam("page") Integer page,
                                @RequestParam("limit") Integer limit) {
        Cookie[] cookies = request.getCookies();
        Integer userId = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                try {
                    userId = userService.selectByUsername(AESUtil.decryptByAES(cookie.getValue())).getId();
                } catch (Exception ignored) {
                }
            }
        }
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj instanceof User) {
            userId = userService.selectByUsername(((User) obj).getUsername()).getId();
        }
        PageInfo<Question> questionPageInfo = questionService.queryByUserId(userId, page, limit);
        List<LinkedHashMap<String, Object>> result = new ArrayList<>();
        for (Question question : questionPageInfo.getList()) {
            LinkedHashMap<String, Object> map = new LinkedHashMap<>();
            map.put("id", question.getId());
            map.put("score", question.getScore());
            map.put("type", question.getType().getName());
            map.put("difficulty", question.getDifficulty().getName());
            map.put("course", question.getCourse().getName());
            map.put("content", question.getQuestionTxt());
            map.put("LAY_DISABLED", false);
            result.add(map);
        }
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), result));
    }
}
