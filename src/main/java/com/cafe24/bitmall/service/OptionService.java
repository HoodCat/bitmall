package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.OptionDao;
import com.cafe24.bitmall.dao.SmallOptionDao;
import com.cafe24.bitmall.vo.OptionVo;
import com.cafe24.bitmall.vo.SmallOptionVo;

@Service
public class OptionService {
    
    @Autowired
    private OptionDao optionDao;
    
    @Autowired
    private SmallOptionDao sOptionDao;
    
    public boolean addOption(OptionVo optionVo) {
        return optionDao.insert(optionVo);
    }
    
    public boolean modifyOptionName(OptionVo optionVo) {
        return optionDao.update(optionVo);
    }
    
    public boolean deleteOption(OptionVo optionVo) {
        return optionDao.delete(optionVo);
    }
    
    public List<OptionVo> getOptionList() {
        return optionDao.selectList();
    }
    
    public OptionVo getOption(Long no) {
        return optionDao.selectOption(no);
    }
    
    public Long getTotalCount() {
        return optionDao.getTotalCount();
    }
    
    public List<SmallOptionVo> getSmallOptionList(Long optionNo) {
        return sOptionDao.selectSmallOptionList(optionNo);
    }
    
    public SmallOptionVo getSmallOption(Long sOptionNo) {
        return sOptionDao.selectSmallOption(sOptionNo);
    }
    
    public SmallOptionVo getSmallOption(SmallOptionVo sOptionVo) {
        return sOptionDao.selectSmallOption(sOptionVo);
    }
    
    public SmallOptionVo addSmallOption(SmallOptionVo sOptionVo) {
        sOptionDao.insert(sOptionVo);
        System.out.println(sOptionVo);
        return sOptionVo;
    }
    
    public boolean modifySmallOption(SmallOptionVo sOptionVo) {
        return sOptionDao.update(sOptionVo);
    }
    
    public boolean deleteSmallOption(SmallOptionVo sOptionVo) {
        return sOptionDao.delete(sOptionVo);
    }
    
}
