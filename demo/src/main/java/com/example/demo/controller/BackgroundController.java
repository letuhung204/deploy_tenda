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
    public RedirectView save(@RequestParam("id")  Integer id, @RequestParam("tieudeWelcome")  String tieudeWelcome, @RequestParam("sologanHabour")  String sologanHabour
            , @RequestParam(value = "logo",required = false)  MultipartFile logo, @RequestParam(value = "mainPhoto",required = false)  MultipartFile mainPhoto
            , @RequestParam(value = "footerPhoto",required = false)  MultipartFile footerPhoto, @RequestParam("tieuDeCauCamOn")  String tieuDeCauCamOn
            , @RequestParam("noiDungCauCamOn")  String noiDungCauCamOn) throws IOException {
         String photoMain = StringUtils.cleanPath(mainPhoto.getOriginalFilename());
         String photoFooter = StringUtils.cleanPath(footerPhoto.getOriginalFilename());
         Background background =  backgroundRepo.getOne(id);
        background.setNoiDungCauCamOn(noiDungCauCamOn);
        background.setSologanHabour(sologanHabour);
        background.setTieuDeCauCamOn(tieuDeCauCamOn);
        background.setTieudeWelcome(tieudeWelcome);

        String uploadDir = "user-photos/";
        String originNameFile = logo.getOriginalFilename();
        if( originNameFile != null && !originNameFile.equals("")){
            String logoName = StringUtils.cleanPath(originNameFile);
            background.setLogo(logoName);
            PhotoUploadUtil.savePhoto(uploadDir, logoName, logo);
        }

        String originNameMainPhoto = mainPhoto.getOriginalFilename();
        if( originNameMainPhoto != null && !originNameMainPhoto.equals("")){
            String mainPhotoName = StringUtils.cleanPath(originNameMainPhoto);
            background.setMainPhoto(mainPhotoName);
            PhotoUploadUtil.savePhoto(uploadDir, mainPhotoName, mainPhoto);
        }
        String originNameFooter = footerPhoto.getOriginalFilename();
        if( originNameFooter != null && !originNameFooter.equals("")){
            String footerName = StringUtils.cleanPath(originNameFooter);
            background.setFooterPhoto(footerName);
            PhotoUploadUtil.savePhoto(uploadDir, footerName, footerPhoto);
        }

        backgroundRepo.save(background);
        return new RedirectView("/background", true);
    }

    @GetMapping({"/background/{id}/edit"})
    public String update(@PathVariable("id") int id, Model model) {
        model.addAttribute("background", backgroundRepo.getOne(id));
        return "backgroundForm";
    }
}