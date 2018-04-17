package com.cafe24.bitmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.BackupGoodsDao;
import com.cafe24.bitmall.dao.BackupSmallOptionDao;
import com.cafe24.bitmall.dao.CartDao;
import com.cafe24.bitmall.dao.CartOptionDao;
import com.cafe24.bitmall.dao.GoodsDao;
import com.cafe24.bitmall.dao.OrderDao;
import com.cafe24.bitmall.dao.OrderGoodsDao;
import com.cafe24.bitmall.dao.OrderGoodsOptionDao;
import com.cafe24.bitmall.dao.SmallOptionDao;
import com.cafe24.bitmall.vo.CartOptionVo;
import com.cafe24.bitmall.vo.GoodsVo;
import com.cafe24.bitmall.vo.OrderGoodsOptionVo;
import com.cafe24.bitmall.vo.OrderGoodsVo;
import com.cafe24.bitmall.vo.OrderVo;
import com.cafe24.bitmall.vo.SmallOptionVo;

@Service
public class OrderService {
    
    @Autowired
    private OrderDao orderDao;
    
    @Autowired
    private OrderGoodsDao orderGoodsDao;
    
    @Autowired
    private OrderGoodsOptionDao orderGoodsOptionDao;
    
    @Autowired
    private CartDao cartDao;
    
    @Autowired
    private GoodsDao goodsDao;
    
    @Autowired
    private SmallOptionDao smallOptionDao;
    
    @Autowired
    private BackupGoodsDao bGoodsDao;
    
    @Autowired
    private BackupSmallOptionDao bSmallOptionDao;
    
    @Autowired
    private CartOptionDao cartOptionDao;
    
    public boolean addOrder(OrderVo orderVo) {
        boolean result = orderDao.insert(orderVo);
        
        List<Map<String, Object>> cartList = cartDao.selectCartList(orderVo.getMemberNo());
        
        for(Map<String, Object> cart: cartList) {
            System.out.println(cart);
            long cartNo = (int)cart.get("no");
            long goodsNo = (int)cart.get("goodsNo");
            long amount = (int)cart.get("amount");
            GoodsVo goodsVo = goodsDao.select(goodsNo);
            bGoodsDao.insert(goodsVo);
            
            OrderGoodsVo orderGoodsVo = new OrderGoodsVo();
            orderGoodsVo.setOrderNo(orderVo.getNo());
            orderGoodsVo.setGoodsNo(goodsVo.getNo());
            orderGoodsVo.setAmount(amount);
            orderGoodsDao.insert(orderGoodsVo);
            
            List<CartOptionVo> optionList = cartOptionDao.selectOptionList(cartNo);
            for(CartOptionVo option: optionList) {
                Long optionNo = option.getSmallOptionNo();
                SmallOptionVo smallOptionVo = smallOptionDao.selectSmallOption(optionNo);
                bSmallOptionDao.insert(smallOptionVo);

                OrderGoodsOptionVo orderGoodsOptionVo = new OrderGoodsOptionVo();
                orderGoodsOptionVo.setGoodsNo(goodsVo.getNo());
                orderGoodsOptionVo.setSmallOptionNo(smallOptionVo.getNo());
                orderGoodsOptionDao.insert(orderGoodsOptionVo);
            }
        }
        
        cartDao.deleteAll(orderVo.getMemberNo());
        return result;
    }
}
