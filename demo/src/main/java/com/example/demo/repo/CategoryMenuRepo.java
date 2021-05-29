//package com.example.demo.repo;
//
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Modifying;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
//import org.springframework.stereotype.Repository;
//
//import com.example.demo.model.CatagoryMenu;
//
//import javax.transaction.Transactional;
//import java.util.List;
//
//@Repository
//public interface CategoryMenuRepo extends JpaRepository<CatagoryMenu,Integer> {
//
//    @Query(value = "select * from catagory_menu where id_catagory =:idCatagory",nativeQuery = true)
//    public List<CatagoryMenu> listItemCategory(@Param("idCatagory") int idCatagory);
//
//    @Query(value = "select * from catagory_menu where id_menu =:idMenu",nativeQuery = true)
//    public CatagoryMenu itemCategory(@Param("idMenu") int idMenu);
//
//    @Query(value = "delete from catagory_menu where id_catagory =:idCatagory",nativeQuery = true)
//    @Modifying
//    @Transactional
//    public void deleteCatagoryMenuByIdCategory(@Param("idCatagory") int idCatagory);
//
//}
