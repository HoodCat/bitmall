package com.cafe24.bitmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.dao.GoodsDao;
import com.cafe24.bitmall.vo.GoodsVo;

@Service
public class GoodsService {
    @Autowired
    private GoodsDao goodsDao;
    
    public boolean addGoods(GoodsVo goodsVo, String[] options, String[] icons, MultipartFile[] imageFiles) {
        return goodsDao.insert(goodsVo);
    }
}
