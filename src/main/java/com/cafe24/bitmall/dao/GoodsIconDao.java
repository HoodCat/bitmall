package com.cafe24.bitmall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.GoodsIconVo;

@Repository
public class GoodsIconDao {
    @Autowired
    private SqlSession sqlSession;
    
    public boolean insert(GoodsIconVo vo) {
        return sqlSession.insert("goodsicon.insert", vo) == 1;
    }
}
