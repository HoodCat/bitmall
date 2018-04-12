package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.OptionDao;
import com.cafe24.bitmall.vo.OptionVo;

@Service
public class OptionService {
    
    @Autowired
    private OptionDao optionDao;
    
    /*@Autowired
    private SmallOptionDao smallOptionDao;*/
    
    public boolean addOption(OptionVo optionVo) {
        return optionDao.insert(optionVo);
    }
    
    public List<OptionVo> getOptionList() {
        return optionDao.selectList();
    }
}
