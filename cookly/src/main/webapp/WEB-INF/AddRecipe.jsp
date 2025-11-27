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
                <header class="bg-white shadow-sm sticky top-0 z-50 px-8">
                    <div class="flex justify-between px-6 py-4 items-center">
                        <div>
                            <h1 class="text-2xl font-bold text-gray-800">Smart Recipe Platform</h1>
                            <span class="text-xs text-gray-500 bg-gray-200 px-2 py-0.5 rounded">AI-Powered
                                Recipe
                                Discovery</span>
                        </div>
                        <button
                            class="bg-orange-600 text-white text-sm font-medium py-2 px-4 rounded-lg shadow-md hover:bg-orange-700">Login
                            / Register</button>
                    </div>


                    <nav class="hidden md:flex ml-6 mt-2 space-x-8 text-sm font-medium pb-3">
                        <a href="/" class="text-gray-600 hover:text-orange-600 transition">Recipes</a>
                        <a href="/marketList" class="text-gray-600 hover:text-orange-600 transition">Market
                            List</a>
                        <a href="/addRecipe" class="text-orange-600 border-b-2 border-orange-600 pb-1">Add
                            Recipe</a>
                        <a href="/profile" class="text-gray-600 hover:text-orange-600 transition">Profile</a>
                        <a href="/ingredientMatcher" class="text-gray-600 hover:text-orange-600 transition">Ingredient
                            Matcher</a>
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

                    <form:form modelAttribute="recipe" action="/saveRecipe/${user.id}" method="post"
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


                            <a href="/profile" class="bg-gradient-to-r from-orange-400 to-emerald-500 text-white px-8 py-3 rounded-full font-semibold hover:scale-105 hover:shadow-xl transition-all duration-300">
                                Create Recipe></a>

                            <a href="/"
                                class="bg-gray-200 text-gray-800 px-8 py-3 rounded-full font-semibold hover:bg-gray-300 hover:scale-105 transition-all duration-300 text-center shadow-sm">
                                Cancel
                            </a>
                        </div>

                    </form:form>
                </div>

            </body>

            </html>