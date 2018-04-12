package com.cafe24.bitmall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CategoryVo;

@Repository
public class CategoryDao {
    @Autowired
    private SqlSession sqlSession;
    
    public CategoryVo selectCategory(CategoryVo categoryVo) {
        return sqlSession.selectOne("category.select", categoryVo);
    }
    
    public List<CategoryVo> selectCategoryList(){
        return sqlSession.selectList("category.selectList");
    }
}
