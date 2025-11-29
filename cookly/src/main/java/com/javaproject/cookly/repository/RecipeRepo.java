
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

    // @Query("SELECT r FROM Recipe r WHERE r.ingredients LIKE %:ingredients% limit 3")
    // List<Recipe> findByIngredientsContaining(String ingredients);

    @Query("SELECT r FROM Recipe r WHERE r.ingredients LIKE %:ingredient%")
    List<Recipe> findByIngredient(@Param("ingredient") String ingredient);

    List<Recipe> findByCaloriesLessThanEqual(int calories);

    @Query("""
        SELECT r FROM Recipe r
        WHERE (:calories = 0 OR r.calories <= :calories)
        AND (
            :categories IS NULL 
            OR EXISTS (
                SELECT 1 FROM Recipe rr
                WHERE rr.id = r.id AND (
                    r.category LIKE CONCAT('%', :cat1, '%')
                    OR r.category LIKE CONCAT('%', :cat2, '%')
                    OR r.category LIKE CONCAT('%', :cat3, '%')
                )
            )
        )
    """)
    List<Recipe> filterRecipes(
            @Param("cat1") String cat1,
            @Param("cat2") String cat2,
            @Param("cat3") String cat3,
            @Param("categories") List<String> categories,
            @Param("calories") Integer calories
                            );




}
