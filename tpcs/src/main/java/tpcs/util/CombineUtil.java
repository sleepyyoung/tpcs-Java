package tpcs.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tpcs.pojo.CombineResult;
import tpcs.pojo.QuestionType;
import tpcs.service.IQuestionService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class CombineUtil {
    @Autowired
    private IQuestionService questionService;

    @AllArgsConstructor
    @NoArgsConstructor
    @Data
    public static class CombineQuestion {
        // 该题型题目列表
        List<Integer> questionIdList;
        // 单个题目分值
        Double score;
        // 该题型总分值
        Double tScore;
    }

    // key:questionType Id;
    private Map<Integer, CombineQuestion> combineQuestionMap;

    public Map<Integer, CombineQuestion> getCombineQuestionMap() {
        return combineQuestionMap;
    }

    public void setCombineQuestionMap(Map<Integer, CombineQuestion> combineQuestionMap) {
        this.combineQuestionMap = combineQuestionMap;
    }

    private final String[] bigNum = new String[]{
            "一、", "二、", "三、", "四、", "五、", "六、", "七、", "八、", "九、", "十、",
            "十一、", "十二、", "十三、", "十四、", "十五、", "十六、", "十七、", "十八、", "十九、", "二十、"
    };

    public CombineResult questionCombine(String paperTitle) {
        int bigNumFlag = 0;
        StringBuilder paperHtml = new StringBuilder();
        StringBuilder paperHtmlTitle = new StringBuilder();
        StringBuilder answerHtml = new StringBuilder();
        StringBuilder answerHtmlTitle = new StringBuilder();
        paperHtmlTitle.append("<h1 align=\"center\">").append(paperTitle).append("</h1><hr/>");
        answerHtmlTitle.append("<h1 align=\"center\">").append(paperTitle).append("【答案】</h1><hr/>");

        List<Integer> list = new ArrayList<>(combineQuestionMap.keySet());
        for (Integer id : list) {
            CombineQuestion combineQuestion = combineQuestionMap.get(id);
            if (combineQuestion == null) {
                continue;
            }
            String questionTypeName = questionService.getQuestionTypeById(id).getName();
            List<Integer> questionIdList = combineQuestion.getQuestionIdList();
            Double score = combineQuestion.getScore();
            Double tScore = combineQuestion.getTScore();
            paperHtml.append("<h5>")
                    .append(bigNum[bigNumFlag])
                    .append(questionTypeName).append("题（每题").append(score).append("分，共").append(tScore).append("分）</h5>")
                    .append(questionCombine(questionIdList));
            answerHtml.append("<h5>")
                    .append(bigNum[bigNumFlag++])
                    .append(questionTypeName).append("题")
                    .append(answerCombine(questionIdList));
        }

        if ("".equals(paperHtml.toString())) {
            return new CombineResult(true, "", "");
        } else {
            paperHtmlTitle.append(paperHtml);
            answerHtmlTitle.append(answerHtml);
        }

        return new CombineResult(true, paperHtmlTitle.toString(), answerHtmlTitle.toString());
    }

    private String questionCombine(List<Integer> list) {
        StringBuilder html = new StringBuilder();
        for (int i = 1; i <= list.size(); i++) {
            String questionHtml = questionService.getQuestionById(list.get(i - 1)).getQuestionHtml();
            questionHtml = questionHtml.replaceFirst("<p>", "<p>" + i + "、");
            html.append(questionHtml);
        }
        return html.toString();
    }

    private String answerCombine(List<Integer> list) {
        StringBuilder html = new StringBuilder();
        for (int i = 1; i <= list.size(); i++) {
            String answerHtml = questionService.getQuestionById(list.get(i - 1)).getAnswerHtml();
            html.append("<h5>").append(i).append("、</h5>").append(answerHtml);
        }
        return html.toString();
    }
}
