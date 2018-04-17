package com.cafe24.bitmall.vo;

public class CartVo {
    private Long no;
    private Long memberNo;
    private Long goodsNo;
    private Long amount;
    
    public Long getNo() {
        return no;
    }
    public void setNo(Long no) {
        this.no = no;
    }
    public Long getMemberNo() {
        return memberNo;
    }
    public void setMemberNo(Long memberNo) {
        this.memberNo = memberNo;
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
        return "GoodsInCartVo [no=" + no + ", memberNo=" + memberNo + ", goodsNo=" + goodsNo + ", amount=" + amount
                + "]";
    }
}
