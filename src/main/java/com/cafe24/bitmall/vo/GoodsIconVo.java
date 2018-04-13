package com.cafe24.bitmall.vo;

public class GoodsIconVo {
    private Long no;
    private Long goodsNo;
    private Long iconNo;
    
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
    public Long getIconNo() {
        return iconNo;
    }
    public void setIconNo(Long iconNo) {
        this.iconNo = iconNo;
    }
    
    @Override
    public String toString() {
        return "GoodsIconVo [no=" + no + ", goodsNo=" + goodsNo + ", iconNo=" + iconNo + "]";
    }
    
}
