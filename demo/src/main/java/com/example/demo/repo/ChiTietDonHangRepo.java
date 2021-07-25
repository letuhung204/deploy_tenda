package com.example.demo.repo;

import com.example.demo.model.ChiTietDonHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface ChiTietDonHangRepo extends JpaRepository<ChiTietDonHang,Long> {

    @Query(value = "select * from CHI_TIET_DON_HANG ct WHERE ct.MA_DON_HANG =:maNhaCungCap",nativeQuery = true)
    public ArrayList<ChiTietDonHang> listChiTietDonHangByNhaCungCap(@Param("maNhaCungCap") Long maNhaCungCap);
}
