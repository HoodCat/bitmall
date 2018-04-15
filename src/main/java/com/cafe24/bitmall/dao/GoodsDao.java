package com.cafe24.bitmall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.GoodsVo;

@Repository
public class GoodsDao {
    private static final int LIST_PAGE_SIZE = 10;
    @Autowired
    private SqlSession sqlSession;
    
    public boolean insert(GoodsVo goodsVo) {
        return sqlSession.insert("goods.insert", goodsVo)==1;
    }
    
    public List<Map<String, Object>> selectList() {
        return sqlSession.selectList("goods.selectList");
    }
    
    public Long selectTotalCount() {
        return sqlSession.selectOne("goods.selectTotalCount");
    }
}
