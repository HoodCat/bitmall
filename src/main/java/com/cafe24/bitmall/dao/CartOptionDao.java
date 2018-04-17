package com.cafe24.bitmall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CartOptionVo;

@Repository
public class CartOptionDao {
    @Autowired
    private SqlSession sqlSession;
    
    public boolean insert(CartOptionVo cartOptionVo) {
        return sqlSession.insert("cartoption.insert", cartOptionVo) == 1;
    }
    
    public List<CartOptionVo> selectOptionList(Long cartNo) {
        return sqlSession.selectList("cartoption.selectListByCartNo", cartNo);
    }
}
