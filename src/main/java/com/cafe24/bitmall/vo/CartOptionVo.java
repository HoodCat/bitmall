package com.cafe24.bitmall.vo;

public class CartOptionVo {
    private Long no;
    private Long cartNo;
    private Long smallOptionNo;
    
    public Long getNo() {
        return no;
    }
    public void setNo(Long no) {
        this.no = no;
    }
    public Long getCartNo() {
        return cartNo;
    }
    public void setCartNo(Long cartNo) {
        this.cartNo = cartNo;
    }
    public Long getSmallOptionNo() {
        return smallOptionNo;
    }
    public void setSmallOptionNo(Long smallOptionNo) {
        this.smallOptionNo = smallOptionNo;
    }

    @Override
    public String toString() {
        return "CartOptionVo [no=" + no + ", cartNo=" + cartNo + ", smallOptionNo=" + smallOptionNo + "]";
    }
    
}
