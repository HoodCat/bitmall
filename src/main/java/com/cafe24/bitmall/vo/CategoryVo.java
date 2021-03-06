package com.cafe24.bitmall.vo;

public class CategoryVo {
    private Long no;
    private String name;
    private String imagePath;
    
    public Long getNo() {
        return no;
    }
    public void setNo(Long no) {
        this.no = no;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getImagePath() {
        return imagePath;
    }
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    
    @Override
    public String toString() {
        return "CategoryVo [no=" + no + ", name=" + name + ", imagePath=" + imagePath + "]";
    }
    
}
