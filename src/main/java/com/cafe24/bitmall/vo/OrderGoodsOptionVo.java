package com.cafe24.bitmall.vo;

public class OrderGoodsOptionVo {
    private Long no;
    private Long goodsNo;
    private Long smallOptionNo;
    
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
    public Long getSmallOptionNo() {
        return smallOptionNo;
    }
    public void setSmallOptionNo(Long smallOptionNo) {
        this.smallOptionNo = smallOptionNo;
    }
    
    @Override
    public String toString() {
        return "OrderGoodsOptionVo [no=" + no + ", goodsNo=" + goodsNo + ", smallOptionNo=" + smallOptionNo + "]";
    }
    
}
