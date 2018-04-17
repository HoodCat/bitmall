package com.cafe24.bitmall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.IconVo;

@Repository
public class IconDao {
    @Autowired
    private SqlSession sqlSession;
    
    public IconVo selectIcon(IconVo iconVo) {
        return sqlSession.selectOne("icon.selectByName", iconVo);
    }
    
    public List<IconVo> selectIconList() {
        return sqlSession.selectList("icon.selectList");
    }
    
    public List<IconVo> selectIconList(Long goodsNo){
        return sqlSession.selectList("icon.selectListByGoodsNo", goodsNo);
    }
}
