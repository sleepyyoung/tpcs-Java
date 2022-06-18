package tpcs.interceptor;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import tpcs.pojo.User;
import tpcs.service.IUserService;
import tpcs.util.crypt.AESUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TeacherPageInterceptor implements HandlerInterceptor {
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
        request.getRequestDispatcher("/403").forward(request,response);
        return false;
    }
}
