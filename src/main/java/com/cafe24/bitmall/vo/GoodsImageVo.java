package com.cafe24.bitmall.vo;

public class GoodsImageVo {
    private Long no;
    private Long goodsNo;
    private String path;
    
    public Long getNo() {
        return no;
    }
    public void setNo(Long no) {
        this.no = no;
    }
    public Long getGoodsNo() {
        return goodsNo;
    }
    public void setGoodsNo(Long goodsNo) {
        this.goodsNo = goodsNo;
    }
    public String getPath() {
        return path;
    }
    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "GoodsImageVo [no=" + no + ", goodsNo=" + goodsNo + ", path=" + path + "]";
    }
    
}
