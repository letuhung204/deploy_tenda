package com.example.demo.repo;

import com.example.demo.model.NhaCungCap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NhaCungCapRepo extends JpaRepository<NhaCungCap,Long> {
}
