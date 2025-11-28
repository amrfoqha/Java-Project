package com.javaproject.cookly.service;

import java.util.Optional;

import jakarta.transaction.Transactional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.javaproject.cookly.model.LoginUser;
import com.javaproject.cookly.model.User;
import com.javaproject.cookly.repository.UserRepo;

@Service
public class userService {

    @Autowired
    private UserRepo userRepo;



    public void save(User user){
        userRepo.save(user);
    }
    public User createUser(User user,BindingResult result) {
        Optional<User> potentialUser = userRepo.findByEmail(user.getEmail());
        if (potentialUser.isPresent()) {
            result.rejectValue("email", "Unique", "this email already exist.");
        }
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            result.rejectValue("confirmPassword", "Matches", "passwords doesn't matches.");
            
        }
        if(result.hasErrors()){
            return null;
        }
     
        String hashPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashPassword);


    return userRepo.save(user);
}
    public User loginUser(LoginUser user,BindingResult result) {
        Optional<User> potentialUser = userRepo.findByEmail(user.getLoginEmail());
        if (!potentialUser.isPresent()) {
            result.rejectValue("loginEmail", "NotFound", "this email doesn't exist.");
            return null;
        }
        User goldUser = potentialUser.get();
        if (!BCrypt.checkpw(user.getLoginPassword(), goldUser.getPassword())) {
            result.rejectValue("loginPassword", "Matches", "passwords or email wrong.");
            return null;
        }
        if (result.hasErrors()) {
            return null;
        }
        
    return goldUser;
}
    @Transactional
    public User findUserByIdWithFavorites(Long id) {
        User user = userRepo.findById(id).orElse(null);
        if (user != null) {
            user.getFavoritedRecipes().size(); // force initialization
        }
        return user;
    }

public User findUserById(Long id) {
    return userRepo.findById(id).orElse(null);
}
public User findUserByEmail(String email) {
    return userRepo.findByEmail(email).orElse(null);
}






}
