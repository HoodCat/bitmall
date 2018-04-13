package com.cafe24.bitmall.vo;

public class GoodsVo {
    private Long no;
    private String code;
    private String name;
    private String manufacture;
    private Long price;
    private String description;
    private Long rateSale;
    private Long categoryNo;
    private Long statusNo;
    
    public Long getNo() {
        return no;
    }
    public void setNo(Long no) {
        this.no = no;
    }
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getManufacture() {
        return manufacture;
    }
    public void setManufacture(String manufacture) {
        this.manufacture = manufacture;
    }
    public Long getPrice() {
        return price;
    }
    public void setPrice(Long price) {
        this.price = price;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public Long getRateSale() {
        return rateSale;
    }
    public void setRateSale(Long rateSale) {
        this.rateSale = rateSale;
    }
    public Long getCategoryNo() {
        return categoryNo;
    }
    public void setCategoryNo(Long categoryNo) {
        this.categoryNo = categoryNo;
    }
    public Long getStatusNo() {
        return statusNo;
    }
    public void setStatusNo(Long statusNo) {
        this.statusNo = statusNo;
    }
    
    @Override
    public String toString() {
        return "GoodsVo [no=" + no + ", code=" + code + ", name=" + name + ", manufacture=" + manufacture + ", price="
                + price + ", description=" + description + ", rateSale=" + rateSale + ", categoryNo=" + categoryNo
                + ", statusNo=" + statusNo + "]";
    }
    
}
