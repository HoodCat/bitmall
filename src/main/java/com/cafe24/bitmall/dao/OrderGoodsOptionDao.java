package com.cafe24.bitmall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.OrderGoodsOptionVo;

@Repository
public class OrderGoodsOptionDao {
    @Autowired
    private SqlSession sqlSession;
    
    public boolean insert(OrderGoodsOptionVo vo) {
        return sqlSession.insert("ordergoodsoption.insert", vo)==1;
    }
}
