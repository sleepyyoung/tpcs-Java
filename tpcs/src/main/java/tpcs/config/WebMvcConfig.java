package tpcs.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import tpcs.interceptor.*;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new UserApiInterceptor())
                .addPathPatterns("/api/**");

        registry.addInterceptor(new UserPageInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(
                        "/login/**",
                        "/register/**",
                        "/forgot/**",
                        "/js/**",
                        "/css/**",
                        "/lib/**",
                        "/download/**"
                );

        registry.addInterceptor(new TeacherApiInterceptor())
                .addPathPatterns("/api/combine/**");

        registry.addInterceptor(new TeacherPageInterceptor())
                .addPathPatterns(
                        "/#/question-combine",
                        "/question-combine",
                        "/#/question-combine-auto",
                        "/question-combine-auto"
                );

        registry.addInterceptor(new AdminApiInterceptor())
                .addPathPatterns(
                        "/api/teacher/**",
                        "/api/course/**",
                        "/api/question-type/**"
                );

        registry.addInterceptor(new AdminPageInterceptor())
                .addPathPatterns(
                        "/#/teacher-list",
                        "/teacher-list",
                        "/#/teacher-audit",
                        "/teacher-audit",
                        "/#/course-list",
                        "/course-list",
                        "/#/question-type-list",
                        "/question-type-list"
                );
    }

    @Bean(name = "multipartResolver")
    public MultipartResolver multipartResolver() {
        CustomMultipartResolver customMultipartResolver = new CustomMultipartResolver();
        return customMultipartResolver;
    }
}
