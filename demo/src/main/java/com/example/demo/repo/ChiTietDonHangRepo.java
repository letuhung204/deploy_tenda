package com.example.demo.repo;

import com.example.demo.model.ChiTietDonHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface ChiTietDonHangRepo extends JpaRepository<ChiTietDonHang,Long> {

    @Query(value = "select * from CHI_TIET_DON_HANG ct WHERE ct.MA_DON_HANG =:maNhaCungCap",nativeQuery = true)
    public List<ChiTietDonHang> listChiTietDonHangByNhaCungCap(@Param("maNhaCungCap") Long maNhaCungCap);

    @Query(value = "select * from CHI_TIET_DON_HANG ct WHERE ct.MA_DON_HANG =:maNhaCungCap and ct.STATUS LIKE 'THEM_VAO_GIO' ",nativeQuery = true)
    public List<ChiTietDonHang> listCTĐHStatusGioHang(@Param("maNhaCungCap") Long maNhaCungCap);

    @Query(value = "select * from CHI_TIET_DON_HANG ct WHERE ct.MA_DON_HANG =:maNhaCungCap and ct.STATUS LIKE 'DA_DAT_HANG'",nativeQuery = true)
    public List<ChiTietDonHang> listCTĐHStatusDatHang(@Param("maNhaCungCap") Long maNhaCungCap);

    @Query(value = "select * from CHI_TIET_DON_HANG ct WHERE ct.STATUS LIKE 'DA_DAT_HANG'",nativeQuery = true)
    public List<ChiTietDonHang> listCTĐHStatus();
}
