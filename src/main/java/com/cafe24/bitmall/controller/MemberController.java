package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.vo.MemberVo;

@RequestMapping("member")
@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    
    @RequestMapping("agree")
    public String agree() {
        return "user/member_agree";
    }
    
    @RequestMapping(value="login", method=RequestMethod.GET)
    public String login() {
        return "user/member_login";
    }
    
    @RequestMapping(value="login", method=RequestMethod.POST)
    public String login(@ModelAttribute MemberVo memberVo) {
        System.out.println(memberVo);
        return "redirect:/";
    }
    
    @RequestMapping(value="join", method=RequestMethod.GET)
    public String join() {
        return "user/member_join";
    }
    
    @RequestMapping(value="join", method=RequestMethod.POST)
    public String join(
            @ModelAttribute MemberVo memberVo) {
        memberService.joinMember(memberVo);
        return "redirect:joinend";
    }
    
    @RequestMapping("joinend")
    public String joinEnd() {
        return "user/member_joinend";
    }
    
}
