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
    public String showAddRecipeForm(Model model,HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
        // Create empty recipe object for form binding
        model.addAttribute("recipe", new Recipe());

        return "AddRecipe.jsp";
    }
    @PostMapping("/saveRecipe")
    public String saveRecipe(@Valid @ModelAttribute("recipe") Recipe recipe,
                             BindingResult result, Model model, HttpSession session) {
        User loggedUser = (User) session.getAttribute("loggedInUser");

        if (loggedUser == null) {
            System.out.println("ERROR: No logged-in user in session. Redirecting to login.");
            return "redirect:/login";
        }

        if (result.hasErrors()) {
            System.out.println("Validation errors: " + result.getAllErrors());
            model.addAttribute("loggedUser", loggedUser);
            return "AddRecipe.jsp";
        }

        try {
            System.out.println("Saving recipe for user ID: " + loggedUser.getId());
            recipeService.createRecipe(recipe, loggedUser);
            System.out.println("Recipe saved successfully. Redirecting to profile.");
            return "redirect:/profile/" + loggedUser.getId();
        } catch (Exception e) {
            System.out.println("Error saving recipe: " + e.getMessage());
            e.printStackTrace();  // For full stack trace
            model.addAttribute("error", "An error occurred while saving the recipe.");
            model.addAttribute("loggedUser", loggedUser);
            return "AddRecipe.jsp";
        }
    }
//    @PostMapping("/saveRecipe")
//    public String saveRecipe(@Valid @ModelAttribute("recipe") Recipe recipe, BindingResult result, Model model, HttpSession session) {
//        if (result.hasErrors()) {
//            User loggedUser = (User) session.getAttribute("loggedInUser");
//            model.addAttribute("loggedUser", loggedUser);
//            return "AddRecipe.jsp";
//        }
//
//        User loggedUser = (User) session.getAttribute("loggedInUser");
//        if (loggedUser == null) {
//            model.addAttribute("loggedUser", loggedUser);
//            System.out.println("ERROR: loggedUser is null! Session issue.");
//            return "redirect:/login";
//
//        }
//        System.out.println("Logged in user ID: " + loggedUser.getId());
//        recipeService.createRecipe(recipe ,loggedUser);
//        return "redirect:/profile/" + loggedUser.getId();
//    }

    @GetMapping("/recipeDetails/{id}")
    public String showRecipeDetails(@PathVariable Long id, Model model,HttpSession httpSession) {
        if (httpSession.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
        boolean isFavorited = recipeService.checkFavorite(id, ((User) httpSession.getAttribute("loggedInUser")).getId());
        Recipe recipe = recipeService.getRecipeById(id);
        model.addAttribute("recipe", recipe);
        model.addAttribute("isFavorited", isFavorited);
        return "RecipeDetails.jsp";
    }
}
