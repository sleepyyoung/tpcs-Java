package tpcs.controller.api;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tpcs.pojo.Course;
import tpcs.pojo.Result;
import tpcs.service.ICourseService;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@RequestMapping("/api/course")
@RestController(value = "api-course-controller")
public class CourseController {
    @Autowired
    private ICourseService courseService;

    private List<LinkedHashMap<String, Object>> list2Map4IndexCourse(List<Course> list) {
        List<LinkedHashMap<String, Object>> result = new ArrayList<>();
        for (Course course : list) {
            LinkedHashMap<String, Object> map = new LinkedHashMap<>();
            map.put("id", course.getId());
            map.put("name", course.getName());
            result.add(map);
        }
        return result;
    }

    /** 课程列表 */
    @GetMapping("/list")
    public String list(@RequestParam Integer page, @RequestParam Integer limit) {
        PageInfo<Course> coursePageInfo = courseService.courseList(page, limit);
        return JSON.toJSONString(new Result(0, "", coursePageInfo.getTotal(), list2Map4IndexCourse(coursePageInfo.getList())));
    }

    /** 新增课程 */
    @PostMapping("/add/{courseName}")
    public Result add(@PathVariable String courseName) {
        return courseService.addCourse(courseName);
    }

    /** 删除课程 */
    @PostMapping("/delete/{courseId}")
    public Result delete(@PathVariable Integer courseId) {
        return courseService.deleteCourseById(courseId);
    }
}
