package com.javaproject.cookly.model;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Entity
@Table(name = "recipes")
public class Recipe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "Title must not be blank")
    @Column(nullable = false)
    @Size(min = 2, max = 100, message = "Title must be between 2 and 30 characters long")
    private String title;

    @NotBlank(message = "Description must not be blank")
    @Column(nullable = false)
    @Lob
    @Size(min = 2, max = 2500, message = "Description must be between 2 and 2500 characters long")
    private String description;

    @NotBlank(message = "Ingredients must not be blank")
    @Column(nullable = false,columnDefinition = "TEXT")
    @Lob
    @Size(min = 2, max = 2500, message = "Ingredients must be between 2 and 2500 characters long")
    private String ingredients;

    @NotBlank(message = "Cuisine must not be blank")
    @Column(nullable = false)
    @Size(min = 2, max = 2500, message = "Cuisine must be between 2 and 2500 characters long")
    private String cuisine;

    @NotBlank(message = "Steps must not be blank")
    @Column(nullable = false,columnDefinition = "TEXT")
    @Lob
    @Size(min = 2, max = 2500, message = "Steps must be between 2 and 2500 characters long")
    private String steps;

    @Column(nullable = false)
    @Size(min = 2, max = 2500, message = "Image must be between 2 and 2500 characters long")
    @NotBlank(message = "Image must not be blank")
    private String image;

    @Column(nullable = false)
    @Size(min = 2, max = 2500, message = "Category must be between 2 and 2500 characters long")
    @NotBlank(message = "Category must not be blank")
    private String category;
    
    @Column(nullable = false)
    @Size(min = 2, max = 2500, message = "Cooking Time must be between 2 and 2500 characters long")
    @NotBlank(message = "Cooking Time must not be blank")
    private String cookingTime;

    @Column(nullable = false)
    @Min(value = 0, message = "Calories must be a positive number")
    @Max(value = 10000, message = "Calories must be a number between 0 and 10000")
    private int calories;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd" )
    private Date createdAt;
    @Column(updatable = true)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User pubUser;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "user_favorites",
        joinColumns = @JoinColumn(name = "recipe_id"),
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    @com.fasterxml.jackson.annotation.JsonIgnore
    private List<User> favoritedBy;

    @OneToMany(mappedBy = "pubRecipe", fetch = FetchType.LAZY)
    @com.fasterxml.jackson.annotation.JsonIgnore
    private List<Comment> comments;

   

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    public Recipe() {
    }

    public Recipe(String title, String description, String ingredients, String steps, String image, String category,
            String cookingTime, int calories, String cuisine) {
        this.title = title;
        this.description = description;
        this.ingredients = ingredients;
        this.steps = steps;
        this.image = image;
        this.category = category;
        this.cookingTime = cookingTime;
        this.calories = calories;
        this.cuisine = cuisine;
    }
    public String getCuisine() {
        return cuisine;
    }
    public void setCuisine(String cuisine) {
        this.cuisine = cuisine;
    }
    public Long getId() {
        return id;
    }
    public Date getCreatedAt() {
        return createdAt;
    }
    public Date getUpdatedAt() {
        return updatedAt;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getIngredients() {
        return ingredients;
    }
    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }
    public String getSteps() {
        return steps;
    }
    public void setSteps(String steps) {
        this.steps = steps;
    }
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public String getCookingTime() {
        return cookingTime;
    }
    public void setCookingTime(String cookingTime) {
        this.cookingTime = cookingTime;
    }
    public int getCalories() {
        return calories;
    }
    public void setCalories(int calories) {
        this.calories = calories;
    }
    public User getPubUser() {
        return pubUser;
    }
    public void setPubUser(User pubUser) {
        this.pubUser = pubUser;
    }
    public List<User> getFavoritedBy() {
        return favoritedBy;
    }
    public void setFavoritedBy(List<User> favoritedBy) {
        this.favoritedBy = favoritedBy;
    }
    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public double getAverageRating() {
        if (comments == null || comments.isEmpty()) {
            return 0.0;
        }
        int sum = 0;
        for (Comment comment : comments) {
            sum += comment.getRate();
        }
        return (double) sum / comments.size();
    }

    

    public void setUser(User user) {
    }
}
