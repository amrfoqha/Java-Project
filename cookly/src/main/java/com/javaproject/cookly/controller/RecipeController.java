package com.javaproject.cookly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.service.RecipeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class RecipeController {
    @Autowired
    private RecipeService recipeService;
    
    @GetMapping("/addRecipe")
    public String showAddRecipeForm(Model model,HttpSession httpSession) {
        if (httpSession.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
        // Create empty recipe object for form binding
        model.addAttribute("recipe", new Recipe());

        return "AddRecipe.jsp";
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
