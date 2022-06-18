package tpcs.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/")
@Controller(value = "page-question-type-controller")
public class QuestionTypeController {
    /** 教师列表 */
    @GetMapping("question-type-list")
    public String questionTypeList() {
        return "page/question-type-list";
    }
}
