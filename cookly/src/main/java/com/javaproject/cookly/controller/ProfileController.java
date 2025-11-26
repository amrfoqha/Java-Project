package com.javaproject.cookly.controller;



import com.javaproject.cookly.model.User;
import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.repository.UserRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
public class ProfileController {

    @Autowired
    private UserRepo userRepository;

    @GetMapping("/profile")
    public String profile(Model model) {
        // For demo, let's assume user with ID 1 is logged in
        Optional<User> optionalUser = userRepository.findById(1L);

        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            // Load favorited recipes and published recipes (if LAZY fetch)
            user.getFavoritedRecipes().size(); // triggers loading
            user.getPublishedRecipes().size(); // triggers loading
// triggers loading

            model.addAttribute("user", user);
        } else {
            // Handle user not found
            return "redirect:/login";
        }

        return "Profile.jsp"; // this refers to profile.jsp in src/main/webapp/WEB-INF/
    }
}
