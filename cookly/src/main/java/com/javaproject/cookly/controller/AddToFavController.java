package com.javaproject.cookly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.model.User;
import com.javaproject.cookly.service.RecipeService;
import com.javaproject.cookly.service.userService;

import jakarta.servlet.http.HttpSession;



@RestController
public class AddToFavController {
    @Autowired
    private userService userService;
    @Autowired
    private RecipeService recipeService;


 @PostMapping("/favorite/{recipeId}")
public ResponseEntity<String> addFavorite(@PathVariable Long recipeId, HttpSession session) {
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body("User is not logged in.");
    }
    User user = userService.findUserById(loggedInUser.getId());
    Recipe recipe = recipeService.getRecipeById(recipeId);
    if (user == null || recipe == null) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body("User or recipe not found.");
    }
    boolean flag= recipeService.checkFavorite(recipeId, loggedInUser.getId());
    if (!flag) {
        recipe.getFavoritedBy().add(user);
        recipeService.save(recipe);
    }
    else {
        recipe.getFavoritedBy().remove(user);
        recipeService.save(recipe);
    }
    
    return ResponseEntity.ok("Recipe updated to favorites!");
}

}
