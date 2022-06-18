package tpcs.controller.api;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tpcs.pojo.QuestionType;
import tpcs.pojo.Result;
import tpcs.service.IQuestionService;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@RequestMapping("/api/question-type")
@RestController(value = "api-question-type-controller")
public class QuestionTypeController {
    @Autowired
    private IQuestionService questionService;

    private List<LinkedHashMap<String, Object>> list2Map4IndexCourse(List<QuestionType> list) {
        List<LinkedHashMap<String, Object>> result = new ArrayList<>();
        for (QuestionType type : list) {
            LinkedHashMap<String, Object> map = new LinkedHashMap<>();
            map.put("id", type.getId());
            map.put("name", type.getName());
            result.add(map);
        }
        return result;
    }

    /** 题型列表 */
    @GetMapping("/list")
    public String list(@RequestParam Integer page, @RequestParam Integer limit) {
        PageInfo<QuestionType> questionTypePageInfo = questionService.questionTypeList(page, limit);
        return JSON.toJSONString(new Result(0, "", questionTypePageInfo.getTotal(), list2Map4IndexCourse(questionTypePageInfo.getList())));
    }

    /** 新增题型 */
    @PostMapping("/add/{questionTypeName}")
    public Result add(@PathVariable String questionTypeName) {
        return questionService.addQuestionType(questionTypeName);
    }
}
