package com.cafe24.bitmall.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.service.MemberService;

@Controller("memberAPIController")
@RequestMapping("api/member")
public class MemberController {

    @Autowired
    private MemberService memberService;
    
    @ResponseBody
    @RequestMapping(value="check_id", method=RequestMethod.POST)
    public String checkId(@RequestParam(value="id", required=true) String id) {
        return String.valueOf(memberService.isExist(id));
    }
}
