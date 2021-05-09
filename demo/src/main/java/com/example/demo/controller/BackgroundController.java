package com.example.demo.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.IOException;

import com.example.demo.validator.PhotoUploadUtil;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.multipart.MultipartFile;
import com.example.demo.model.Background;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.demo.repo.BackgroundRepo;
import org.springframework.stereotype.Controller;

@Controller
public class BackgroundController {
    @Autowired
    private BackgroundRepo backgroundRepo;

    @GetMapping({"/background"})
    public String getList( Model model) {
        model.addAttribute("background",backgroundRepo.findAll());
        return "background";
    }

    @GetMapping({"/background/form"})
    public String getForm( Model model, @RequestParam(value = "idBackground", required = false)  Integer id) {
        Background background;
        if (id != null && backgroundRepo.getOne( id) != null) {
            background = (Background) backgroundRepo.getOne(id);
        } else {
            background = new Background();
        }
        model.addAttribute("background", (Object) background);
        return "backgroundForm";
    }

    @PostMapping({"/save/background"})
    public RedirectView save(@RequestParam("id")  Integer id, @RequestParam("tieudeWelcome")  String tieudeWelcome, @RequestParam("sologanHabour")  String sologanHabour, @RequestParam("logo")  MultipartFile logo, @RequestParam("mainPhoto")  MultipartFile mainPhoto, @RequestParam("footerPhoto")  MultipartFile footerPhoto, @RequestParam("tieuDeCauCamOn")  String tieuDeCauCamOn, @RequestParam("noiDungCauCamOn")  String noiDungCauCamOn) throws IOException {
         String logoName = StringUtils.cleanPath(logo.getOriginalFilename());
         String photoMain = StringUtils.cleanPath(mainPhoto.getOriginalFilename());
         String photoFooter = StringUtils.cleanPath(footerPhoto.getOriginalFilename());
         Background background =  backgroundRepo.getOne(id);
        background.setFooterPhoto(photoFooter);
        background.setLogo(logoName);
        background.setMainPhoto(photoMain);
        background.setNoiDungCauCamOn(noiDungCauCamOn);
        background.setSologanHabour(sologanHabour);
        background.setTieuDeCauCamOn(tieuDeCauCamOn);
        background.setTieudeWelcome(tieudeWelcome);

        backgroundRepo.save(background);
         String uploadDir = "user-photos/";
        PhotoUploadUtil.savePhoto(uploadDir, logoName, logo);
        PhotoUploadUtil.savePhoto(uploadDir, photoMain, mainPhoto);
        PhotoUploadUtil.savePhoto(uploadDir, photoFooter, footerPhoto);
        return new RedirectView("/background", true);
    }

    @GetMapping({"/background/{id}/edit"})
    public String update(@PathVariable("id") int id, Model model) {
        model.addAttribute("background", backgroundRepo.getOne(id));
        return "backgroundForm";
    }
}