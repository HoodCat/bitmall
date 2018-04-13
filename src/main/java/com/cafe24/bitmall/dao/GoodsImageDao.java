package com.cafe24.bitmall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.GoodsImageVo;

@Repository
public class GoodsImageDao {
    @Autowired
    private SqlSession sqlSession;
    
    public boolean insert(GoodsImageVo vo) {
        return sqlSession.insert("goodsimage.insert", vo) == 1;
    }
}
