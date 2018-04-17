package com.cafe24.bitmall.vo;

public class OrderGoodsVo {
    private Long no;
    private Long orderNo;
    private Long goodsNo;
    private Long amount;
    public Long getNo() {
        return no;
    }
    public void setNo(Long no) {
        this.no = no;
    }
    public Long getOrderNo() {
        return orderNo;
    }
    public void setOrderNo(Long orderNo) {
        this.orderNo = orderNo;
    }
    public Long getGoodsNo() {
        return goodsNo;
    }
    public void setGoodsNo(Long goodsNo) {
        this.goodsNo = goodsNo;
    }
    public Long getAmount() {
        return amount;
    }
    public void setAmount(Long amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "OrderGoodsVo [no=" + no + ", orderNo=" + orderNo + ", goodsNo=" + goodsNo + ", amount=" + amount + "]";
    }
    
}
