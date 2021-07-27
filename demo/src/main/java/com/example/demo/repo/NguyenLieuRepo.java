package com.example.demo.repo;

import com.example.demo.model.NguyenLieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface NguyenLieuRepo extends JpaRepository<NguyenLieu,Long> {
    @Query(value = "select * from NGUYEN_LIEU a where a.MA_NHA_CUNG_CAP =:maNhaCungCap ",nativeQuery = true)
    public List<NguyenLieu> getListNguyenLieuByNhaCungCap(@Param("maNhaCungCap")Long maNhaCungCap);

    @Query(value = "DELETE * FROM NGUYEN_LIEU a where a.MA_NHA_CUNG_CAP =:maNhaCungCap", nativeQuery = true)
    @Transactional
    @Modifying
    public void deleteNguyenLieuByNhaCC(@Param("maNhaCungCap")Long maNhaCungCap);

    @Query(value = "select * from NGUYEN_LIEU a where a.MA_NHA_CUNG_CAP =:maNhaCungCap and a.TEN_NGUYEN_LIEU LIKE CONCAT('%',:tenNguyenLieu,'%')",nativeQuery = true)
    public List<NguyenLieu> getListNguyenLieuByNhaCungCapSearch(@Param("maNhaCungCap")Long maNhaCungCap,@Param("tenNguyenLieu")String tenNguyenLieu);
}
