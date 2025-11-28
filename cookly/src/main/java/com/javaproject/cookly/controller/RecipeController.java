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
        // Get the logged-in user from session (do this early)
        User loggedUser = (User) session.getAttribute("loggedInUser");

        // If no user is logged in, redirect to login
        if (loggedUser == null) {
            System.out.println("ERROR: No logged-in user in session. Redirecting to login.");
            return "redirect:/login";
        }

        // If there are validation errors (e.g., missing cuisine), pass them to the view and return to the form
        if (result.hasErrors()) {
            System.out.println("Validation errors: " + result.getAllErrors());
            model.addAttribute("errors", result.getAllErrors());  // Pass errors to the JSP view for display
            model.addAttribute("loggedUser", loggedUser);
            return "AddRecipe.jsp";  // Return to the form page with errors shown
        }

        // If validation passes, try to save the recipe
        try {
            System.out.println("Logged in user ID: " + loggedUser.getId());
            recipeService.createRecipe(recipe, loggedUser);
            System.out.println("Recipe saved successfully. Redirecting to profile.");
            return "redirect:/profile/" + loggedUser.getId();  // Redirect to profile on success
        } catch (Exception e) {
            // If saving fails (e.g., database error), log it and return to the form with an error message
            System.out.println("Error saving recipe: " + e.getMessage());
            e.printStackTrace();  // Full stack trace for debugging
            model.addAttribute("error", "An error occurred while saving the recipe. Please try again.");
            model.addAttribute("loggedUser", loggedUser);
            return "AddRecipe.jsp";  // Return to form with a generic error message
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
