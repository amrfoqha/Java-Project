
package com.javaproject.cookly.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.model.User;

@Repository
public interface RecipeRepo extends CrudRepository<Recipe, Long>, PagingAndSortingRepository<Recipe, Long> {

    List<Recipe> findAll();
    List<Recipe> findByPubUser(User user);
    List<Recipe> findByFavoritedBy(User user);

    List<Recipe> findByTitleContainingIgnoreCase(String name);
    
    @Query("SELECT COUNT(r) > 0 FROM Recipe r JOIN r.favoritedBy u WHERE r.id = :recipeId AND u.id = :userId")
    boolean existsByFavoritedBy(Long recipeId, Long userId);

    @Query("SELECT r FROM Recipe r WHERE r.ingredients LIKE %:ingredients%")
    List<Recipe> findByIngredientsContaining(String ingredients);

    List<Recipe> findByCaloriesLessThanEqual(int calories);

   @Query("""
    SELECT r FROM Recipe r
    WHERE 
        (
            :categories IS NULL 
            OR :#{#categories.size()} = 0
            OR (
                CONCAT(r.category, '') LIKE CONCAT('%', :#{#categories != null && !#categories.isEmpty() ? #categories[0] : ''}, '%')
            )
        )
        AND (:calories = 0 OR r.calories <= :calories)
    """)
List<Recipe> filterRecipes(
        @Param("categories") List<String> categories,
        @Param("calories") Integer calories
);


}
