package com.javaproject.cookly.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.model.User;
import com.javaproject.cookly.repository.RecipeRepo;
import com.javaproject.cookly.repository.UserRepo;

@Service
public class RecipeService {

    @Autowired
    private RecipeRepo recipeRepo;
    @Autowired
    private UserRepo userRepo;

    public Recipe createRecipe(Recipe recipe, User user) {
        recipe.setPubUser(user);
        return recipeRepo.save(recipe);
    }

    public List<Recipe> getUserRecipes(User user) {
        return recipeRepo.findByPubUser(user);
    }
   

    
    public Recipe getRecipeById(Long id) {
        return recipeRepo.findById(id).orElse(null);
    }


    public void deleteRecipe(Long id, User user) {
        Recipe recipe = recipeRepo.findById(id).orElse(null);
        if (recipe != null && recipe.getPubUser().getId() == user.getId()) {
            recipeRepo.delete(recipe);
        }
    }
    
}
