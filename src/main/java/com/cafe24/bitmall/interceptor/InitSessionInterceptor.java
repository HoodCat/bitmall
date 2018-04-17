package com.cafe24.bitmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.service.CategoryService;

public class InitSessionInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(
            HttpServletRequest request, 
            HttpServletResponse response, 
            Object handler)
            throws Exception {
        
        HttpSession session = request.getSession(true);
        ApplicationContext context = WebApplicationContextUtils
                .getWebApplicationContext(request.getServletContext());
        
        CategoryService categoryService = context.getBean(CategoryService.class);
        if(session.getAttribute("categoryList") == null) {
            session.setAttribute("categoryList", categoryService.getCategoryList());
        }
        
        return true;
    }
    
}
