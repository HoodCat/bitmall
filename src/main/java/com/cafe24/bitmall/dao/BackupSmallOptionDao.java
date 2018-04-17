package com.cafe24.bitmall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.SmallOptionVo;

@Repository
public class BackupSmallOptionDao {
    @Autowired
    private SqlSession sqlSession;
    
    public boolean insert(SmallOptionVo vo) {
        return sqlSession.insert("backupsmalloption.insert", vo) == 1;
    }
}
