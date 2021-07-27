package com.example.demo.repo;

import com.example.demo.model.NhaCungCap;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface NhaCungCapRepo extends JpaRepository<NhaCungCap, Long> {
    @Query(value = "select * from NHA_CUNG_CAP ncc where ncc.TEN_NHA_CUNG_CAP like CONCAT('%',:tenNhaCungCap,'%')",nativeQuery = true)
    List<NhaCungCap> listNhaCungCapByName(@Param("tenNhaCungCap") String tenNhaCungCap);
}
