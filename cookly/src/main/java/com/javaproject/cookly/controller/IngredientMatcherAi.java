package com.javaproject.cookly.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.service.RecipeService;

@RestController
@RequestMapping("/api/recipes")
public class IngredientMatcherAi {

    @Autowired
    private RecipeService recipeService;

    @PostMapping("/match")
    public ResponseEntity<List<Recipe>> getMatchingRecipes(@RequestBody IngredientRequest request) {
        List<Recipe> matches = recipeService.findRecipesByUserIngredients(request.getIngredients());
        if(matches.isEmpty()){
            try {
                Recipe aiRecipe = recipeService.generateRecipeWithAI(request.getIngredients());
                return ResponseEntity.ok(List.of(aiRecipe));
            } catch (Exception e) {
                e.printStackTrace();
                return ResponseEntity.internalServerError().build();
            }
        }

        return ResponseEntity.ok(matches);
    }
}

class IngredientRequest {
    private List<String> ingredients;
    public List<String> getIngredients() { return ingredients; }
    public void setIngredients(List<String> ingredients) { this.ingredients = ingredients; }
}
