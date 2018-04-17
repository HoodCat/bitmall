package com.cafe24.bitmall.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.service.GoodsService;
import com.cafe24.bitmall.service.IconService;
import com.cafe24.bitmall.service.OptionService;

@Controller
@RequestMapping("product")
public class ProductController {
    @Autowired
    private GoodsService goodsService;
    
    @Autowired
    private IconService iconService;
    
    @Autowired
    private OptionService optionService;
    
    @RequestMapping("{categoryNo}")
    public String product(
            @RequestParam(value="page", required=true, defaultValue="1") Long page,
            @PathVariable(value="categoryNo") Long categoryNo,
            Model model) {
        Map<String, Object> searchParam = new HashMap<>();
        searchParam.put("page", page);
        searchParam.put("category", categoryNo);
        searchParam.put("pageSize", 20);
        
        model.addAttribute("goodsList", goodsService.getGoodsList(searchParam));
        model.addAttribute("goodsTotCnt", goodsService.getTotCnt());
        model.addAttribute("category", categoryNo);
        model.addAttribute("curPage", goodsService.getCurPage());
        model.addAttribute("lastPage", goodsService.getLastPage());
        return "product/product";
    }
    
    @RequestMapping("detail/{goodsNo}")
    public String productDetail(
            @RequestParam(value="page", required=true, defaultValue="1") Long page,
            @RequestParam(value="status", required=false, defaultValue="0") Long status,
            @RequestParam(value="icon", required=false, defaultValue="0") Long icon,
            @RequestParam(value="category", required=false, defaultValue="0") Long category,
            @RequestParam(value="search", required=false, defaultValue="0") Long search,
            @RequestParam(value="keyword", required=false, defaultValue="") String keyword,
            @PathVariable(value="goodsNo") Long goodsNo,
            Model model) {
        
        Map<String, Object> searchParam = new HashMap<>();
        searchParam.put("page", page);
        searchParam.put("status", status);
        searchParam.put("icon", icon);
        searchParam.put("category", category);
        searchParam.put("search", search);
        searchParam.put("keyword", keyword);
        
        model.addAttribute("goods", goodsService.getGoods(goodsNo));
        model.addAttribute("iconList", iconService.getIconList(goodsNo));
        model.addAttribute("goodsImgList", goodsService.getGoodsImageList(goodsNo));
        model.addAttribute("optionList", optionService.getGoodsOptionList(goodsNo));
        model.addAttribute("sOptionList", optionService.getGoodsSOptionList(goodsNo));
        
        return "product/product_detail";
    }
}
