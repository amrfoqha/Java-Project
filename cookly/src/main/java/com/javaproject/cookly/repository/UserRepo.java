package com.javaproject.cookly.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import com.javaproject.cookly.model.User;
import com.javaproject.cookly.model.Recipe;

@Repository
public interface UserRepo extends CrudRepository<User, Long> {

    Optional<User> findByEmail(String email);
   
}
