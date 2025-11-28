package com.javaproject.cookly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaproject.cookly.model.Comment;
import com.javaproject.cookly.repository.CommentRepo;

@Service
public class CommentService {
    @Autowired
    private CommentRepo commentRepo;

    

    public Comment createComment(Comment comment) {
        return commentRepo.save(comment);
    }

    public List<Comment> findAll() {
        return commentRepo.findAll();
    }
    public List<Comment> findByRecipeId(Long recipeId) {
        return commentRepo.findByPubRecipeId(recipeId);
    }

    public List<Comment> findByUserId(Long userId) {
        return commentRepo.findByPubUserId(userId);
    }
    public double getAverageRating(Long recipeId) {
        List<Comment> comments = commentRepo.findByPubRecipeId(recipeId);
        if (comments.isEmpty()) {
            return 0;
        }
        double sum = 0;
        for (Comment comment : comments) {
            sum += comment.getRate();
        }
        return sum / comments.size();
    }
}
