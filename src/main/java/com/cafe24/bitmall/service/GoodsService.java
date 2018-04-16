package com.cafe24.bitmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.dao.GoodsDao;
import com.cafe24.bitmall.dao.GoodsIconDao;
import com.cafe24.bitmall.dao.GoodsImageDao;
import com.cafe24.bitmall.dao.GoodsOptionDao;
import com.cafe24.bitmall.vo.GoodsIconVo;
import com.cafe24.bitmall.vo.GoodsImageVo;
import com.cafe24.bitmall.vo.GoodsOptionVo;
import com.cafe24.bitmall.vo.GoodsVo;

@Service
public class GoodsService {
    private static Long startPage = 1L;
    private Long curPage = 1L;
    private Long lastPage = 1L;
    private Long totCnt = 0L;
    
    @Autowired
    private GoodsDao goodsDao;
    
    @Autowired
    private GoodsOptionDao goodsOptionDao;
    
    @Autowired
    private GoodsIconDao goodsIconDao;
    
    @Autowired
    private FileUploadService fileUploadService;
    
    @Autowired
    private GoodsImageDao goodsImageDao;
    
    public static Long getStartPage() {
        return startPage;
    }

    public Long getCurPage() {
        return curPage;
    }

    public Long getLastPage() {
        return lastPage;
    }

    public Long getTotCnt() {
        return totCnt;
    }

    public boolean addGoods(GoodsVo goodsVo, Long[] options, Long[] icons, MultipartFile[] imageFiles) {
        boolean result = goodsDao.insert(goodsVo);
        
        for(Long option: options) {
            GoodsOptionVo gOptionVo = new GoodsOptionVo();
            gOptionVo.setGoodsNo(goodsVo.getNo());
            gOptionVo.setOptionNo(option);
            goodsOptionDao.insert(gOptionVo);
        }
        
        for(Long icon: icons) {
            GoodsIconVo gIconVo = new GoodsIconVo();
            gIconVo.setGoodsNo(goodsVo.getNo());
            gIconVo.setIconNo(icon);
            goodsIconDao.insert(gIconVo);
        }
        
        for(MultipartFile imageFile: imageFiles) {
            if(imageFile.isEmpty()) {
                break;
            }
            
            String imagePath = fileUploadService.restore(imageFile);
            GoodsImageVo gImageVo = new GoodsImageVo();
            gImageVo.setGoodsNo(goodsVo.getNo()); 
            gImageVo.setPath(imagePath);
            goodsImageDao.insert(gImageVo);
        }
        
        return result;
    }
    
    public GoodsVo getGoods(GoodsVo goodsVo) {
        return goodsDao.select(goodsVo);
    }
    
    public GoodsVo getGoods(Long no) {
        return goodsDao.select(no);
    }
    
    public List<Map<String, Object>> getGoodsList(Map<String, Object> parameter) {
        if(parameter.containsKey("pageSize") == false) {
            parameter.put("pageSize", GoodsDao.getListPageSize());
        }
        List<Map<String, Object>> result =goodsDao.selectList(parameter);
        totCnt = (long)goodsDao.selectTotalCount(parameter);
        curPage = (Long)parameter.get("page");
        lastPage = (long)Math.ceil((double)totCnt/GoodsDao.getListPageSize());
        return result;
    }
    
    public List<GoodsOptionVo> getGoodsOptionList(Long goodsNo) {
        return goodsOptionDao.selectList(goodsNo);
    }
    
    public List<GoodsOptionVo> getGoodsOptionList(GoodsVo goodsVo) {
        return goodsOptionDao.selectList(goodsVo);
    }
}
