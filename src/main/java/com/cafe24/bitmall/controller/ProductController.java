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

@Controller
@RequestMapping("product")
public class ProductController {
    @Autowired
    private GoodsService goodsService;
    
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
        
        model.addAttribute("goodsList", goodsService.getGoodsList(searchParam));
        return "product_detail";
    }
}
