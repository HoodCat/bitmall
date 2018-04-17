package com.cafe24.bitmall.controller;

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
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.MemberVo;

@Controller
@RequestMapping("cart")
public class CartController {
    @Autowired
    private CartService cartService;
    
    @Auth
    @RequestMapping(value="", method=RequestMethod.GET)
    public String cart(
            @AuthMember MemberVo authMember,
            Model model) {
        model.addAttribute("cartList", cartService.getCartList(authMember.getNo()));
        model.addAttribute("totPrice", cartService.getTotPrice());
        for(Map<String, Object> map: cartService.getCartList(authMember.getNo())) {
            for(String key: map.keySet()) {
                System.out.println(key + ":" + map.get(key));
            }
            System.out.println("========================");
        }
        return "cart";
    }
    
    @Auth
    @RequestMapping(value="", method=RequestMethod.POST)
    public String cart(
            @ModelAttribute CartVo cartVo,
            @RequestParam(value="small-option", required=false, defaultValue="")Long[] smallOptions) {
        for(Long smallOption: smallOptions) {
            System.out.println(smallOption);
        }
        cartService.addCart(cartVo, smallOptions);
        return "redirect:/cart";
    }
    
    @Auth
    @RequestMapping(value="delete", method=RequestMethod.GET)
    public String delete(
            @AuthMember MemberVo authMember,
            @RequestParam(value="no", required=false) Long no) {
        if(no == null) {
            cartService.deleteAll(authMember.getNo());
        } else {
            cartService.delete(no);
        }
        return "redirect:/cart";
    }
}
