package com.javaproject.cookly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.service.RecipeService;

@RestController
public class SearchController {
    @Autowired
    private RecipeService recipeService;
       
    @GetMapping("/search")
	public List<Recipe> search(@RequestParam("q") String recipeName, Model model) {

        if (recipeName == null || recipeName.trim().isEmpty()) {
        

            return recipeService.getRecipesByPage(0, 9).getContent();
        }
        System.out.println(recipeName);
		return recipeService.getRecipesByName(recipeName);
	}

}
