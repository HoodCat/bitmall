package com.cafe24.bitmall.vo;

public class GoodsOptionVo {
    private Long no;
    private Long goodsNo;
    private Long optionNo;
    
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
    public Long getOptionNo() {
        return optionNo;
    }
    public void setOptionNo(Long optionNo) {
        this.optionNo = optionNo;
    }
    
    @Override
    public String toString() {
        return "GoodsOptionVo [no=" + no + ", goodsNo=" + goodsNo + ", optionNo=" + optionNo + "]";
    }
    
}
