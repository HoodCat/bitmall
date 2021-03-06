package com.cafe24.bitmall.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.service.GoodsService;
import com.cafe24.bitmall.service.IconService;
import com.cafe24.bitmall.service.OptionService;
import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.service.StatusService;
import com.cafe24.bitmall.vo.GoodsVo;
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
    
    @Autowired
    private GoodsService goodsService;
    
    @Autowired
    private IconService iconSerivce;
    
    @Autowired
    private OrderService orderService;
    
    @RequestMapping(value="", method=RequestMethod.GET)
    public String login() {
        return "admin/login";
    }
    
    @RequestMapping(value="", method=RequestMethod.POST)
    public String login(Model model) {
        return "redirect:/admin/product";
        
    }
    
    @RequestMapping("member_manage")
    public String memberManage() {
        return "admin/member";
    }
    
    /* 상품 */
    @RequestMapping("product")
    public String product(
            @RequestParam(value="page", required=true, defaultValue="1") Long page,
            @RequestParam(value="status", required=false, defaultValue="0") Long status,
            @RequestParam(value="icon", required=false, defaultValue="0") Long icon,
            @RequestParam(value="category", required=false, defaultValue="0") Long category,
            @RequestParam(value="search", required=false, defaultValue="0") Long search,
            @RequestParam(value="keyword", required=false, defaultValue="") String keyword,
            Model model) {
        
        Map<String, Object> searchParam = new HashMap<>();
        searchParam.put("page", page);
        searchParam.put("status", status);
        searchParam.put("icon", icon);
        searchParam.put("category", category);
        searchParam.put("search", search);
        searchParam.put("keyword", keyword);
        
        model.addAttribute("curPage", page);
        model.addAttribute("status", status);
        model.addAttribute("icon", icon);
        model.addAttribute("category", category);
        model.addAttribute("search", search);
        model.addAttribute("keyword", keyword);
        
        model.addAttribute("statusList", statusService.getStatusList());
        model.addAttribute("iconList", iconSerivce.getIconList());
        model.addAttribute("categoryList", categoryService.getCategoryList());
        model.addAttribute("goodsList", goodsService.getGoodsList(searchParam));
        model.addAttribute("goodsTotCnt", goodsService.getTotCnt());
        model.addAttribute("lastPage", goodsService.getLastPage());
        System.out.println(goodsService.getLastPage());
        return "admin/product";
    }
    
    @RequestMapping(value="product/new", method=RequestMethod.GET)
    public String productNew(Model model) {
        model.addAttribute("categoryList", categoryService.getCategoryList());
        model.addAttribute("optionList", optionService.getOptionList());
        model.addAttribute("statusList", statusService.getStatusList());
        model.addAttribute("iconList", iconSerivce.getIconList());
        return "admin/product_new";
    }
    
    @RequestMapping(value="product/new", method=RequestMethod.POST)
    public String productNew(
            @ModelAttribute GoodsVo goodsvo,
            @RequestParam(value="option") Long[] options,
            @RequestParam(value="check-icon", required=false, defaultValue="") Long[] icons,
            @RequestParam(value="imageFile") MultipartFile[] imageFiles,
            Model model) {
        
        goodsService.addGoods(goodsvo, options, icons, imageFiles);
        
        return "redirect:/admin/product";
    }
    
    @RequestMapping(value="product/edit/{goodsNo}", method=RequestMethod.GET)
    public String productEdit(
            @PathVariable(value="goodsNo") Long goodsNo,
            Model model) {
        model.addAttribute("categoryList", categoryService.getCategoryList());
        model.addAttribute("optionList", optionService.getOptionList());
        model.addAttribute("statusList", statusService.getStatusList());
        model.addAttribute("iconList", iconSerivce.getIconList());
        model.addAttribute("goods", goodsService.getGoods(goodsNo));
        return "admin/product_edit";
    }
    
    @RequestMapping("jumun")
    public String jumun(
            Model model) {
        model.addAttribute("orderList", orderService.getOrderList());
        return "admin/jumun";
    }
    
    @RequestMapping("jumun/info")
    public String jumunInfo(Model model) {
        return "admin/jumun_info";
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
