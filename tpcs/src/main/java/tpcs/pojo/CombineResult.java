package tpcs.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CombineResult {
    Boolean success;
    String paperHtml;
    String answerHtml;
}
