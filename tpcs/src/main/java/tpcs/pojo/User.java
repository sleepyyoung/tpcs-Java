package tpcs.pojo;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.jackson.JsonObjectSerializer;

@JsonSerialize(using = JsonObjectSerializer.class)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer id;
    private String username;
    private String password;
    private String email;
    private String note;
    private Integer status;
    private Boolean isAdministrator;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public User(String username, String password, String email, Boolean isAdministrator) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.isAdministrator = isAdministrator;
    }

    public User(String username, String password, String email, String note, Integer status, Boolean isAdministrator) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.note = note;
        this.status = status;
        this.isAdministrator = isAdministrator;
    }
}
