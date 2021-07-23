package com.example.demo.controller;

import com.example.demo.model.NhaCungCap;
import com.example.demo.repo.NhaCungCapRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class NhaCungCapController {

    @Autowired
    private NhaCungCapRepo nhaCungCapRepo;

    @GetMapping("/nhacungcap")
    public String nhaCungCap(Model model){
        List<NhaCungCap> nhaCungCapList = nhaCungCapRepo.findAll();

       model.addAttribute("nhaCungCapList",nhaCungCapList);
       return "nhaCungCap";
    }
}
