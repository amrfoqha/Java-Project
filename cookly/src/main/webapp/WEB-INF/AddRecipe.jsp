<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Create New Recipe</title>
                <script src="https://cdn.tailwindcss.com"></script>
            </head>

            <body class="bg-gradient-to-br from-orange-50 via-white to-emerald-50 min-h-screen">
            <header class="bg-white shadow-lg sticky top-0 z-50 px-10">
                <div class="flex justify-between px-6 py-5 items-center">

                    <!-- Logo + Title -->
                    <div class="flex items-center space-x-4">
            <span class="inline-flex items-center justify-center w-12 h-12 bg-gradient-to-br from-orange-200 to-pink-200 text-orange-600 rounded-2xl shadow-sm">
                <!-- Chef Hat Icon -->
                <svg xmlns="http://www.w3.org/2000/svg" class="w-7 h-7" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                          d="M12 6a4 4 0 00-8 0c0 1.657 1.343 3 3 3h10a3 3 0 100-6 4 4 0 00-8 0" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                          d="M5 12h14v6a2 2 0 01-2 2H7a2 2 0 01-2-2v-6z" />
                </svg>
            </span>

                        <div>
                            <h1 class="text-3xl font-extrabold text-gray-900 tracking-tight">
                                Smart Recipe Platform
                            </h1>

                            <span
                                    class="text-sm font-semibold bg-clip-text text-transparent bg-gradient-to-r from-orange-500 to-pink-500">
                    AI-Powered Recipe Discovery
                </span>
                        </div>
                    </div>


                    <!-- Button -->
                    <button
                            class="bg-gradient-to-r from-orange-500 to-pink-500 text-white text-base font-semibold py-2.5 px-5 rounded-xl shadow-md hover:opacity-90 transition flex items-center space-x-2">
                        <!-- Login Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M15 12H3m12-6l6 6-6 6" />
                        </svg>
                        <span><a href="/login" class="bg-orange-600 text-white text-sm font-medium py-2 px-4 rounded-lg shadow-md hover:bg-orange-700">Login / Register</a></span>
                    </button>

                </div>


                <!-- Nav -->
                <nav class="hidden md:flex ml-8 mt-3 space-x-10 text-base font-semibold pb-4">


                    <a href="/" class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
                        <!-- Recipe Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M4 6h16M4 12h16M4 18h7" />
                        </svg>
                        <span>Recipes</span>
                    </a>

                    <a href="/marketList" class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
                        <!-- Shopping Basket Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M4 9h16l-1.5 9h-13L4 9zM7 9l3-6m4 6l3-6" />
                        </svg>
                        <span>Market List</span>
                    </a>

                    <a href="/addRecipe" class="text-orange-600 border-b-2 border-orange-600 pb-1 flex items-center space-x-2">
                        <!-- Plus Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M12 4v16m8-8H4" />
                        </svg>
                        <span>Add Recipe</span>
                    </a>

                    <a href="/profile" class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
                        <!-- User Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M5.121 17.804A9 9 0 1118.88 17.804M12 7a4 4 0 100-8 4 4 0 000 8z" />
                        </svg>
                        <span>Profile</span>
                    </a>

                    <a href="/ingredientMatcher" class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
                        <!-- Search Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M21 21l-4.35-4.35M11 18a7 7 0 100-14 7 7 0 000 14z" />
                        </svg>
                        <span>Ingredient Matcher</span>
                    </a>
                </nav>
            </header>

                <!-- Main card container -->
                <div
                    class="relative w-full max-w-4xl bg-white rounded-3xl shadow-2xl p-10 overflow-hidden mt-20 mx-auto">

                    <!-- Decorative background circles -->
                    <div
                        class="absolute -top-20 -left-20 w-72 h-72 bg-orange-200 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-pulse">
                    </div>
                    <div
                        class="absolute -bottom-20 -right-20 w-72 h-72 bg-emerald-200 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-pulse">
                    </div>

                    <!-- Quote -->
                    <p class="text-center text-xl text-emerald-600 italic mb-6 relative z-10">"Cooking is the art of
                        turning fresh ingredients into joy."</p>

                    <!-- Title -->
                    <h1 class="text-4xl font-extrabold text-orange-500 mb-10 text-center relative z-10">Create New
                        Recipe</h1>

                    <form:form modelAttribute="recipe" action="saveRecipe" method="post"
                        class="space-y-6 relative z-10">

                        <!-- Recipe Title + Image -->
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-gray-700 font-semibold mb-2">Recipe Title *</label>
                                <form:input path="title" required="true"
                                    cssClass="border border-emerald-300 rounded-lg p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 hover:shadow-md transition" />
                            </div>
                            <div>
                                <label class="block text-gray-700 font-semibold mb-2">Image URL *</label>
                                <form:input path="image" required="true"
                                    cssClass="border border-emerald-300 rounded-lg p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 hover:shadow-md transition" />
                            </div>
                        </div>

                        <!-- Description -->
                        <div>
                            <label class="block text-gray-700 font-semibold mb-2">Description *</label>
                            <form:textarea path="description" required="true" rows="4"
                                cssClass="border border-emerald-300 rounded-lg p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 resize-none hover:shadow-md transition" />
                        </div>

                        <!-- Calories + Cooking Time + Category -->
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                            <div>
                                <label class="block text-gray-700 font-semibold mb-2">Calories *</label>
                                <form:input path="calories" type="number" required="true"
                                    cssClass="border border-emerald-300 rounded-lg p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 hover:shadow-md transition" />
                            </div>
                            <div>
                                <label class="block text-gray-700 font-semibold mb-2">Cooking Time *</label>
                                <form:input path="cookingTime" type="text" required="true" placeholder="e.g., 30 min"
                                    cssClass="border border-emerald-300 rounded-lg p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 hover:shadow-md transition" />
                            </div>
                            <div>
                                <label class="block text-gray-700 font-semibold mb-2">Category *</label>

                                <!-- UPDATED CATEGORY DROPDOWN -->
                                <form:select path="category" required="true"
                                    cssClass="border border-emerald-300 rounded-lg p-3 w-full bg-white focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 hover:shadow-md transition">
                                    <form:option value="" label="Select a category" />
                                    <form:option value="Main Dishes" label="Main Dishes" />
                                    <form:option value="Salads" label="Salads" />
                                    <form:option value="Dessert" label="Dessert" />
                                    <form:option value="Healthy Food" label="Healthy Food" />
                                    <form:option value="Vegan" label="Vegan" />
                                </form:select>

                            </div>
                        </div>

                        <!-- Ingredients -->
                        <div>
                            <label class="block text-gray-700 font-semibold mb-2">Ingredients *</label>
                            <form:textarea path="ingredients" required="true"
                                placeholder="Write all ingredients here..." rows="4"
                                cssClass="border border-emerald-300 rounded-lg p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 resize-none hover:shadow-md transition" />
                        </div>

                        <!-- Steps -->
                        <div>
                            <label class="block text-gray-700 font-semibold mb-2">Steps *</label>
                            <form:textarea path="steps" required="true" placeholder="Write all steps here..." rows="4"
                                cssClass="border border-emerald-300 rounded-lg p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 resize-none hover:shadow-md transition" />
                        </div>

                        <!-- Buttons -->
                        <div class="flex flex-col md:flex-row gap-4 mt-8 justify-center">
                            <button type="submit"
                                class="bg-gradient-to-r from-orange-400 to-emerald-500 text-white px-8 py-3 rounded-full font-semibold hover:scale-105 hover:shadow-xl transition-all duration-300">
                                Create Recipe
                            </button>
                            <a href="recipes.jsp"
                                class="bg-gray-200 text-gray-800 px-8 py-3 rounded-full font-semibold hover:bg-gray-300 hover:scale-105 transition-all duration-300 text-center shadow-sm">
                                Cancel
                            </a>
                        </div>

                    </form:form>
                </div>
                <footer class="bg-gray-100 mt-12 py-6 text-center">
                    <p class="text-gray-600">&copy; 2025 coockly. All rights reserved.</p>
                </footer>

            </body>

            </html>