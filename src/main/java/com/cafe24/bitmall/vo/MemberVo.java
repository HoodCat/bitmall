package com.cafe24.bitmall.vo;

import java.sql.Date;
import java.sql.Time;

public class MemberVo {
    private Long no;
    private String id;
    private String password;
    private String name;
    private Date birth;
    private String telNumber;
    private String cellNumber;
    private String address;
    private String email;
    private Time regDate;
    private Integer classification;
   
    public Long getNo() {
        return no;
    }
    public void setNo(Long no) {
        this.no = no;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Date getBirth() {
        return birth;
    }
    public void setBirth(Date birth) {
        this.birth = birth;
    }
    public String getTelNumber() {
        return telNumber;
    }
    public void setTelNumber(String telNumber) {
        this.telNumber = telNumber;
    }
    public String getCellNumber() {
        return cellNumber;
    }
    public void setCellNumber(String cellNumber) {
        this.cellNumber = cellNumber;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public Time getRegDate() {
        return regDate;
    }
    public void setRegDate(Time regDate) {
        this.regDate = regDate;
    }
    public Integer getClassification() {
        return classification;
    }
    public void setClassification(Integer classification) {
        this.classification = classification;
    }
    
    @Override
    public String toString() {
        return "MemberVo [no=" + no + ", id=" + id + ", password=" + password + ", name=" + name + ", birth=" + birth
                + ", telNumber=" + telNumber + ", cellNumber=" + cellNumber + ", address=" + address + ", email="
                + email + ", regDate=" + regDate + ", classification=" + classification + "]";
    }
}
