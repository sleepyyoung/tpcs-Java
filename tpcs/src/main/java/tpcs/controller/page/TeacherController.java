package tpcs.controller.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import tpcs.service.IUserService;

@RequestMapping("/")
@Controller(value = "page-teacher-controller")
public class TeacherController {
    @Autowired
    private IUserService userService;

    /** 教师列表 */
    @GetMapping("teacher-list")
    public String teacherList() {
        return "page/teacher-list";
    }

    /** 教师审核 */
    @GetMapping("teacher-audit/{userid}")
    public String teacherAudit(@PathVariable Integer userid, Model model) {
        model.addAttribute("user", userService.selectById(userid));
        return "page/teacher-audit";
    }
}
