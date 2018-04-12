package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.service.OptionService;
import com.cafe24.bitmall.service.StatusService;
import com.cafe24.bitmall.vo.OptionVo;
import com.cafe24.bitmall.vo.SmallOptionVo;

@Auth
@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private OptionService optionService;
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private StatusService statusService;
    
    @RequestMapping("")
    public String login() {
        return "admin/login";
    }
    
    @RequestMapping("member_manage")
    public String memberManage() {
        return "admin/member";
    }
    
    @RequestMapping("product")
    public String product(Model model) {
        model.addAttribute("categoryList", categoryService.getCategoryList());
        return "admin/product";
    }
    
    @RequestMapping(value="product/new", method=RequestMethod.GET)
    public String productNew(Model model) {
        model.addAttribute("categoryList", categoryService.getCategoryList());
        model.addAttribute("optionList", optionService.getOptionList());
        model.addAttribute("statusList", statusService.getStatusList());
        return "admin/product_new";
    }
    
    @RequestMapping("jumun")
    public String jumun() {
        return "admin/jumun";
    }
    
    /* 옵션 */
    @RequestMapping("option")
    public String option(Model model) {
        model.addAttribute("totalCount", optionService.getTotalCount());
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
    
    @RequestMapping(value="option/delete/{optionNo}", method=RequestMethod.GET) 
    public String optionDelete(
            @PathVariable(value="optionNo") Long no) {
        OptionVo optionVo = new OptionVo();
        optionVo.setNo(no);
        optionService.deleteOption(optionVo);
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
    
    @RequestMapping(value="option/{optionNo}/edit/{sOptionNo}", method=RequestMethod.GET)
    public String optionsEdit(
            @PathVariable(value="optionNo") Long optionNo,
            @PathVariable(value="sOptionNo") Long sOptionNo,
            Model model) {
            SmallOptionVo paramVo = new SmallOptionVo();
            paramVo.setNo(sOptionNo);
            paramVo.setOptionNo(optionNo);
            
            SmallOptionVo sOptionVo = optionService.getSmallOption(paramVo);
            if(sOptionVo == null) {
                return "redirect:/admin/option";
            }
            model.addAttribute("sOption", sOptionVo);
        return "admin/opts_edit";
    }
    
    @RequestMapping(value="option/{optionNo}/edit/{sOptionNo}", method=RequestMethod.POST)
    public String optionsEdit(
            @PathVariable(value="optionNo") Long optionNo,
            @PathVariable(value="sOptionNo") Long sOptionNo,
            @ModelAttribute SmallOptionVo sOptionVo,
            Model model) {
            
            sOptionVo.setNo(sOptionNo);
            sOptionVo.setOptionNo(optionNo);
            
            System.out.println(optionService.modifySmallOption(sOptionVo));
        
        return "redirect:/admin/option/" + optionNo;
    }
    
    @RequestMapping(value="option/{optionNo}/delete/{sOptionNo}", method=RequestMethod.GET)
    public String optionsDelete(
            @PathVariable(value="optionNo") Long optionNo,
            @PathVariable(value="sOptionNo") Long sOptionNo,
            Model model) {
            SmallOptionVo sOptionVo = new SmallOptionVo();
            sOptionVo.setNo(sOptionNo);
            sOptionVo.setOptionNo(optionNo);
            
            System.out.println(optionService.deleteSmallOption(sOptionVo));
        
        return "redirect:/admin/option/" + optionNo;
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
