package tpcs.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SimplifyQuestion {
    private Integer id;
    private Double score;
    private Integer user;
    private Integer type;
    private Integer difficulty;
    private Integer course;
    private String questionMd;
    private String questionTxt;
    private String questionHtml;
    private String answerMd;
    private String answerTxt;
    private String answerHtml;
}

