package com.javaproject.cookly.model;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Entity
@Table(name = "comments")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank(message = "Comment must not be blank")
    @Column(nullable = false)
    @Size(min = 2, max = 2500, message = "Comment must be between 2 and 2500 characters long")
    private String comment;
    
    @Min(value = 0, message = "Rate must be between 0 and 5")
    @Max(value = 5, message = "Rate must be between 0 and 5")
    private int rate = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    @com.fasterxml.jackson.annotation.JsonIgnore
    private User pubUser;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "recipe_id")
    @com.fasterxml.jackson.annotation.JsonIgnore
    private Recipe pubRecipe;
    
    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;
    @Column(updatable = true)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }
    public Long getId() {
        return id;
    }
    public Comment() {
    }
    public Comment( String comment, int rate, User pubUser, Recipe pubRecipe) {
        this.comment = comment;
        this.rate = rate;
        this.pubUser = pubUser;
        this.pubRecipe = pubRecipe;
    }
    public Date getCreatedAt() {
        return createdAt;
    }
    public Date getUpdatedAt() {
        return updatedAt;
    }
    public int getRate() {
        return rate;
    }
    public void setRate(int rate) {
        this.rate = rate;
    }
    public User getPubUser() {
        return pubUser;
    }
    public void setPubUser(User pubUser) {
        this.pubUser = pubUser;
    }
    public Recipe getPubRecipe() {
        return pubRecipe;
    }
    public void setPubRecipe(Recipe pubRecipe) {
        this.pubRecipe = pubRecipe;
    }

}
