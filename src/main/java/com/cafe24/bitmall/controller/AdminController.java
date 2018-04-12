package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
    
    @RequestMapping(value="option/edit/{optionNo}", method=RequestMethod.GET)
    public String optionEdit(
            @PathVariable(value="optionNo") Long optionNo,
            Model model) {
        
        model.addAttribute("option", optionService.getOption(optionNo));
        return "admin/opt_edit";
    }
    
    @RequestMapping(value="option/edit/{optionNo}", method=RequestMethod.POST)
    public String optionEdit(
            @PathVariable(value="optionNo") Long optionNo,
            @ModelAttribute OptionVo optionVo,
            Model model) {
        optionVo.setNo(optionNo);
        optionService.modifyOptionName(optionVo);
        return "redirect:/admin/option";
    }
    
    
    /* 소옵션 */
    @RequestMapping("option/{optionNo}")
    public String options(
            @PathVariable(value="optionNo") Long no,
            Model model) {
        model.addAttribute("option", optionService.getOption(no));
        model.addAttribute("sOptionList", optionService.getSmallOptionList(no));
        return "admin/opts";
    }
    
    @RequestMapping("option/{optionNo}/edit/{sOptionNo}")
    public String optionsEdit(
            @PathVariable(value="optionNo") Long optionNo,
            @PathVariable(value="sOptionNo") Long sOptionNo,
            Model model) {
            model.addAttribute("sOption",optionService.getSmallOption(sOptionNo));
        return "admin/opts_edit";
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
