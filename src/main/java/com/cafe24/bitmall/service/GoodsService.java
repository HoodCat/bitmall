package com.cafe24.bitmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.dao.GoodsDao;
import com.cafe24.bitmall.dao.GoodsOptionDao;
import com.cafe24.bitmall.vo.GoodsOptionVo;
import com.cafe24.bitmall.vo.GoodsVo;

@Service
public class GoodsService {
    @Autowired
    private GoodsDao goodsDao;
    
    @Autowired
    private GoodsOptionDao goodsOptionDao;
    
    public boolean addGoods(GoodsVo goodsVo, Long[] options, Long[] icons, MultipartFile[] imageFiles) {
        boolean result = goodsDao.insert(goodsVo);
        
        for(Long option: options) {
            GoodsOptionVo gOptionVo = new GoodsOptionVo();
            gOptionVo.setGoodsNo(goodsVo.getNo());
            gOptionVo.setOptionNo(option);
            goodsOptionDao.insert(gOptionVo);
        }
        
        
        return result;
    }
}
