package com.javaproject.cookly.controller;


import com.javaproject.cookly.model.User;
import com.javaproject.cookly.service.userService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Controller
public class ProfileController {
@Autowired
private userService userService;


    @GetMapping("/profile/{id}")
    public String profile(@PathVariable Long id, Model model, HttpSession session) {
        if(session.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
        User user = userService.findUserById(id);

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("user", user);
        
        return "Profile.jsp";
    }



}
