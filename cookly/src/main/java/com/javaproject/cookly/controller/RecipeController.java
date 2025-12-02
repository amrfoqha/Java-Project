package com.javaproject.cookly.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaproject.cookly.model.Comment;
import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.model.User;
import com.javaproject.cookly.service.CommentService;
import com.javaproject.cookly.service.RecipeService;
import com.javaproject.cookly.service.userService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class RecipeController {
    @Autowired
    private RecipeService recipeService;
    @Autowired
    userService userService;
    @Autowired
    CommentService commentService;
    
    @GetMapping("/addRecipe")
    public String showAddRecipeForm(Model model,HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
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
            model.addAttribute("errors", result.getAllErrors());
            model.addAttribute("loggedUser", loggedUser);
            return "AddRecipe.jsp";
        }

        try {
            System.out.println("Logged in user ID: " + loggedUser.getId());
            recipeService.createRecipe(recipe, loggedUser);
            System.out.println("Recipe saved successfully. Redirecting to profile.");
            return "redirect:/profile/" + loggedUser.getId();
        } catch (Exception e) {
            System.out.println("Error saving recipe: " + e.getMessage());
            e.printStackTrace();
            model.addAttribute("error", "An error occurred while saving the recipe. Please try again.");
            model.addAttribute("loggedUser", loggedUser);
            return "AddRecipe.jsp";
        }
    }


    @GetMapping("/recipeDetails/{id}")
    public String showRecipeDetails(@PathVariable Long id, Model model,HttpSession httpSession) {
        if (httpSession.getAttribute("loggedInUser") != null) {
            boolean isFavorited = recipeService.checkFavorite(id,
                    ((User) httpSession.getAttribute("loggedInUser")).getId());
        model.addAttribute("isFavorited", isFavorited);
        }
        Recipe recipe = recipeService.getRecipeById(id);
        if (recipe == null) {
            return "redirect:/";
        }
        model.addAttribute("recipe", recipe);
        model.addAttribute("comments", recipe.getComments());
        model.addAttribute("totalComments", recipe.getComments().size());
        model.addAttribute("avarageRating", recipe.getAverageRating());
        return "RecipeDetails.jsp";
    }
    
    @PostMapping("/recipe/{recipeId}/review")
    public String addReview(@PathVariable Long recipeId, Model model, HttpSession httpSession,
                @RequestParam String reviewText,
                @RequestParam int rating
    ) {
        
        Recipe recipe = recipeService.getRecipeById(recipeId);
        if (recipe == null) {
            return "redirect:/";
        }
        User user = (User) httpSession.getAttribute("loggedInUser");
        Comment comment = new Comment(reviewText, rating, user, recipeService.getRecipeById(recipeId));
        commentService.createComment(comment);
        return "redirect:/recipeDetails/" + recipeId;
    }
    
    @GetMapping("/addIngredient")
    public String addIngredient(@RequestParam String ingredient, Model model, HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
        if (session.getAttribute("temporaryRecipe") == null) {
            session.setAttribute("temporaryRecipe", new ArrayList<String>());
        }
        ArrayList<String> temporaryRecipe = (ArrayList<String>) session.getAttribute("temporaryRecipe");
        temporaryRecipe.add(ingredient);
        session.setAttribute("temporaryRecipe", temporaryRecipe);
        model.addAttribute("ingredient", ingredient);
        return "redirect:/marketList";
    }
    
    
    @PostMapping("/filter")
    public String filterRecipes(
            @RequestParam(value = "category", required = false) List<String> categories,
            @RequestParam(value = "calories", required = false) Integer calories,
            Model model
    ) {

        if (categories == null) categories = new ArrayList<>();
        if (calories == null) calories = 0;

        List<Recipe> results = recipeService.filterRecipes(categories, calories);

        model.addAttribute("recipes", results);
        model.addAttribute("selectedCategories", categories);
        model.addAttribute("selectedCalories", calories);

        return "homePage.jsp";
    }




}
