package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.service.OptionService;
import com.cafe24.bitmall.vo.OptionVo;

@Auth
@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private OptionService optionService;
    
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
    
    @RequestMapping(value="product/new", method=RequestMethod.GET)
    public String productNew() {
        return "admin/product_new";
    }
    
    @RequestMapping("jumun")
    public String jumun() {
        return "admin/jumun";
    }
    
    /* 옵션 */
    @RequestMapping("option")
    public String option(Model model) {
        model.addAttribute("optionList", optionService.getOptionList());
        return "admin/opt";
    }
    
    @RequestMapping(value="option/new", method=RequestMethod.GET)
    public String optionNew() {
        return "admin/opt_new";
    }
    
    @RequestMapping(value="option/new", method=RequestMethod.POST)
    public String optionNew(@ModelAttribute OptionVo optionVo) {
        optionService.addOption(optionVo);
        return "redirect:/admin/option";
    }
    
    /* 소옵션 */
    @RequestMapping("options")
    public String options() {
        return "admin/opts";
    }
    
    @RequestMapping("faq")
    public String faq() {
        return "admin/faq";
    }
    
    @RequestMapping("faq/new")
    public String faqNew() {
        return "admin/faq_new";
    }
}
