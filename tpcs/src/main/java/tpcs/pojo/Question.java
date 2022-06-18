package tpcs.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Question {
    private Integer id;
    private Double score;
    private User user;
    private QuestionType type;
    private QuestionDifficulty difficulty;
    private Course course;
    private String questionMd;
    private String questionTxt;
    private String questionHtml;
    private String answerMd;
    private String answerTxt;
    private String answerHtml;
}

