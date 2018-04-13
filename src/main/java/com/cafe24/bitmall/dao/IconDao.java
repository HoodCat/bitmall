package com.cafe24.bitmall.dao;

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
}
