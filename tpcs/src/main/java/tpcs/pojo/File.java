package tpcs.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class File {
    private Integer id;
    private Integer userId;
    private String fileName;
    private String truthName;
    private String gmtCreate;

    public File(Integer userId, String fileName, String truthName) {
        this.userId = userId;
        this.fileName = fileName;
        this.truthName = truthName;
    }
}
