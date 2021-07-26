package com.example.demo.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.demo.model.User;
import org.springframework.ui.Model;
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

    @GetMapping({"/admin", "/home"})
    public String admin(Model model) {
        return "admin";
    }

    @GetMapping({"/"})
    public String home() {

        return "home";
    }
}
