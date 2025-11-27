package com.javaproject.cookly.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfileController {



    @GetMapping("/profile")
    public String profile() {
        // Just return the JSP page directly
        return "Profile.jsp"; // JSP path: src/main/webapp/WEB-INF/Profile.jsp
    }

}
