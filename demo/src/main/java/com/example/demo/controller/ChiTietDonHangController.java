package com.example.demo.controller;

import com.example.demo.dto.ChitietDonHangResponse;
import com.example.demo.dto.DonHangResponse;
import com.example.demo.model.ChiTietDonHang;
import com.example.demo.model.NguyenLieu;
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
        chiTietDonHangList = chiTietDonHangRepo.listCTĐHStatusGioHang(maNhaCungCap);

        ChitietDonHangResponse chitietDonHangResponse = new ChitietDonHangResponse();
        chitietDonHangResponse.setMaNhaCungCap(maNhaCungCap);
        chitietDonHangResponse.setTenNhaCungCap( nhaCungCapRepo.getOne(maNhaCungCap) !=null ? nhaCungCapRepo.getOne(maNhaCungCap).getTenNhaCungCap() :"" );
        List<DonHangResponse> donHangResponseList = new ArrayList<>();
        Long tong = Long.valueOf(0);
        for (ChiTietDonHang chiTietDonHang:chiTietDonHangList) {
            DonHangResponse donHangResponse = new DonHangResponse();
            donHangResponse.setIdNguyenLieu(chiTietDonHang.getIdNguyenLieu());
            NguyenLieu nguyenLieu = nguyenLieuRepo.getOne(chiTietDonHang.getIdNguyenLieu());
            donHangResponse.setTenNguyenLieu(nguyenLieu.getTenNguyenLieu());
            donHangResponse.setDonGia(nguyenLieu.getDonGia());
            donHangResponse.setDonViTinh(nguyenLieu.getDonViTinh());
            donHangResponse.setSoLuong(chiTietDonHang.getSoLuong());
            donHangResponse.setTongGiaSanPham(chiTietDonHang.getSoLuong() * nguyenLieu.getDonGia());
            donHangResponse.setId(chiTietDonHang.getId());

            donHangResponseList.add(donHangResponse);
            tong += donHangResponse.getTongGiaSanPham();
        }
        chitietDonHangResponse.setChitietDonHangResponseList(donHangResponseList);
        chitietDonHangResponse.setTongGiaDonHang(tong);

        model.addAttribute("chiTietDonHangList",chitietDonHangResponse);
        return "chitietdonhang";
    }
    @PostMapping("/save-hoa-don")
    public RedirectView saveHoaDon(@RequestParam("maNhaCungCap")Long maNhaCungCap,RedirectAttributes redirectAttributes){
        List<ChiTietDonHang>  chiTietDonHangList = chiTietDonHangRepo.listCTĐHStatusGioHang(maNhaCungCap);
        for (ChiTietDonHang chiTietDonHang:chiTietDonHangList) {
            chiTietDonHang.setStatus("DA_DAT_HANG");
            chiTietDonHangRepo.save(chiTietDonHang);
        }
        redirectAttributes.addFlashAttribute("THONGBAO","bạn đã đặt hàng thành công !");
        return new RedirectView("/gioHang?maNhaCungCap="+maNhaCungCap,true);
    }

    @GetMapping(value = "/hoaDon")
    public String hoaDon(Model model){
        List<ChiTietDonHang> chiTietDonHangList = chiTietDonHangRepo.listCTĐHStatus();
        model.addAttribute("hoadon",chiTietDonHangList);
        return "hoaDon";
    }


    @GetMapping("/xoa-nguyen-lieu-da-chon")
    public RedirectView xoaNguyenLieuDaChon(@RequestParam("id")Long id,@RequestParam("maNhaCungCap")Long maNhaCungCap, RedirectAttributes redirectAttributes){
        ChiTietDonHang chiTietDonHang = chiTietDonHangRepo.getOne(id);
        if(chiTietDonHang != null){
            chiTietDonHangRepo.deleteById(id);
            redirectAttributes.addFlashAttribute("Delete","xóa thành công");
        }else{
            redirectAttributes.addFlashAttribute("Delete","xóa thất bại do không tồn tại");
        }

        return new RedirectView("/gioHang?maNhaCungCap="+maNhaCungCap ,true);
    }
}
