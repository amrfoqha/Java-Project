package com.javaproject.cookly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
    

    @RequestMapping(value="/**")
    public String redirect() {
        return "redirect:/";
    }
      @GetMapping("/")
      public String index() {
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

    
}
