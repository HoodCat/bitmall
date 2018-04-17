package com.cafe24.bitmall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.OrderGoodsVo;

@Repository
public class OrderGoodsDao {
    @Autowired
    private SqlSession sqlSession;
    
    public boolean insert(OrderGoodsVo vo) {
        return sqlSession.insert("ordergoods.insert", vo) == 1;
    }
}
