package com.example.demo.model;

import javax.persistence.*;

@Table(name = "NGUYEN_LIEU")
@Entity
public class NguyenLieu {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "TEN_NGUYEN_LIEU",length = 1000)
    private String tenNguyenLieu;

    @Column(name = "LOAI_NGUYEN_LIEU",length = 1000)
    private String loaiNguyenLieu;

    @Column(name = "DON_VI_TINH",length = 1000)
    private String donViTinh;

    @Column(name = "MA_NGUYEN_LIEU",length = 1000)
    private String maNguyenLieu;

    @Column(name = "SO_LUONG")
    private Long soLuong;

    @Column(name = "DON_GIA")
    private Long donGia;

    @Column(name = "MA_NHA_CUNG_CAP")
    private Long maNhaCungCap;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTenNguyenLieu() {
        return tenNguyenLieu;
    }

    public void setTenNguyenLieu(String tenNguyenLieu) {
        this.tenNguyenLieu = tenNguyenLieu;
    }

    public String getLoaiNguyenLieu() {
        return loaiNguyenLieu;
    }

    public void setLoaiNguyenLieu(String loaiNguyenLieu) {
        this.loaiNguyenLieu = loaiNguyenLieu;
    }

    public String getDonViTinh() {
        return donViTinh;
    }

    public void setDonViTinh(String donViTinh) {
        this.donViTinh = donViTinh;
    }

    public String getMaNguyenLieu() {
        return maNguyenLieu;
    }

    public void setMaNguyenLieu(String maNguyenLieu) {
        this.maNguyenLieu = maNguyenLieu;
    }

    public Long getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Long soLuong) {
        this.soLuong = soLuong;
    }

    public Long getDonGia() {
        return donGia;
    }

    public void setDonGia(Long donGia) {
        this.donGia = donGia;
    }

    public Long getMaNhaCungCap() {
        return maNhaCungCap;
    }

    public void setMaNhaCungCap(Long maNhaCungCap) {
        this.maNhaCungCap = maNhaCungCap;
    }
}
