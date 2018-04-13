package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.IconDao;
import com.cafe24.bitmall.vo.IconVo;

@Service
public class IconService {
    @Autowired
    private IconDao iconDao;
    
    public IconVo getIcon(IconVo iconVo) {
        return iconDao.selectIcon(iconVo);
    }
    
    public List<IconVo> getIconList() {
        return iconDao.selectIconList();
    }
}
