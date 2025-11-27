package com.javaproject.cookly.controller;

import com.javaproject.cookly.model.LoginUser;
import com.javaproject.cookly.model.User;
import com.javaproject.cookly.service.userService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @Autowired
    private userService userService;


    @RequestMapping(value="/**")
    public String redirect() {
        return "redirect:/";
    }
      @GetMapping("/")
      public String index() {
          return "homePage.jsp";
      }

    @GetMapping("/user/login")
    public String index(@ModelAttribute("newUser") User user , @ModelAttribute("loginUser") LoginUser log , Model model) {
        model.addAttribute("newUser",user);
        model.addAttribute("loginUser",log);
        return "Login.jsp";
    }
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User user, @ModelAttribute("loginUser")LoginUser log , BindingResult result, HttpSession session, Model model) {
        User newUser = userService.createUser(user, result);
        if (result.hasErrors()) {
            return "Login.jsp";
        }

        session.setAttribute("users", newUser.getId());
        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("loginUser") LoginUser log, @ModelAttribute("newUser") User user, BindingResult result, HttpSession session, Model model) {
        User login = userService.loginUser(log, result);
        if (result.hasErrors()) {
            model.addAttribute("newUser",user);
            model.addAttribute("loginUser",log);
            return "Login.jsp";
        }
        session.setAttribute("user", login.getId());
        return "redirect:/";
    }

    
}
