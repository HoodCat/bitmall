package com.cafe24.bitmall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.OrderVo;

@Repository
public class OrderDao {
    @Autowired
    private SqlSession sqlSession;
    
    public boolean insert(OrderVo vo) {
        return sqlSession.insert("order.insert", vo) == 1;
    }
}
