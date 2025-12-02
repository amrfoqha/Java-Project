package com.javaproject.cookly.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.lang.Nullable;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorViewResolver;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Component
public class ErrorController implements ErrorViewResolver {

    @Override
    public @Nullable ModelAndView resolveErrorView(
            HttpServletRequest request,
            HttpStatus status,
            Map<String, Object> model
    ) {

        if (status == HttpStatus.NOT_FOUND) {
            return new ModelAndView("/PageNotFound.jsp");
        }

        if (status == HttpStatus.METHOD_NOT_ALLOWED) {  
            return new ModelAndView("/PageNotFound.jsp");
        }

        return null; 
    }
}
