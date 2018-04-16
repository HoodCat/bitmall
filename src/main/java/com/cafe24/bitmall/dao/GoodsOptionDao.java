package com.cafe24.bitmall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.GoodsOptionVo;
import com.cafe24.bitmall.vo.GoodsVo;

@Repository
public class GoodsOptionDao {
    @Autowired
    private SqlSession sqlSession;
    
    public boolean insert(GoodsOptionVo vo) {
        return sqlSession.insert("goodsoption.insert", vo) == 1;
    }
    
    public List<GoodsOptionVo> selectList(Long goodsNo) {
        return sqlSession.selectList("goodsoption.selectByGoodsNo", goodsNo);
    }
    
    public List<GoodsOptionVo> selectList(GoodsVo goodsVo) {
        return sqlSession.selectList("goodsoption.selectByGoods", goodsVo);
    }
}
