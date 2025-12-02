package com.javaproject.cookly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaproject.cookly.model.LoginUser;
import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.model.User;
import com.javaproject.cookly.service.RecipeService;
import com.javaproject.cookly.service.userService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {
    @Autowired
    private RecipeService recipeService;
    @Autowired
    private userService userService;

    // @RequestMapping(value="/**")
    // public String redirect() {
    //     return "redirect:/";
    // }
    @GetMapping("/")
    public String home(@RequestParam(defaultValue = "0") int page,
                       Model model) {

        int pageSize = 9;
                        
        Page<Recipe> recipePage = recipeService.getRecipesByPage(page, pageSize);

        if (recipePage.isEmpty()) {
            return "redirect:/";
        }
        model.addAttribute("recipes", recipePage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", recipePage.getTotalPages());
        

        return "homePage.jsp";
    }

    @GetMapping("/login")
    public String showAuthPage(@ModelAttribute("newUser") User newUser,
                               @ModelAttribute("loginUser") LoginUser loginUser,BindingResult result,
                               Model model) {
        return "Login.jsp";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser,BindingResult result,
                               @ModelAttribute("loginUser") LoginUser loginUser,Model model, HttpSession httpSession) {

               User user = userService.createUser(newUser, result);
               if (result.hasErrors()) {
              return "Login.jsp";
          } else {
              httpSession.setAttribute("loggedInUser", user);
          }

        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("loginUser") LoginUser loginUser,
                        BindingResult result,@ModelAttribute("newUser") User newUser,Model model, HttpSession httpSession) {


        User user = userService.loginUser(loginUser, result);
                 if (result.hasErrors()) {
                     return "Login.jsp";
                 }
                 else {
                    httpSession.setAttribute("loggedInUser", user);
                    return "redirect:/";
                 }
    }
      @GetMapping("/ingredientMatcher")
      public String ingredientMatcher(HttpSession httpSession) {
        if (httpSession.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
          return "IngredientMatcher.jsp";
      }
      @GetMapping("/marketList")
      public String marketList(HttpSession httpSession, Model model) {
          if (httpSession.getAttribute("loggedInUser") == null) {
              return "redirect:/login";
          }
          model.addAttribute("marketList", httpSession.getAttribute("temporaryRecipe"));
          return "MarketList.jsp";
      }


      @GetMapping("/logout")
      public String logout(HttpSession httpSession) {
          httpSession.invalidate();
          return "redirect:/";
      }


    @GetMapping("/about")
    public String about() {
        // No login check, anyone can access
        return "aboutus.jsp"; // logical view name, no .jsp
    }









}
