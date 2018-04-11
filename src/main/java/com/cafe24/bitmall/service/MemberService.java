package com.cafe24.bitmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.MemberDao;
import com.cafe24.bitmall.vo.MemberVo;

@Service
public class MemberService {
    
    @Autowired
    private MemberDao memberDao;
    
    public boolean joinMember(MemberVo memberVo) {
        return memberDao.insert(memberVo);
    }
    
    public boolean isExist(String id) {
        int count = memberDao.getMemberCount(id);
        return count>=1;
    }
    
    public MemberVo getAuthMember(MemberVo memberVo) {
        return memberDao.getMember(memberVo);
    }
}
