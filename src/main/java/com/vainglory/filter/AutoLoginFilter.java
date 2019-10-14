package com.vainglory.filter;

import com.vainglory.pojo.User;
import com.vainglory.service.IUserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebFilter(filterName = "autoLoginFilter",value = "/*")
//@Component
public class AutoLoginFilter implements Filter {
/*    @Autowired
    private IUserService userService;*/

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        System.out.println("AutoLoginFilter日志：doFilter...");

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String p = requestURI.substring(contextPath.length() + 1);

        if ("userController".equals(p) || !p.contains("admin")){
            User loginUser = (User) request.getSession().getAttribute("user");
            if (loginUser==null){
                String username = "";
                String password = "";
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if ("autoUser".equals(cookie.getName())){
                        String loginInfo = cookie.getValue();
                        String[] infos = loginInfo.split(":");
                        username = infos[0];
                        password = infos[1];
                    }
                }

                ApplicationContext context = new ClassPathXmlApplicationContext("applicationConfig.xml");
                IUserService userService = context.getBean("userService", IUserService.class);
                User user = userService.checkUserName(username);

                if (user!=null){
                    System.out.println(user.toString());
                    if (user.getPassword().equals(password)){
                        request.getSession().setAttribute("user",user);
                    }
                }
            }
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
