package com.javaproject.cookly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaproject.cookly.model.LoginUser;
import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.model.User;
import com.javaproject.cookly.service.RecipeService;

import jakarta.validation.Valid;


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

        int pageSize = 9; 

        Page<Recipe> recipePage = recipeService.getRecipesByPage(page, pageSize);

        model.addAttribute("recipes", recipePage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", recipePage.getTotalPages());

        return "homePage.jsp";
    }

    @GetMapping("/login")
    public String showAuthPage(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("loginUser", new LoginUser());
        return "Login.jsp";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser,
                           BindingResult result,
                           Model model) {

        if (result.hasErrors()) {
            model.addAttribute("loginUser", new LoginUser());
            return "login.jsp";
        }

        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("loginUser") LoginUser loginUser,
                        BindingResult result,
                        Model model) {

        if (result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "login.jsp";
        }

        return "redirect:/";
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
