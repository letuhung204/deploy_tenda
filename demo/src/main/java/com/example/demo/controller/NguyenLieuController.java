package com.example.demo.controller;

import com.example.demo.model.ChiTietDonHang;
import com.example.demo.model.NguyenLieu;
import com.example.demo.model.NhaCungCap;
import com.example.demo.repo.NguyenLieuRepo;
import com.example.demo.repo.NhaCungCapRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;
@Controller
public class NguyenLieuController {
    @Autowired
    private NguyenLieuRepo nguyenLieuRepo;
    @Autowired
    private NhaCungCapRepo nhaCungCapRepo;

    @GetMapping("/nguyenlieu")
    public String nguyenLieu(Model model,@RequestParam("nhaCungCap")Long nhaCungCap){

        List<NguyenLieu> nguyenLieuList = nguyenLieuRepo.getListNguyenLieuByNhaCungCap(nhaCungCap);

        model.addAttribute("nguyenLieuList",nguyenLieuList);
        model.addAttribute("maNhaCungCap",nhaCungCap);
        if(nhaCungCapRepo.getOne(nhaCungCap) != null){
            model.addAttribute("tenNhaCungCap",nhaCungCapRepo.getOne(nhaCungCap).getTenNhaCungCap());
        }
        ChiTietDonHang chiTietDonHang = new ChiTietDonHang();
        model.addAttribute("chiTietDonHang",chiTietDonHang);
        return "nguyenLieu";
    }
    @GetMapping("/them-nguyen-lieu/{maNhaCungCap}")
    public String themNguyenLieu(Model model, @RequestParam(value = "id",required = false)Long id,@PathVariable Long maNhaCungCap){

        NguyenLieu nguyenLieu;
        if(null == id){
            nguyenLieu = new NguyenLieu();

        }else{
            nguyenLieu = nguyenLieuRepo.getOne(id);
        }
        nguyenLieu.setMaNhaCungCap(maNhaCungCap);
        model.addAttribute("nguyenLieu",nguyenLieu);
        model.addAttribute("maNhaCungCap",maNhaCungCap);
        return "nguyenLieuForm";
    }

    @PostMapping("/save-nguyen-lieu")
    public RedirectView saveNguyenLieu(NguyenLieu nguyenLieu, RedirectAttributes redirectAttributes,@RequestParam("maNhaCungCap")Long maNhaCungCap){
        if(null != nguyenLieu.getId()){
            NguyenLieu nguyenLieuOld = nguyenLieuRepo.getOne(nguyenLieu.getId());
            nguyenLieuOld.setSoLuong(nguyenLieu.getSoLuong());
            nguyenLieuOld.setDonGia(nguyenLieu.getDonGia());
            nguyenLieuOld.setDonViTinh(nguyenLieu.getDonViTinh());
            nguyenLieuOld.setLoaiNguyenLieu(nguyenLieu.getLoaiNguyenLieu());
            nguyenLieuOld.setMaNguyenLieu(nguyenLieu.getMaNguyenLieu());
            nguyenLieuOld.setTenNguyenLieu(nguyenLieu.getTenNguyenLieu());
            nguyenLieuOld.setMaNhaCungCap(maNhaCungCap);
            nguyenLieuRepo.save(nguyenLieuOld);
            return new RedirectView("/nguyenlieu?nhaCungCap="+ maNhaCungCap,true);
        }else{
            if(nguyenLieu !=null){
                nguyenLieu.setMaNhaCungCap(maNhaCungCap);
                nguyenLieuRepo.save(nguyenLieu);
                return new RedirectView("/nguyenlieu?nhaCungCap="+ maNhaCungCap,true);
            }else{
                redirectAttributes.addFlashAttribute("message","Thêm nguyên liệu lỗi, vui lòng nhập đúng thông tin !");
                return new RedirectView("/them-nguyen-lieu/${}",true);
            }
        }
    }

    @GetMapping("/delete-nguyen-lieu/{maNhaCungCap}")
    public RedirectView xoaNguyenLieu(@RequestParam("id") Long id,@PathVariable Long maNhaCungCap){
        NguyenLieu nguyenLieu = nguyenLieuRepo.getOne(id);
        if(nguyenLieu !=null){
            nguyenLieuRepo.delete(nguyenLieu);
        }
        return new RedirectView("/nguyenlieu?nhaCungCap="+ maNhaCungCap,true);
    }
}
