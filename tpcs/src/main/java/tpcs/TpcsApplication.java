package tpcs;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/** TPCS：Test Paper Combine System（组卷系统） */
@SpringBootApplication
@MapperScan("tpcs.dao")
@EnableTransactionManagement
public class TpcsApplication {
    public static ConfigurableApplicationContext configurableApplicationContext;

    public static void main(String[] args) {
        configurableApplicationContext = SpringApplication.run(TpcsApplication.class, args);
    }
}
