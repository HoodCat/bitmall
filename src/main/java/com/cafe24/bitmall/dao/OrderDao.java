package com.cafe24.bitmall.dao;

import java.util.List;
import java.util.Map;

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
    
    public List<Map<String, Object>> selectOrderList() {
        return sqlSession.selectList("selectOrderList");
    }
}
