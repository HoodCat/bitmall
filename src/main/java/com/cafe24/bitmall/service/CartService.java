package com.cafe24.bitmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.CartDao;
import com.cafe24.bitmall.dao.CartOptionDao;
import com.cafe24.bitmall.vo.CartOptionVo;
import com.cafe24.bitmall.vo.CartVo;

@Service
public class CartService {
    private int totPrice;
    
    @Autowired
    private CartDao cartDao;
    
    @Autowired
    private CartOptionDao cartOptionDao;
    
    public int getTotPrice() {
        return totPrice;
    }

    public boolean addCart(CartVo cartVo, Long[] options) {
        boolean result = cartDao.insert(cartVo);
        
        for(Long option: options) {
            if(option == 0 || option == null) {
                continue;
            }
            CartOptionVo cartOptionVo = new CartOptionVo();
            cartOptionVo.setCartNo(cartVo.getNo());
            cartOptionVo.setSmallOptionNo(option);
            cartOptionDao.insert(cartOptionVo);
        }
        
        return result;
    }
    
    public List<Map<String,Object>> getCartList(Long memberNo) {
        totPrice=0;
        List<Map<String,Object>> result = cartDao.selectCartList(memberNo);
        for(Map<String,Object> map: result) {
            Integer rateSale = (Integer)map.get("rateSale");
            if(rateSale == null) {
                totPrice += (Integer)map.get("price") * (Integer)map.get("amount");
            } else {
                totPrice += (Integer)map.get("price")*(1 - rateSale/100.0) * (Integer)map.get("amount");
            }
        }
        
        return cartDao.selectCartList(memberNo);
    }
    
    public int deleteAll(Long no) {
        return cartDao.deleteAll(no);
    }
    
    public boolean delete(Long no) {
        return cartDao.delete(no);
    }
}
