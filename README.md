# Smart Recipe Platform
# Cookly
## 📌 Overview  
Smart Recipe Platform is a modern AI-powered web application built with Java + Spring Boot (backend) and HTML/TailwindCSS/JavaScript (frontend). The platform helps users discover what to cook based on available ingredients, share and explore recipes, and reduces food waste — all within a friendly community.

## 🚀 Features  
- User registration & login  
- AI-powered recipe suggestions based on user’s ingredients  
- Ability for users to add their own recipes (title, ingredients, steps, image, etc.)  
- Rate, comment, and “favorite” recipes  
- Search & filter by category, calories, timestamp  
- Shopping list generation per recipe  
- Display of top-rated recipes on the home page  
- Detailed recipe pages with ingredients, instructions, images, metadata  

## 🏗 Architecture & Tech Stack  
**Frontend:** HTML, TailwindCSS, JavaScript  
**Backend:** Java + Spring Boot  
**Database:** MySQL (or Firebase)  
**AI / External APIs:** OpenAI API for recipe generation, external recipe APIs for structured data  

## 🗄 Database Schema (simplified)  
### User  
- username, email, password    
- created_at, updated_at  

### Recipe  
- title, description, steps  
- ingredients  
- category / tags  
- calories, cooking_time  
- image_url  
- created_at, updated_at  

### Comment / Review  
- text comment  
- rating (e.g. stars or points)  
- created_at, updated_at  

## 🔄 Workflow (How it works)  
1. User registers or logs in  
2. User enters available ingredients or requests AI suggestions  
3. User creates/publishes recipes or browses existing ones  
4. Users rate, comment, favorite recipes  
5. Users search/filter recipes; home page shows top-rated recipes  
6. User views recipe details and gets ingredients + shopping list  

## 📦 Installation & Setup (local development)  
```bash
git clone https://github.com/amrfoqha/Java-Project.git  
cd Java-Project  
# For backend:
#  - Import project in your IDE (e.g. IntelliJ IDEA / Eclipse)  
#  - Configure database credentials in application.properties  
#  - Run Spring Boot application  
# For frontend:
#  - Serve HTML/Tailwind frontend in any static web server, or integrate with backend routes  
