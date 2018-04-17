package com.cafe24.bitmall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CartVo;

@Repository
public class CartDao {
    @Autowired
    private SqlSession sqlSession;
    
    public boolean insert(CartVo cartVo) {
        return sqlSession.insert("cart.insert", cartVo)==1;
    }
    
    public List<Map<String, Object>> selectCartList(Long memberNo) {
        return sqlSession.selectList("cart.selectCartList", memberNo);
    }
    
    public int deleteAll(Long no) {
        return sqlSession.delete("cart.deleteByMemberNo", no);
    }
    
    public boolean delete(Long no) {
        return sqlSession.delete("cart.deleteByNo", no)==1;
    }
}
