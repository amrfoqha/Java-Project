package com.javaproject.cookly.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
     boolean flag = recipeService.checkFavorite(recipeId, loggedInUser.getId());
     if (!flag) {
         recipe.getFavoritedBy().add(user);
         recipeService.save(recipe);
     } else {
         recipe.getFavoritedBy().remove(user);
         recipeService.save(recipe);
     }

     return ResponseEntity.ok("Recipe updated to favorites!");
 }


@GetMapping("/addToMarket/{recipeId}")
public ResponseEntity<String> addToMarket(@PathVariable Long recipeId, HttpSession session) {

    if (session.getAttribute("temporaryRecipe") == null) {
        session.setAttribute("temporaryRecipe", new ArrayList<String>());
    }

    Recipe recipe = recipeService.getRecipeById(recipeId);

    if (recipe != null) {
        @SuppressWarnings("unchecked")
        ArrayList<String> temporaryRecipe = (ArrayList<String>) session.getAttribute("temporaryRecipe");

        String ingredientsStr = recipe.getIngredients();
        ingredientsStr = ingredientsStr.replace("[", "").replace("]", "");
        
        String[] ingredients = ingredientsStr.split(",");
        for (String ingredient : ingredients) {
            String cleanIngredient = ingredient.replace("\"", "").trim();
            if (!cleanIngredient.isEmpty() && !temporaryRecipe.contains(cleanIngredient)) {
                temporaryRecipe.add(cleanIngredient);
            }
        }
        
        session.setAttribute("temporaryRecipe", temporaryRecipe);
        
        System.out.println("Updated Market Session List: " + session.getAttribute("temporaryRecipe"));

        return ResponseEntity.ok("Recipe ingredients added to market list");
    }

    return ResponseEntity.status(404).body("Recipe not found");
}

@DeleteMapping("/deleteIngredient")
public ResponseEntity<String> deleteIngredient(@RequestParam String ingredient, HttpSession session) {
    @SuppressWarnings("unchecked")
    ArrayList<String> temporaryRecipe = (ArrayList<String>) session.getAttribute("temporaryRecipe");
    if (temporaryRecipe != null) {
        temporaryRecipe.remove(ingredient);
        session.setAttribute("temporaryRecipe", temporaryRecipe);
        System.out.println("Updated Market Session List: " + session.getAttribute("temporaryRecipe"));
        return ResponseEntity.ok("Ingredient deleted from market list.");
    }
    return ResponseEntity.status(404).body("Market list not found.");
}




}
