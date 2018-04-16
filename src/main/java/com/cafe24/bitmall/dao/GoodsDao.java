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
    
    public static int getListPageSize() {
        return LIST_PAGE_SIZE;
    }

    public boolean insert(GoodsVo goodsVo) {
        return sqlSession.insert("goods.insert", goodsVo)==1;
    }
    
    public GoodsVo select(GoodsVo goodsVo) {
        return sqlSession.selectOne("goods.select", goodsVo);
    }
    
    public GoodsVo select(Long no) {
        return sqlSession.selectOne("goods.selectByNo", no);
    }
    
    public List<Map<String, Object>> selectList(Map<String, Object> parameter) {
        return sqlSession.selectList("goods.selectList", parameter);
    }
    
    public Long selectTotalCount(Map<String, Object> parameter) {
        return sqlSession.selectOne("goods.selectTotalCount", parameter);
    }
}
