package com.cafe24.bitmall.vo;

public class GoodsImageVo {
    private Long no;
    private Long goods_no;
    private String path;
    
    public Long getNo() {
        return no;
    }
    public void setNo(Long no) {
        this.no = no;
    }
    public Long getGoods_no() {
        return goods_no;
    }
    public void setGoods_no(Long goods_no) {
        this.goods_no = goods_no;
    }
    public String getPath() {
        return path;
    }
    public void setPath(String path) {
        this.path = path;
    }
    
    @Override
    public String toString() {
        return "GoodsImageVo [no=" + no + ", goods_no=" + goods_no + ", path=" + path + "]";
    }
    
}
