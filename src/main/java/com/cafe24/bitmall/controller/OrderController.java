package com.cafe24.bitmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("jumun")
@Controller
public class OrderController {
    
    @RequestMapping("")
    public String jumun() {
        return "jumun";
    }
    
    @RequestMapping("info")
    public String jumunInfo() {
        return "jumun_info";
    }
}
