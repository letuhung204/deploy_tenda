package com.example.demo.controller;

import com.example.demo.model.NguyenLieu;
import com.example.demo.model.NhaCungCap;
import com.example.demo.repo.NguyenLieuRepo;
import com.example.demo.repo.NhaCungCapRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class NhaCungCapController {

    @Autowired
    private NhaCungCapRepo nhaCungCapRepo;
    @Autowired
    private NguyenLieuRepo nguyenLieuRepo;

    @GetMapping("/nhaCungCapJson")
    @ResponseBody
    public List<NhaCungCap> getListNhaCungCap(){
        return nhaCungCapRepo.findAll();
    }

    @GetMapping("/nhacungcap")
    public String nhaCungCap(Model model, @RequestParam(value = "tenNhaCungCap", required = false) String tenNhaCungCap) {
        List<NhaCungCap> nhaCungCapList = new ArrayList<>();
        if (null != tenNhaCungCap && !"".equals(tenNhaCungCap)) {
            nhaCungCapList = nhaCungCapRepo.listNhaCungCapByName(tenNhaCungCap);
        }else {
          nhaCungCapList = nhaCungCapRepo.findAll();
        }
        model.addAttribute("test",new NhaCungCap());
        model.addAttribute("nhaCungCapList", nhaCungCapList);
        return "nhaCungCap";
    }

    @GetMapping("/them-nha-cung-cap")
    public String themNhaCungCap(Model model, @RequestParam(value = "id", required = false) Long id) {

        NhaCungCap nhaCungCap;
        if (null == id) {
            nhaCungCap = new NhaCungCap();
        } else {
            nhaCungCap = nhaCungCapRepo.getOne(id);
        }
        model.addAttribute("nhaCungCap", nhaCungCap);
        return "nhaCungCapForm";
    }

    @PostMapping("/save-nha-cung-cap")
    public RedirectView saveNhaCungCap(NhaCungCap nhaCungCap, RedirectAttributes redirectAttributes) {
        if (null != nhaCungCap.getId()) {
            NhaCungCap nhaCungCapOld = nhaCungCapRepo.getOne(nhaCungCap.getId());
            nhaCungCapOld.setDiaChi(nhaCungCap.getDiaChi());
            nhaCungCapOld.setEmail(nhaCungCap.getEmail());
            nhaCungCapOld.setFax(nhaCungCap.getFax());
            nhaCungCapOld.setSoDienThoai(nhaCungCap.getSoDienThoai());
            nhaCungCapOld.setTenNhaCungCap(nhaCungCap.getTenNhaCungCap());

            nhaCungCapRepo.save(nhaCungCapOld);
            return new RedirectView("/nhacungcap", true);
        } else {
            if (nhaCungCap != null) {
                nhaCungCapRepo.save(nhaCungCap);
                return new RedirectView("/nhacungcap", true);
            } else {
                redirectAttributes.addFlashAttribute("message", "Thêm nhà cung cấp lỗi, vui lòng nhập đúng thông tin !");
                return new RedirectView("/them-nha-cung-cap", true);
            }
        }
    }

    @GetMapping("/delete-nha-cung-cap/{id}")
    public RedirectView xoaNhaCungCap(@PathVariable Long id) {
        NhaCungCap nhaCungCap = nhaCungCapRepo.getOne(id);
        if (nhaCungCap != null) {
            nhaCungCapRepo.delete(nhaCungCap);
            nguyenLieuRepo.deleteNguyenLieuByNhaCC(id);
        }
        return new RedirectView("/nhacungcap", true);
    }

}
