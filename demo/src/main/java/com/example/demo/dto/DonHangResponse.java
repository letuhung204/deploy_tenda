package com.example.demo.dto;

public class DonHangResponse {
    private Long id;
    private Long idNguyenLieu;
    private String tenNguyenLieu;
    private Long soLuong;
    private Long donGia;
    private Long tongGiaSanPham;
    private String donViTinh;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDonViTinh() {
        return donViTinh;
    }

    public void setDonViTinh(String donViTinh) {
        this.donViTinh = donViTinh;
    }

    public Long getIdNguyenLieu() {
        return idNguyenLieu;
    }

    public void setIdNguyenLieu(Long idNguyenLieu) {
        this.idNguyenLieu = idNguyenLieu;
    }

    public String getTenNguyenLieu() {
        return tenNguyenLieu;
    }

    public void setTenNguyenLieu(String tenNguyenLieu) {
        this.tenNguyenLieu = tenNguyenLieu;
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

    public Long getTongGiaSanPham() {
        return tongGiaSanPham;
    }

    public void setTongGiaSanPham(Long tongGiaSanPham) {
        this.tongGiaSanPham = tongGiaSanPham;
    }
}
