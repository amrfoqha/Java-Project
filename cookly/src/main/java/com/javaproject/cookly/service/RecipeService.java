package com.javaproject.cookly.service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.javaproject.cookly.model.Recipe;
import com.javaproject.cookly.model.User;
import com.javaproject.cookly.repository.RecipeRepo;

@Service
public class RecipeService {

    @Autowired
    private RecipeRepo recipeRepo;
    private static final String DEEPSEEK_API_URL = "https://api.deepseek.com/v1/chat/completions";
    private static final String DEEPSEEK_API_KEY = "sk-f1696c3919d344d69d2f58d7291a4d9a";

    private static final Logger logger = LoggerFactory.getLogger(RecipeService.class);
    private final RestTemplate rest = new RestTemplate();
    private final ObjectMapper mapper = new ObjectMapper();

    public Recipe createRecipe(Recipe recipe, User user) {
        recipe.setPubUser(user);
        return recipeRepo.save(recipe);
    }

    public List<Recipe> getUserRecipes(User user) {
        return recipeRepo.findByPubUser(user);
    }

    public Recipe getRecipeById(Long id) {
        return recipeRepo.findById(id).orElse(null);
    }

    public void deleteRecipe(Long id, User user) {
        Recipe recipe = recipeRepo.findById(id).orElse(null);
        if (recipe != null && recipe.getPubUser().getId() == user.getId()) {
            recipeRepo.delete(recipe);
        }
    }
    
    public Page<Recipe> getRecipesByPage(int page, int size) {
        return recipeRepo.findAll(PageRequest.of(page, size));
    }

    public List<Recipe> getRecipesByName(String name) {
        return recipeRepo.findByTitleContainingIgnoreCase(name);
    }
    
    public void save(Recipe recipe) {
        recipeRepo.save(recipe);
    }

    public boolean checkFavorite(Long recipeId, Long userId) {
        return recipeRepo.existsByFavoritedBy(recipeId, userId);
    }

    public List<Recipe> filterRecipes(List<String> categories, Integer calories) {
        if ((categories == null || categories.isEmpty()) && (calories != null && calories > 0)) {
            return recipeRepo.findByCaloriesLessThanEqual(calories);
        }
        if (calories == null || calories <= 0) {
            return recipeRepo.filterRecipes(categories, null);
        }
        return recipeRepo.filterRecipes(categories, calories);
    }



    public List<Recipe> findRecipesByUserIngredients(List<String> userIngredients) {
        String searchValue = String.join(",", userIngredients); 
        List<Recipe> allRecipes = recipeRepo.findByIngredientsContaining(searchValue);

        return allRecipes.stream()
                .sorted((r1, r2) -> {
                    List<String> r1Ingredients = Arrays.asList(r1.getIngredients().split(","));
                    List<String> r2Ingredients = Arrays.asList(r2.getIngredients().split(","));

                    long r1Count = r1Ingredients.stream()
                            .map(String::trim)
                            .filter(userIngredients::contains)
                            .count();

                    long r2Count = r2Ingredients.stream()
                            .map(String::trim)
                            .filter(userIngredients::contains)
                            .count();

                    return Long.compare(r2Count, r1Count); // descending order
                })
                .collect(Collectors.toList());
    }

    public Recipe generateRecipeWithAI(List<String> userIngredients) throws Exception {
        String prompt =
        "You are an expert chef AI. Based on the following user ingredients: " +
        String.join(", ", userIngredients) + ". " +
        "Generate a realistic and coherent recipe that strictly matches these rules:\n\n" +

        "1. Return JSON only. No explanation.\n" +
        "2. JSON fields: title, description, category, cuisine, cookingTime, calories, ingredients, steps, image.\n\n" +

        "3. category MUST be one of the following only (exact spelling): " +
        "[\"main dish\", \"salads\", \"dessert\", \"healthy food\", \"vegan\"].\n" +

        "4. calories MUST be a number only (example: 450) with no text.\n" +

        "5. ingredients: return an array of short ingredient names ONLY, each item without a comma inside it.\n" +
        "   (Example: \"Olive oil\", \"Chicken breast\", \"Garlic cloves\")\n" +

        "6. steps: return an array of clean steps, each step must NOT contain a comma.\n" +
        "   Write each step as a short clear instruction.\n" +

        "7. cookingTime: return a short friendly time such as \"30 minutes\".\n" +

        "8. image: return a realistic food image URL (Unsplash or Pexels).\n\n" +

        "Return valid JSON like this example:\n" +
        "{\n" +
        "  \"title\": \"...\",\n" +
        "  \"description\": \"...\",\n" +
        "  \"category\": \"...\",\n" +
        "  \"cuisine\": \"...\",\n" +
        "  \"cookingTime\": \"...\",\n" +
        "  \"calories\": 450,\n" +
        "  \"ingredients\": [\"...\", \"...\"],\n" +
        "  \"steps\": [\"...\", \"...\"],\n" +
        "  \"image\": \"...\"\n" +
        "}";


        ObjectNode body = mapper.createObjectNode();
        body.put("model", "deepseek-chat");
        ArrayNode messages = body.putArray("messages");
        ObjectNode userMsg = mapper.createObjectNode();
        userMsg.put("role", "user");
        userMsg.put("content", prompt);
        messages.add(userMsg);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(DEEPSEEK_API_KEY);

        HttpEntity<String> request = new HttpEntity<>(body.toString(), headers);

        ResponseEntity<String> resp = rest.postForEntity(DEEPSEEK_API_URL, request, String.class);

        if (!resp.getStatusCode().is2xxSuccessful()) {
            throw new RuntimeException("DeepSeek call failed: " + resp.getStatusCode());
        }

        String rawResponse = resp.getBody();
        logger.info("DeepSeek Raw Response: {}", rawResponse);

        JsonNode root = mapper.readTree(rawResponse);
        
        // Robust traversal
        JsonNode choices = root.path("choices");
        if (choices.isMissingNode() || choices.isEmpty()) {
            throw new RuntimeException("Invalid API response: 'choices' array is missing or empty. Response: " + rawResponse);
        }

        JsonNode message = choices.get(0).path("message");
        if (message.isMissingNode()) {
             throw new RuntimeException("Invalid API response: 'message' node is missing. Response: " + rawResponse);
        }

        String content = message.path("content").asText();
        if (content == null || content.trim().isEmpty()) {
             throw new RuntimeException("Invalid API response: 'content' is empty. Response: " + rawResponse);
        }
        
        // Clean up markdown code blocks if present
        content = content.replaceAll("```json", "").replaceAll("```", "").trim();

        logger.info("Parsed Content JSON String: {}", content);

        JsonNode json = mapper.readTree(content);

        Recipe r = new Recipe();
        r.setTitle(json.path("title").asText("Untitled Recipe"));
        r.setDescription(json.path("description").asText("No description available."));
        r.setCategory(json.path("category").asText("General"));
        r.setCuisine(json.path("cuisine").asText("International"));
        r.setCookingTime(json.path("cookingTime").asText("Unknown"));
        r.setCalories(json.path("calories").asInt(0));
        r.setImage(json.path("image").asText("https://via.placeholder.com/400x250?text=No+Image"));
        
        List<String> ings = mapper.convertValue(json.path("ingredients"), new com.fasterxml.jackson.core.type.TypeReference<List<String>>() {});
        if(ings == null) ings = List.of();
        
        List<String> steps = mapper.convertValue(json.path("steps"), new com.fasterxml.jackson.core.type.TypeReference<List<String>>() {});
        if(steps == null) steps = List.of();

        r.setIngredients(String.join(", ", ings));
        r.setSteps(String.join(", ", steps));
        
        // Save to repo if you want to persist it, otherwise just return it
        recipeRepo.save(r);
        logger.info("Recipe generated and saved: {}", r.getTitle());
        logger.info("Recipe details - Category: {}, CookingTime: {}, Calories: {}", 
                    r.getCategory(), r.getCookingTime(), r.getCalories());

        return r;
    }
}
