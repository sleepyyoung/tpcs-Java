package tpcs.controller.api;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tpcs.pojo.Question;
import tpcs.pojo.Result;
import tpcs.pojo.User;
import tpcs.service.IQuestionGarbageService;
import tpcs.service.IUserService;
import tpcs.util.crypt.AESUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping("/api/garbage/question")
public class QuestionGarbageController {
    @Autowired
    private IQuestionGarbageService questionGarbageService;
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
    public String list(HttpServletRequest request,
                       @RequestParam Integer page,
                       @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionGarbageService.questionGarbageListSimple(page, limit);
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 彻底删除题目 */
    @PostMapping("/delete/{id}")
    public Result delete(HttpServletRequest request,
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

        if (userId == null || !userId.equals(questionGarbageService.getQuestionById(id).getUser().getId())) {
            return new Result(false, "修改题目失败，原因：您并非该题目的创建者，无权删除！");
        }
        return questionGarbageService.deleteQuestionById(id);
    }

    /** 恢复题目 */
    @PostMapping("/recover/{id}")
    public Result recover(HttpServletRequest request,
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

        if (userId == null || !userId.equals(questionGarbageService.getQuestionById(id).getUser().getId())) {
            return new Result(false, "修改题目失败，原因：您并非该题目的创建者，无权恢复！");
        }
        return questionGarbageService.recoverQuestionById(id);
    }

    /** 批量彻底删除 */
    @PostMapping("/batch-delete/")
    public Result delete(HttpServletRequest request,
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
            if (userId == null || !userId.equals(questionGarbageService.getQuestionById(id).getUser().getId())) {
                return new Result(false, "修改题目失败，原因：您并非这些题目中某些或全部题目的的创建者，无权删除！");
            }
        }
        return questionGarbageService.batchDeleteQuestion(ids);
    }

    /** 批量恢复题目 */
    @PostMapping("/batch-recover/")
    public Result recover(HttpServletRequest request,
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
            if (userId == null || !userId.equals(questionGarbageService.getQuestionById(id).getUser().getId())) {
                return new Result(false, "修改题目失败，原因：您并非这些题目中某些或全部题目的的创建者，无权恢复！");
            }
        }
        return questionGarbageService.batchRecoverQuestion(ids);
    }

    /** 根据题目分值查询 */
    @GetMapping("/query/score/{score}")
    public String queryByScore(HttpServletRequest request,
                               @PathVariable Double score,
                               @RequestParam Integer page,
                               @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionGarbageService.queryByScore(score, page, limit);
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
            questionPageInfo = questionGarbageService.queryByScore(null, max, page, limit);
        } else if (max < 0 && min > 0) {
            questionPageInfo = questionGarbageService.queryByScore(min, null, page, limit);
        } else if (max < 0 && min < 0) {
            questionPageInfo = new PageInfo<>();
        } else {
            questionPageInfo = questionGarbageService.queryByScore(min, max, page, limit);
        }
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 根据题型查询 */
    @GetMapping("/query/type/{type}")
    public String queryByType(HttpServletRequest request,
                              @PathVariable Integer type,
                              @RequestParam Integer page,
                              @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionGarbageService.queryByType(type, page, limit);
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 根据难度查询 */
    @GetMapping("/query/difficulty/{difficulty}")
    public String queryByDifficulty(HttpServletRequest request,
                                    @PathVariable Integer difficulty,
                                    @RequestParam Integer page,
                                    @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionGarbageService.queryByDifficulty(difficulty, page, limit);
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 根据所属课程查询 */
    @GetMapping("/query/course/{course}")
    public String queryByCourse(HttpServletRequest request,
                                @PathVariable Integer course,
                                @RequestParam Integer page,
                                @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionGarbageService.queryByCourse(course, page, limit);
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 根据题目内容查询 */
    @GetMapping("/query/question-content/{content}")
    public String queryByQuestionContent(HttpServletRequest request,
                                         @PathVariable String content,
                                         @RequestParam Integer page,
                                         @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionGarbageService.queryByQuestionContent(content, page, limit);
        return JSON.toJSONString(new Result(0, "", questionPageInfo.getTotal(), list2Map4IndexQuestion(request, questionPageInfo.getList())));
    }

    /** 根据答案内容查询 */
    @GetMapping("/query/answer-content/{content}")
    public String queryByAnswerContent(HttpServletRequest request,
                                       @PathVariable String content,
                                       @RequestParam Integer page,
                                       @RequestParam Integer limit) {
        PageInfo<Question> questionPageInfo = questionGarbageService.queryByAnswerContent(content, page, limit);
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
            questionPageInfo = questionGarbageService.queryByAnything(null, type, difficulty, course, questionContent, answerContent, page, limit);
        } else {
            try {
                score = Double.parseDouble(scoreS);
                questionPageInfo = questionGarbageService.queryByAnything(score, type, difficulty, course, questionContent, answerContent, page, limit);
            } catch (NumberFormatException e) {
                String[] split = scoreS.split(",");
                String minS = split[0];
                String maxS = split[1];
                if ("".equals(minS) && "".equals(maxS) || !"".equals(minS) && !"".equals(maxS)) {
                    questionPageInfo = questionGarbageService.queryByAnything(null, type, difficulty, course, questionContent, answerContent, page, limit);
                } else if (!"".equals(minS)) {
                    min = Double.parseDouble(minS);
                    questionPageInfo = questionGarbageService.queryByAnything(min, null, type, difficulty, course, questionContent, answerContent, page, limit);
                } else {
                    max = Double.parseDouble(maxS);
                    questionPageInfo = questionGarbageService.queryByAnything(null, max, type, difficulty, course, questionContent, answerContent, page, limit);
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
        PageInfo<Question> questionPageInfo = questionGarbageService.queryByUserId(userId, page, limit);
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
