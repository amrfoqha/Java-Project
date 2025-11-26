package com.javaproject.cookly.model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class LoginUser {
    
    @NotBlank(message = "Email must not be blank")
    @Email(message = "Email must be valid")
    private String loginEmail;
    @NotBlank(message = "Password must not be blank")
    @Size(min = 8, max = 30, message = "Password must be between 8 and 30 characters long") 
    private String loginPassword;

    public LoginUser() {
    }

    public LoginUser(String loginEmail, String loginPassword) {
        this.loginEmail = loginEmail;
        this.loginPassword = loginPassword;
    }

    public String getLoginEmail() {
        return loginEmail;
    }

    public void setLoginEmail(String loginEmail) {
        this.loginEmail = loginEmail;
    }

    public String getLoginPassword() {
        return loginPassword;
    }

    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword;
    }

}
