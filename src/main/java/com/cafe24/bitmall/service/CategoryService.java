package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.CategoryDao;
import com.cafe24.bitmall.vo.CategoryVo;

@Service
public class CategoryService {
    @Autowired
    private CategoryDao categoryDao;
    
    public CategoryVo getCategory(CategoryVo categoryVo) {
        return categoryDao.selectCategory(categoryVo);
    }
    
    public List<CategoryVo> getCategoryList() {
        return categoryDao.selectCategoryList();
    }
}
