package com.example.demo.repo;

import org.springframework.stereotype.Repository;
import com.example.demo.model.Background;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface BackgroundRepo extends JpaRepository<Background, Integer> {
}
