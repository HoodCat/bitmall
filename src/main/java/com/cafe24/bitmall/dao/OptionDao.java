package com.cafe24.bitmall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.OptionVo;

@Repository
public class OptionDao {

    @Autowired
    private SqlSession sqlSession;
    
    public Long getTotalCount() {
        return sqlSession.selectOne("option.selectCountTotal");
    }
    
    public boolean insert(OptionVo optionVo) {
        return sqlSession.insert("option.insert", optionVo)==1;
    }
    
    public boolean update(OptionVo optionVo) {
        return sqlSession.update("option.update", optionVo)==1;
    }
    
    public boolean delete(OptionVo optionVo) {
        return sqlSession.delete("option.delete", optionVo)==1;
    }
    
    public List<OptionVo> selectList() {
        return sqlSession.selectList("option.selectList");
    }
    
    public OptionVo selectOption(Long no) {
        return sqlSession.selectOne("option.selectByNo", no);
    }
}
