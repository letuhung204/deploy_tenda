package com.example.demo.controller;

import com.example.demo.model.Menu;
import com.example.demo.repo.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.example.demo.model.Catalogue;
import com.example.demo.repo.CategoryRepo;

import java.util.List;

@Controller
public class CatalogueController {

    @Autowired
    private CategoryRepo categoryRepo;

    @Autowired
    private MenuRepository menuRepository;

    @GetMapping("/catalogue")
    public String getlist(Model model){
        model.addAttribute("listCategory",categoryRepo.findAll());
        return "catalogueList";
    }
    @GetMapping("/catalogue/form")
    public String getForm(Model model,@RequestParam(value = "idCatalogue",required = false)Integer id){
        Catalogue catalogue;
        if(id !=null && categoryRepo.getOne(id) != null){
            catalogue = categoryRepo.getOne(id);
        }else{
            catalogue = new Catalogue();
        }
        model.addAttribute("catalogue",catalogue);
        return "catalogueForm";
    }
    @GetMapping("/delete")
    public RedirectView delete(@RequestParam("idCatalogue")Integer id, RedirectAttributes redirectAttributes){
        Catalogue catalogue = categoryRepo.getOne(id);
        List<Menu> menuList = menuRepository.listMenuByIdCategory(id);
        if(menuList.size()<1){
            if(catalogue !=null){
                categoryRepo.deleteById(id);
            }
        }else {
            redirectAttributes.addFlashAttribute("Notification","Bạn phải xóa các Menu Item thuộc Category "+ catalogue.getTen()+" trước hoặc chọn button Vẫn thực hiên xóa.");
            redirectAttributes.addFlashAttribute("id_category",id);
        }

        return new RedirectView("/catalogue", true);
    }
    @GetMapping("/delete/continue")
    public RedirectView deleteAllMenuOfCategory(@RequestParam("idCatalogue")Integer id){
        categoryRepo.deleteById(id);
        menuRepository.deleteCatagoryMenuByIdCategory(id);
        return new RedirectView("/catalogue", true);
    }
    @PostMapping("/save/catalogue")
    public RedirectView save(@RequestParam(value = "idCatalogue",required = false) Integer id,@RequestParam("ten")String ten,@RequestParam("chitiet")String chiTiet){
        Catalogue catalogue;
        if(id !=null){
            catalogue = categoryRepo.getOne(id);
        }else{
            catalogue = new Catalogue();
        }
        catalogue.setTen(ten);
        catalogue.setChitiet(chiTiet);
        categoryRepo.save(catalogue);

        return new RedirectView("/catalogue", true);
    }
    @GetMapping("/catagory/{idCatalogue}/edit")
    public String update(@PathVariable("idCatalogue") int id,Model model){
        model.addAttribute("catalogue",categoryRepo.getOne(id));
        return "catalogueForm";
    }

}
