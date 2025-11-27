package com.javaproject.cookly.controller;


import com.javaproject.cookly.model.LoginUser;
import com.javaproject.cookly.model.User;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
      @GetMapping("/login")
      public String login() {
          return "this is the login page";
      }
      @GetMapping("/ingredientMatcher")
      public String ingredientMatcher() {
          return "IngredientMatcher.jsp";
      }

    
}
