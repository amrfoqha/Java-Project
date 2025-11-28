
package com.javaproject.cookly.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.model.User;

@Repository
public interface RecipeRepo extends CrudRepository<Recipe, Long>, PagingAndSortingRepository<Recipe, Long> {

    List<Recipe> findAll();
    List<Recipe> findByPubUser(User user);
    List<Recipe> findByFavoritedBy(User user);
    List<Recipe> findByComments(User user);

    List<Recipe> findByTitleContainingIgnoreCase(String name);
    
    @Query("SELECT COUNT(r) > 0 FROM Recipe r JOIN r.favoritedBy u WHERE r.id = :recipeId AND u.id = :userId")
    boolean existsByFavoritedBy(Long recipeId, Long userId);
}
