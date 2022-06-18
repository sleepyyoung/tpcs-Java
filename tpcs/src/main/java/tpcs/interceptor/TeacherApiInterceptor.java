package tpcs.interceptor;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import tpcs.pojo.Result;
import tpcs.pojo.User;
import tpcs.service.IUserService;
import tpcs.util.crypt.AESUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TeacherApiInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        BeanFactory factory = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        IUserService userService = factory.getBean("userServiceImpl", IUserService.class);
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                String username;
                try {
                    username = AESUtil.decryptByAES(cookie.getValue());
                    if (userService.isTeacherByUsername(username)) {
                        return true;
                    }
                } catch (Exception ignored) {
                }
            }
        }
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    continue;
                }
                String username;
                try {
                    username = AESUtil.decryptByAES(cookie.getValue());
                    User existingUser = userService.selectByUsername(username);
                    if (existingUser != null && existingUser.getStatus() == 0 && userService.isTeacherByUsername(username)) {
                        return true;
                    }
                } catch (Exception ignored) {
                }
            }
        }

        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj instanceof User) {
            User user = ((User) obj);
            User existingUser = userService.selectByUsernameAndPassword(((User) obj).getUsername(), ((User) obj).getPassword());
            if (existingUser != null && existingUser.getStatus() == 0 && userService.isTeacherByUsername(user.getUsername())) {
                return true;
            }
        }
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println(JSON.toJSONString(new Result(403, "权限不足！")));
        response.getWriter().flush();
        return false;
    }
}
