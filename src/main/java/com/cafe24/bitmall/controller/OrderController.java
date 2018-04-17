package com.cafe24.bitmall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.security.AuthMember;
import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.vo.MemberVo;
import com.cafe24.bitmall.vo.OrderVo;

@RequestMapping("order")
@Controller
public class OrderController {
    @Autowired
    private CartService cartService;
    
    @Autowired
    private OrderService orderService;
    
    @Auth
    @RequestMapping("")
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
    
    @Auth
    @RequestMapping(value="pay", method=RequestMethod.GET)
    public String pay(
            @AuthMember MemberVo authMember,
            Model model) {
        List<Map<String,Object>> cartList = cartService.getCartList(authMember.getNo());
        
        if(cartList.size() == 0) {
            return "redirect:/";
        }
        model.addAttribute("cartList", cartList);
        model.addAttribute("totPrice", cartService.getTotPrice());
        return "order_pay";
    }
    
    @Auth
    @RequestMapping(value="pay", method=RequestMethod.POST)
    public String pay(
            @RequestParam(value="", required=false, defaultValue="") String recommand,
            Model model) {
        model.addAttribute("recommand", model);
        return "redirect:/order/pay";
    }
    
    @Auth
    @RequestMapping(value="ok", method=RequestMethod.GET)
    public String ok() {
        return "order_ok";
    }
    
    @Auth
    @RequestMapping(value="ok", method=RequestMethod.POST)  
    public String ok(@ModelAttribute OrderVo orderVo) {
        orderService.addOrder(orderVo);
        System.out.println(orderVo);
        return "redirect:/order/ok";
    }
    
    /*@RequestMapping("")
    public String jumun() {
        return "jumun";
    }
    
    @RequestMapping("info")
    public String jumunInfo() {
        return "jumun_info";
    }*/
}
