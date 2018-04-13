package com.cafe24.bitmall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.GoodsOptionVo;

@Repository
public class GoodsOptionDao {
    @Autowired
    private SqlSession sqlSession;
    
    public boolean insert(GoodsOptionVo vo) {
        return sqlSession.insert("goodsoption.insert", vo) == 1;
    }
}
