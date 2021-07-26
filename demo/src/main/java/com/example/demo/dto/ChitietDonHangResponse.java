package com.example.demo.dto;

import java.util.List;

public class ChitietDonHangResponse {
    private Long maNhaCungCap;
    private String tenNhaCungCap;
    private List<DonHangResponse> chitietDonHangResponseList;
    private Long tongGiaDonHang;

    public Long getMaNhaCungCap() {
        return maNhaCungCap;
    }

    public void setMaNhaCungCap(Long maNhaCungCap) {
        this.maNhaCungCap = maNhaCungCap;
    }

    public String getTenNhaCungCap() {
        return tenNhaCungCap;
    }

    public void setTenNhaCungCap(String tenNhaCungCap) {
        this.tenNhaCungCap = tenNhaCungCap;
    }

    public List<DonHangResponse> getChitietDonHangResponseList() {
        return chitietDonHangResponseList;
    }

    public void setChitietDonHangResponseList(List<DonHangResponse> chitietDonHangResponseList) {
        this.chitietDonHangResponseList = chitietDonHangResponseList;
    }

    public Long getTongGiaDonHang() {
        return tongGiaDonHang;
    }

    public void setTongGiaDonHang(Long tongGiaDonHang) {
        this.tongGiaDonHang = tongGiaDonHang;
    }
}
