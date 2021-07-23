package com.example.demo.model;

import javax.persistence.*;

@Entity
@Table(name = "NHA_CUNG_CAP")
public class NhaCungCap {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "TEN_NHA_CUNG_CAP", length = 1000)
    private String tenNhaCungCap;

    @Column(name = "DIA_CHI", length = 1000)
    private String diaChi;

    @Column(name = "TELEPHONE", length = 1000)
    private String soDienThoai;

    @Column(name = "FAX", length = 1000)
    private String fax;

    @Column(name = "EMAIL", length = 1000)
    private String email;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTenNhaCungCap() {
        return tenNhaCungCap;
    }

    public void setTenNhaCungCap(String tenNhaCungCap) {
        this.tenNhaCungCap = tenNhaCungCap;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
