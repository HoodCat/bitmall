package com.cafe24.bitmall.vo;

import java.sql.Date;

public class OrderVo {
    private Long no;
    private Date orderDate;
    private Long orderCode;
    private Long orderStatus;
    private Long paymentMethod;
    private String address;
    private String recommand;
    private Long memberNo;
    public Long getNo() {
        return no;
    }
    public void setNo(Long no) {
        this.no = no;
    }
    public Date getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    public Long getOrderCode() {
        return orderCode;
    }
    public void setOrderCode(Long orderCode) {
        this.orderCode = orderCode;
    }
    public Long getOrderStatus() {
        return orderStatus;
    }
    public void setOrderStatus(Long orderStatus) {
        this.orderStatus = orderStatus;
    }
    public Long getPaymentMethod() {
        return paymentMethod;
    }
    public void setPaymentMethod(Long paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getRecommand() {
        return recommand;
    }
    public void setRecommand(String recommand) {
        this.recommand = recommand;
    }
    public Long getMemberNo() {
        return memberNo;
    }
    public void setMemberNo(Long memberNo) {
        this.memberNo = memberNo;
    }
    
    @Override
    public String toString() {
        return "OrderVo [no=" + no + ", orderDate=" + orderDate + ", orderCode=" + orderCode + ", orderStatus="
                + orderStatus + ", paymentMethod=" + paymentMethod + ", address=" + address + ", recommand=" + recommand
                + ", memberNo=" + memberNo + "]";
    }
    
}
