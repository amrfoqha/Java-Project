package com.javaproject.cookly.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.service.RecipeService;


@Controller
public class HomeController {
    @Autowired
    private RecipeService recipeService;

    @RequestMapping(value="/**")
    public String redirect() {
        return "redirect:/";
    }
    @GetMapping("/")
    public String home(@RequestParam(defaultValue = "0") int page,
                       Model model) {

        int pageSize = 9; // عدد الوصفات بكل صفحة

        Page<Recipe> recipePage = recipeService.getRecipesByPage(page, pageSize);

        model.addAttribute("recipes", recipePage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", recipePage.getTotalPages());

        return "homePage.jsp";
    }

      @GetMapping("/login")
      public String login() {
          return "this is the login page";
      }
      @GetMapping("/ingredientMatcher")
      public String ingredientMatcher() {
          return "IngredientMatcher.jsp";
      }
      @GetMapping("/marketList")
      public String marketList() {
          return "MarketList.jsp";
      }

    
}
