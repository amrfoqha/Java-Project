package com.javaproject.cookly.controller;


import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.model.User;
import com.javaproject.cookly.service.RecipeService;
import com.javaproject.cookly.service.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.javaproject.cookly.model.User;
import com.javaproject.cookly.service.userService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {
    @Autowired
    private userService userService;



    @GetMapping("/profile/{id}")
    public String profile(@PathVariable Long id, Model model,HttpSession httpSession) {
        if (httpSession.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
        User user = userService.findUserById(id);
        model.addAttribute("user", user);
        
        return "Profile.jsp"; 
    }



    

    // Add recipe to favorites
    


}
