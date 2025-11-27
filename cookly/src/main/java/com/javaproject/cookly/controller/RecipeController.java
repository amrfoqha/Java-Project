package com.javaproject.cookly.controller;

import com.javaproject.cookly.model.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.javaproject.cookly.service.RecipeService;

@Controller
public class RecipeController {
    @Autowired
    private RecipeService recipeService;
    
    @GetMapping("/addRecipe")
    public String showAddRecipeForm(Model model) {
        // Create empty recipe object for form binding
        model.addAttribute("recipe", new Recipe());

        return "AddRecipe.jsp";
    }
    @GetMapping("/recipeDetails/{id}")
    public String showRecipeDetails(@PathVariable Long id, Model model) {
        Recipe recipe = recipeService.getRecipeById(id);
        model.addAttribute("recipe", recipe);
        return "RecipeDetails.jsp";
    }


}
