package com.javaproject.cookly.controller;

import com.javaproject.cookly.model.Recipe;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RecipeController {
    @GetMapping("/addRecipe")
    public String showAddRecipeForm(Model model) {
        // Create empty recipe object for form binding
        Recipe recipe = new Recipe();
        model.addAttribute("recipe", recipe);

        return "AddRecipe.jsp";
}}
