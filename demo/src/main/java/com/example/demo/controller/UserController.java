package com.example.demo.controller;

import org.springframework.web.bind.annotation.PathVariable;
import java.io.IOException;
import com.example.demo.validator.PhotoUploadUtil;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.example.demo.model.Background;
import java.util.List;
import com.example.demo.model.Menu;
import java.util.ArrayList;
import com.example.demo.model.Catalogue;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.demo.model.User;
import org.springframework.ui.Model;
import com.example.demo.repo.BackgroundRepo;
import com.example.demo.repo.CategoryRepo;
import com.example.demo.repo.MenuRepository;
import com.example.demo.validator.UserValidator;
import com.example.demo.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.demo.service.UserService;
import org.springframework.stereotype.Controller;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private UserValidator userValidator;
    @Autowired
    private MenuRepository menuRepo;
    @Autowired
    private CategoryRepo categoryRepo;
    @Autowired
    private BackgroundRepo backgroundRepo;
    public static String uploadDirectory = System.getProperty("user.dir") + "/user-photos";

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }
        userService.save(userForm);
        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());
        return "/admin";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @GetMapping({"/welcome"})
    public String welcome(Model model) {
        return "welcome";
    }

    @GetMapping({"/admin","/home"})
    public String admin(Model model) {
        return "admin";
    }

    @GetMapping({ "/"})
    public String home(Model model) {

        List<Catalogue> listCatalogues = categoryRepo.findAll();
        for (Catalogue catalogue:listCatalogues) {
            List<Menu> listMenu = new ArrayList<>();
            listMenu = menuRepo.listMenuByIdCategory(catalogue.getIdCatalogue());
            for (Menu menu:listMenu) {
                String[] mota = menu.getDescription().split("\\r?\\n");
                menu.setMota(mota);
            }
            catalogue.setMenuList(listMenu);
        }
         List<Background> backgroundList = backgroundRepo.findAll();
        if (backgroundList.size() != 0) {
            model.addAttribute("background", backgroundList.get(0));
        }
        model.addAttribute("listCatalogues", listCatalogues);
        return "home";
    }

    @PostMapping("/save/menu")
    public RedirectView saveMenu(@RequestParam(value = "photos",required = false) MultipartFile multipartFile, @RequestParam("title") String title,@RequestParam(value = "id",required = false) Integer id,
                                 @RequestParam("description") String description, @RequestParam("idCategory") int catelogueId,@RequestParam(value = "price",required = false) String price) throws IOException {

        Menu menu ;
        String fileName;
        if(id == null){
            menu = new Menu();
        }else{
            menu = menuRepo.getOne(id);
        }

        menu.setTitle(title);
        menu.setDescription(description);
        menu.setPrice(price);
        menu.setIdCategory(catelogueId);

        String originNameFile = multipartFile.getOriginalFilename();

        if( originNameFile != null && !originNameFile.equals("")){
            fileName = StringUtils.cleanPath(originNameFile);
            menu.setPhotos(fileName);
            String uploadDir = "user-photos/";
            PhotoUploadUtil.savePhoto(uploadDir, fileName, multipartFile);
        }
        menuRepo.save(menu);
        return new RedirectView("/menu/list", true);
    }

    @GetMapping("/save")
    public String callFormMenu(Model model) {
        Menu menu = new Menu();
        List<Catalogue> catalogueList = categoryRepo.findAll();
        for (Catalogue catalogue:catalogueList) {
            menu.setIdCategory(catalogue.getIdCatalogue());
        }
        menu.setCatalogueList(catalogueList);
        model.addAttribute("menu", menu);
        return "menuForm";
    }

    @GetMapping("/menu/list")
    public String listAllMenu(Model model) {
        List<Menu> listMenu = new ArrayList<>();
        listMenu = menuRepo.findAll();
        for (Menu menu:listMenu) {
            String[] mota = menu.getDescription().split("\\r?\\n");
            menu.setMota(mota);
            Catalogue catalogue = categoryRepo.getOne(menu.getIdCategory());
            if(catalogue !=null){
                menu.setCategory(catalogue.getTen());
            }
        }
        model.addAttribute("listMenu", listMenu);
        return "menuList";
    }

    @GetMapping(value = "menu/delete/{menuId}")
    public RedirectView deleteMenuById(@PathVariable("menuId") Integer menuId){
        if(menuRepo.findById(menuId) != null){
            menuRepo.deleteById(menuId);
        }
        return new RedirectView("/menu/list", true);
    }

    @GetMapping(value = "/menu/{id}/edit")
    public String edit(@PathVariable("id") int id, Model model){
        Menu menu = menuRepo.getOne(id);

        if(menu != null){
            List<Catalogue> catalogueList = categoryRepo.findAll();
            for (Catalogue catalogue:catalogueList) {
                menu.setIdCategory(catalogue.getIdCatalogue());
            }
            menu.setCatalogueList(catalogueList);
            model.addAttribute("menu", menu);
        }
        return "menuForm";
    }
}
