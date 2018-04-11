package com.cafe24.bitmall.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.vo.MemberVo;

public class AuthAdminInterceptor extends HandlerInterceptorAdapter{

    @Override
    public boolean preHandle(
            HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // TODO Auto-generated method stub
        
        if (handler instanceof HandlerMethod == false) {
            return true;
        }
        
        HandlerMethod handlerMethod = (HandlerMethod)handler;
        if(handlerMethod.getMethod().getDeclaringClass().isAnnotationPresent(Auth.class) == false) {
            return true;
        }
        
        HttpSession session = request.getSession();
        if(session == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return false;
        }
        
        MemberVo authMember = (MemberVo) session.getAttribute("authMember");
        if(authMember == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return false;
        }
        
        if(authMember.getClassification() == 0) {
            response.sendRedirect(request.getContextPath() + "/");
            return false;
        }
        
        return true;
    }
    
}
