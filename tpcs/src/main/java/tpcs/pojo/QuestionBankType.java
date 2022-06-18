package tpcs.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionBankType {
    private String type;
    private String difficulty;
    private Double score;
    private Integer num;
}
