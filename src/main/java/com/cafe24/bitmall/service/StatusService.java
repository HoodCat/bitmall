package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.StatusDao;
import com.cafe24.bitmall.vo.StatusVo;

@Service
public class StatusService {
    @Autowired
    private StatusDao statusDao;
    
    public StatusVo getStatus(StatusVo statusVo) {
        return statusDao.selectStatus(statusVo);
    }
    
    public List<StatusVo> getStatusList() {
        return statusDao.selectStatusList();
    }
}
