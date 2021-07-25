package com.example.demo.model;

import javax.persistence.*;

@Entity
@Table(name = "CHI_TIET_DON_HANG")
public class ChiTietDonHang {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private Long idNguyenLieu;

    @Column(name = "MA_DON_HANG")
    private Long maDonHang;

    private Long soLuong;

    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdNguyenLieu() {
        return idNguyenLieu;
    }

    public void setIdNguyenLieu(Long idNguyenLieu) {
        this.idNguyenLieu = idNguyenLieu;
    }

    public Long getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(Long maDonHang) {
        this.maDonHang = maDonHang;
    }

    public Long getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Long soLuong) {
        this.soLuong = soLuong;
    }
}
