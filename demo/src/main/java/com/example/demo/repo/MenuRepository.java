package com.example.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Menu;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface MenuRepository extends JpaRepository<Menu, Integer> {

    @Query(value="select * from menu where id_category =:idCategory",nativeQuery = true)
    public List<Menu> listMenuByIdCategory(@Param("idCategory")int idCategory);

    @Modifying
    @Transactional
    @Query(value = "delete from menu where id_category =:idCatagory",nativeQuery = true)
    public void deleteCatagoryMenuByIdCategory(@Param("idCatagory") int idCatagory);

}
