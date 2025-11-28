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
    public String showAddRecipeForm(Model model,HttpSession httpSession) {
        if (httpSession.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
        // Create empty recipe object for form binding
        model.addAttribute("user", new User());
        model.addAttribute("recipe", new Recipe());

        return "AddRecipe.jsp";
    }
//    @PostMapping("/saveRecipe/{id}")
//    public String saveRecipe(@PathVariable("id")User user, @Valid @ModelAttribute("recipe") Recipe recipe, BindingResult result, Model model, HttpSession httpSession) {
//        System.out.println(recipe);
//        User user1 = userService.findUserById(user.getId());
//        model.addAttribute("user1", user1);
//        if (result.hasErrors()) {
//            return "AddRecipe.jsp";
//        }
//        recipeService.createRecipe(recipe ,user1 );
//
//        return "redirect:/addRecipe";
//
//    }

    @PostMapping("/saveRecipe/{id}")
    public String saveRecipe(@PathVariable("id") User user,
                             @Valid @ModelAttribute("recipe") Recipe recipe,
                             BindingResult result,
                             Model model,
                             HttpSession httpSession) {

        System.out.println(recipe);

        User user1 = userService.findUserById(user.getId());
        model.addAttribute("user1", user1);

        if (result.hasErrors()) {
            return "AddRecipe.jsp";
        }

        // Save the recipe and associate with user
        Recipe savedRecipe = recipeService.createRecipe(recipe, user1);

        // Add recipe to user's publishedRecipes list if not already
        if (user1.getPublishedRecipes() != null) {
            user1.getPublishedRecipes().add(savedRecipe);
        } else {
            List<Recipe> publishedRecipes = new ArrayList<>();
            publishedRecipes.add(savedRecipe);
            user1.setPublishedRecipes(publishedRecipes);
        }

        // Save updated user (if cascade is not set)
        userService.save(user1);

        return "redirect:/profile/" + user1.getId();
    }




    @GetMapping("/recipeDetails/{id}")
    public String showRecipeDetails(@PathVariable Long id, Model model, HttpSession httpSession) {
        if (httpSession.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
        boolean isFavorited = recipeService.checkFavorite(id,
                ((User) httpSession.getAttribute("loggedInUser")).getId());
        Recipe recipe = recipeService.getRecipeById(id);
        model.addAttribute("recipe", recipe);
        model.addAttribute("isFavorited", isFavorited);
        model.addAttribute("comments", commentService.findByRecipeId(id));
        model.addAttribute("avarageRating", commentService.getAverageRating(id));
        model.addAttribute("totalComments", commentService.findByRecipeId(id).size());
        return "RecipeDetails.jsp";
    }
    
    @PostMapping("/recipe/{recipeId}/review")
    public String addReview(@PathVariable Long recipeId, Model model, HttpSession httpSession,
                @RequestParam String reviewText,
                @RequestParam int rating
    ) {

        User user = (User) httpSession.getAttribute("loggedInUser");
        Comment comment = new Comment(reviewText, rating, user, recipeService.getRecipeById(recipeId));
        commentService.createComment(comment);
        return "redirect:/recipeDetails/" + recipeId;
    }
    
    @GetMapping("/addIngredient")
    public String addIngredient(@RequestParam String ingredient, Model model, HttpSession session) {
        if (session.getAttribute("temporaryRecipe") == null) {
            session.setAttribute("temporaryRecipe", new ArrayList<String>());
        }
        ArrayList<String> temporaryRecipe = (ArrayList<String>) session.getAttribute("temporaryRecipe");
        temporaryRecipe.add(ingredient);
        session.setAttribute("temporaryRecipe", temporaryRecipe);
        model.addAttribute("ingredient", ingredient);
        return "redirect:/marketList";
    }


}
