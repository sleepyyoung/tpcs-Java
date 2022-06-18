package tpcs.controller.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import tpcs.pojo.Course;
import tpcs.service.ICourseService;
import tpcs.service.IQuestionService;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/")
@Controller(value = "page-combine-controller")
public class CombineController {
    @Autowired
    private IQuestionService questionService;
    @Autowired
    private ICourseService courseService;

    @GetMapping("question-combine")
    public String combine(Model model) {
        model.addAttribute("courseList", courseService.courseList());
        return "page/question-combine";
    }

    @GetMapping("question-combine-auto")
    public String autoCombine(Model model) {
        model.addAttribute("questionTypeList", questionService.questionTypeList());
        model.addAttribute("questionDifficultyList", questionService.questionDifficultyList());
        List<Course> courseList = new ArrayList<>();
        courseList.add(new Course(14,"数据库原理及应用"));
        model.addAttribute("courseList", courseList);
//        model.addAttribute("courseList", courseService.courseList());
        return "page/question-combine-auto";
    }
}
