package com.cafe24.bitmall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.GoodsVo;

@Repository
public class GoodsDao {
    @Autowired
    private SqlSession sqlSession;
    
    public boolean insert(GoodsVo goodsVo) {
        return sqlSession.insert("goods.insert", goodsVo)==1;
    }
}
