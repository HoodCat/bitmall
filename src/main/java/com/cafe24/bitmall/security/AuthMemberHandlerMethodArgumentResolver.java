package com.cafe24.bitmall.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.cafe24.bitmall.vo.MemberVo;

public class AuthMemberHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        AuthMember authMember = parameter.getParameterAnnotation(AuthMember.class);
        if(authMember == null) {
            return false;
        }
        
        if(parameter.getParameterType().equals(MemberVo.class) == false) {
            return false;
        }
        
        return true;
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
            NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        
        if(supportsParameter(parameter) == false) {
            return WebArgumentResolver.UNRESOLVED;
        }
        
        HttpServletRequest request = webRequest.getNativeRequest(HttpServletRequest.class);
        HttpSession session = request.getSession();
        if(session == null) {
            return null;
        }
        return session.getAttribute("authMember");
    }

}
