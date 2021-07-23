package com.example.demo.repo;

import com.example.demo.model.NguyenLieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NguyenLieuRepo extends JpaRepository<NguyenLieu,Long> {
}
