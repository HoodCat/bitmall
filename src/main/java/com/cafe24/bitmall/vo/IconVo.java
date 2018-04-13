package com.cafe24.bitmall.vo;

public class IconVo {
    private Long no;
    private String name;
    private String iconImage;
    
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
    public String getIconImage() {
        return iconImage;
    }
    public void setIconImage(String iconImage) {
        this.iconImage = iconImage;
    }
    
    @Override
    public String toString() {
        return "IconVo [no=" + no + ", name=" + name + ", iconImage=" + iconImage + "]";
    }
    
}
