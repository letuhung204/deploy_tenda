package com.example.demo.controller;

import com.example.demo.model.ChiTietDonHang;
import com.example.demo.repo.ChiTietDonHangRepo;
import com.example.demo.repo.NguyenLieuRepo;
import com.example.demo.repo.NhaCungCapRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ChiTietDonHangController {
    @Autowired
    ChiTietDonHangRepo chiTietDonHangRepo;

    @Autowired
    NguyenLieuRepo nguyenLieuRepo;

    @Autowired
    NhaCungCapRepo nhaCungCapRepo;

    @PostMapping("/save-draf-don-hang")
    public RedirectView saveDrafDonHang(@RequestParam("idNguyenLieu") Long idNguyenLieu, @RequestParam("soLuong") Long soLuong, @RequestParam("nhaCungCap")Long nhaCungCap, RedirectAttributes redirectAttributes) {
        ChiTietDonHang chiTietDonHang = new ChiTietDonHang();
        chiTietDonHang.setIdNguyenLieu(idNguyenLieu);
        chiTietDonHang.setSoLuong(soLuong);
        chiTietDonHang.setMaDonHang(nhaCungCap);
        chiTietDonHang.setStatus("THEM_VAO_GIO");

        chiTietDonHangRepo.save(chiTietDonHang);
        redirectAttributes.addFlashAttribute("ThemGioHangThanhCong", "Bạn đã thực hiện thêm sản phẩm với số lượng "+soLuong+" vào giỏ hàng thành công");
        return new RedirectView("/nguyenlieu?nhaCungCap="+nhaCungCap,true);
    }
    @GetMapping("/gioHang")
    public String gioHang(@RequestParam("maNhaCungCap")Long maNhaCungCap, Model model){
        List<ChiTietDonHang> chiTietDonHangList = new ArrayList<>();
        chiTietDonHangList = chiTietDonHangRepo.listChiTietDonHangByNhaCungCap(maNhaCungCap);

        model.addAttribute("chiTietDonHangList",chiTietDonHangList);
        return "chitietdonhang";
    }
}
