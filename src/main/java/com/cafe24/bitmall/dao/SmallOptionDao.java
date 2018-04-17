package com.cafe24.bitmall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.SmallOptionVo;

@Repository
public class SmallOptionDao {
    @Autowired
    private SqlSession session;
    
    public SmallOptionVo selectSmallOption(Long no) {
        return session.selectOne("smalloption.selectByNo", no);
    }
    
    public SmallOptionVo selectSmallOption(SmallOptionVo sOptionVo) {
        return session.selectOne("smalloption.select", sOptionVo);
    }
    
    public List<SmallOptionVo> selectSmallOptionList(Long optionNo) {
        return session.selectList("smalloption.selectByOptionNo", optionNo);
    }
    
    public List<SmallOptionVo> selectSmallOptionListByGoodsNo(Long goodsNo) {
        return session.selectList("smalloption.selectByGoodsNo", goodsNo);
    }
    
    public boolean insert(SmallOptionVo sOptionVo) {
        return session.insert("smalloption.insert", sOptionVo)==1;
    }
    
    public boolean update(SmallOptionVo sOptionVo) {
        return session.update("smalloption.update", sOptionVo)==1;
    }
    
    public boolean delete(SmallOptionVo sOptionVo) {
        return session.delete("smalloption.delete", sOptionVo)==1;
    }
    
}
