package tpcs.controller.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import tpcs.pojo.Course;
import tpcs.service.ICourseService;

import java.util.List;

@RequestMapping("/")
@Controller(value = "page-course-controller")
public class CourseController {
    @Autowired
    private ICourseService courseService;

    /** 课程列表 */
    @GetMapping("course-list")
    public String questionList(Model model) {
        List<Course> courseList = courseService.courseList();
        model.addAttribute("courseList", courseList);
        return "page/course-list";
    }
}
