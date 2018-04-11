package com.cafe24.bitmall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.MemberVo;

@Repository
public class MemberDao {
    @Autowired
    SqlSession sqlSession;
    
    public boolean insert(MemberVo memberVo) {
        return sqlSession.insert("member.insert", memberVo)==1;
    }
    
    public int getMemberCount(String id) {
        return sqlSession.selectOne("member.getMemberCountById", id);
    }
    
    public MemberVo getMember(MemberVo memberVo) {
        return sqlSession.selectOne("member.getMember", memberVo);
    }
}
