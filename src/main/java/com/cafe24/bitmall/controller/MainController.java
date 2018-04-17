	package com.cafe24.bitmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.security.AuthMember;
import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.service.GoodsService;
import com.cafe24.bitmall.vo.MemberVo;

@Controller
public class MainController {
    @Autowired
    private GoodsService goodsService;
    
    @Autowired
    private CartService cartService;
    
	@RequestMapping( "" )
	public String index(
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
        searchParam.put("pageSize", 20);
        model.addAttribute("goodsList", goodsService.getGoodsList(searchParam));
        
		return "main/index";
	}
	
	@RequestMapping("zipcode")
	public String zipCode() {
	    return "zipcode";
	}
	
	@RequestMapping("qa")
	public String qa() {
	    return "qa";
	}
	
	@RequestMapping("faq")
	public String faq() {
	    return "faq";
	}
	
	@Auth
	@RequestMapping("order")
	public String order(
	        @AuthMember MemberVo authMember,
	        Model model) {
	    List<Map<String,Object>> cartList = cartService.getCartList(authMember.getNo());
	    
	    if(cartList.size() == 0) {
	        return "redirect:/";
	    }
	    model.addAttribute("cartList", cartList);
	    model.addAttribute("totPrice", cartService.getTotPrice());
	    return "order";
	}
	
	@RequestMapping("order/pay")
    public String orderPay() {
        return "order_pay";
    }
	
}
