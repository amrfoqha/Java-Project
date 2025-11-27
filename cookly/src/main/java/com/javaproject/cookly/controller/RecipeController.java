package com.javaproject.cookly.controller;

import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.model.User;
import com.javaproject.cookly.service.userService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.service.RecipeService;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class RecipeController {
    @Autowired
    private RecipeService recipeService;
    @Autowired
    userService userService;
    
    @GetMapping("/addRecipe")
    public String showAddRecipeForm(Model model,HttpSession httpSession) {
        if (httpSession.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
        // Create empty recipe object for form binding
        model.addAttribute("user", new User());
        model.addAttribute("recipe", new Recipe());

        return "AddRecipe.jsp";
    }
    @PostMapping("/saveRecipe/{id}")
    public String saveRecipe(@PathVariable("id")User user, @Valid @ModelAttribute("recipe") Recipe recipe, BindingResult result, Model model, HttpSession httpSession) {
        System.out.println(recipe);
        User user1 = userService.findUserById(user.getId());
        model.addAttribute("user1", user1);
        if (result.hasErrors()) {
            return "AddRecipe.jsp";
        }
        recipeService.createRecipe(recipe ,user1 );

        return "redirect:/addRecipe";

    }

    @GetMapping("/recipeDetails/{id}")
    public String showRecipeDetails(@PathVariable Long id, Model model,HttpSession httpSession) {
        if (httpSession.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
        Recipe recipe = recipeService.getRecipeById(id);
        model.addAttribute("recipe", recipe);
        return "RecipeDetails.jsp";
    }


}
