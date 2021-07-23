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

    @Column(name = "DON_GIA",length = 1000)
    private String donGia;

    @Column(name = "MA_NHA_CUNG_CAP")
    private Long maNhaCungCap;

}
