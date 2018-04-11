package com.cafe24.bitmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.bitmall.security.Auth;

@Auth
@Controller
@RequestMapping("admin")
public class AdminController {
    
    @RequestMapping("")
    public String login() {
        return "admin/login";
    }
    
    @RequestMapping("member_manage")
    public String memberManage() {
        return "admin/member";
    }
    
    @RequestMapping("product")
    public String product() {
        return "admin/product";
    }
    
    @RequestMapping("jumun")
    public String jumun() {
        return "admin/jumun";
    }
    
    @RequestMapping("option")
    public String option() {
        return "admin/opt";
    }
    
    @RequestMapping("faq")
    public String faq() {
        return "admin/faq";
    }
    
}
