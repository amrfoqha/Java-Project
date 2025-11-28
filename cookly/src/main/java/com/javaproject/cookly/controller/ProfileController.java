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

@Controller
public class ProfileController {
@Autowired
private userService userService;


    @GetMapping("/profile")
    public String profile(Model model) {
        Long loggedInUserId = 1L;
        User user = userService.findUserById(loggedInUserId);

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("user", user);

        // Just return the JSP page directly
        return "Profile.jsp"; // JSP path: src/main/webapp/WEB-INF/Profile.jsp
    }




}
