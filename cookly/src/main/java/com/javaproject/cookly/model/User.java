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
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "Name must not be blank")
    @Column(nullable = false)
    @Size(min = 3, max = 30, message = "Name must be between 3 and 30 characters long")
    private String name;
    @NotBlank(message = "Email must not be blank")
    @Column(nullable = false)
    @Size(min = 3, max = 30, message = "Email must be between 3 and 30 characters long")
    @Email(message = "Email must be valid")
    private String email;
    @NotBlank(message = "Password must not be blank")
    @Column(nullable = false)
    @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters long")
    private String password;
    @Transient
    @NotBlank(message = "Confirm Password must not be blank")
    @Column(nullable = false)
    @Size(min = 8, max = 30, message = "Confirm Password must be between 8 and 30 characters long")
    private String confirmPassword;
    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;
    @Column(updatable = true)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;
    @OneToMany(mappedBy = "pubUser", fetch = FetchType.LAZY)
    @com.fasterxml.jackson.annotation.JsonIgnore
    private List<Recipe> publishedRecipes;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "user_favorites",
        joinColumns = @JoinColumn(name = "user_id"),
        inverseJoinColumns = @JoinColumn(name = "recipe_id")
    )
    @com.fasterxml.jackson.annotation.JsonIgnore
    private List<Recipe> favoritedRecipes;

    @OneToMany(mappedBy = "pubUser", fetch = FetchType.LAZY)
    @com.fasterxml.jackson.annotation.JsonIgnore
    private List<Comment> comments;


    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public User() {
    }

    public User(Long id, String name, String email, String password, String confirmPassword) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.confirmPassword = confirmPassword;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    public List<Recipe> getPublishedRecipes() {
        return publishedRecipes;
    }

    public void setPublishedRecipes(List<Recipe> publishedRecipes) {
        this.publishedRecipes = publishedRecipes;
    }
    public List<Recipe> getFavoritedRecipes() {
        return favoritedRecipes;
    }

    public void setFavoritedRecipes(List<Recipe> favoritedRecipes) {
        this.favoritedRecipes = favoritedRecipes;
    }


    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    


}
