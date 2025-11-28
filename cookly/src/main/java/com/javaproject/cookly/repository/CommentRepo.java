package com.javaproject.cookly.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.javaproject.cookly.model.Comment;

@Repository
public interface CommentRepo extends CrudRepository<Comment, Long> {
    List<Comment> findAll();

    List<Comment> findByPubRecipeId(Long recipeId);

    List<Comment> findByPubUserId(Long userId);
    
}
