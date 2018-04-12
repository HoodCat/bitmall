package com.cafe24.bitmall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.StatusVo;

@Repository
public class StatusDao {
    
    @Autowired
    private SqlSession sqlSession;
    
    public StatusVo selectStatus(StatusVo statusVo) {
        return sqlSession.selectOne("status.select", statusVo); 
    }
    
    public List<StatusVo> selectStatusList() {
        return sqlSession.selectList("status.selectList");
    }
}
