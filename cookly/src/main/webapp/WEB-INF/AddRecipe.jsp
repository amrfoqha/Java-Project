<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Create New Recipe</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
                <style>
                    @import url('https://fonts.googleapis.com/css2?family=Cairo:wght@400;600;700;900&display=swap');

                    * {
                        font-family: 'Cairo', sans-serif;
                    }

                    body {
                        font-family: 'Inter', sans-serif;
                        background-color: #f8fafc;
                    }
                </style>
            </head>

            <body class="min-h-screen">

                <!-- Header -->
                <header class="bg-white shadow-lg sticky top-0 z-50 px-10 smooth-hover">
                    <div class="flex justify-between px-6 py-5 items-center">
                        <div class="flex items-center space-x-4 smooth-hover">
                            <span
                                class="inline-flex items-center justify-center w-12 h-12 bg-gradient-to-br from-orange-300 to-pink-300 text-orange-700 rounded-2xl shadow-md">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-7 h-7" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                        d="M12 6a4 4 0 00-8 0c0 1.657 1.343 3 3 3h10a3 3 0 100-6 4 4 0 00-8 0" />
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                        d="M5 12h14v6a2 2 0 01-2 2H7a2 2 0 01-2-2v-6z" />
                                </svg>
                            </span>

                            <div>
                                <h1
                                    class="text-2xl sm:text-3xl md:text-4xl font-extrabold bg-gradient-to-r from-orange-600 to-pink-500 bg-clip-text text-transparent leading-tight">
                                    Smart Recipe Platform
                                </h1>
                                <span class="text-xs sm:text-sm md:text-base font-semibold text-gray-600">
                                    AI-Powered Recipe Discovery
                                </span>
                            </div>

                        </div>

                        <div class="hidden md:flex items-center gap-4">
                            <c:if test="${loggedInUser != null}">
                                <a href="/logout"
                                    class="bg-gradient-to-r from-orange-500 to-pink-500 text-white text-sm font-semibold py-2.5 px-5 rounded-xl shadow-xl hover:opacity-90 smooth-hover">Logout</a>
                            </c:if>
                            <c:if test="${loggedInUser == null}">
                                <a href="/login"
                                    class="bg-gradient-to-r from-orange-500 to-pink-500 text-white text-sm font-semibold py-2.5 px-5 rounded-xl shadow-xl hover:opacity-90 smooth-hover">
                                    Login / Register
                                </a>
                            </c:if>
                        </div>
                        <div class="md:hidden flex items-center cursor-pointer">
                            <button id="hamburgerBtn" class="text-gray-700 focus:outline-none"
                                onclick="toggleMobileMenu()">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M4 6h16M4 12h16M4 18h16" />
                                </svg>
                            </button>
                        </div>
                        <script>
                            function toggleMobileMenu() {
                                const button = document.getElementById("hamburgerBtn");
                                const mobileMenu = document.getElementById("mobileMenu");
                                button.onclick = () => {
                                    mobileMenu.classList.toggle("hidden");
                                }
                            }
                        </script>

                    </div>


                    <nav class="hidden md:flex ml-8 mt-3 space-x-10 text-base font-semibold pb-4">

                        <a href="/"
                            class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor" fill="none">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M4 6h16M4 12h16M4 18h7" />
                            </svg>
                            <span>Recipes</span>
                        </a>
                        <c:if test="${not empty sessionScope.loggedInUser}">
                            <a href="/marketList"
                                class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor"
                                    fill="none">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M4 9h16l-1.5 9h-13L4 9zM7 9l3-6m4 6l3-6" />
                                </svg>
                                <span>Market List</span>
                            </a>



                            <a href="/addRecipe"
                                class="text-orange-600 border-b-2 border-orange-600 pb-1 flex items-center space-x-2 smooth-hover">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor"
                                    fill="none">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M12 4v16m8-8H4" />
                                </svg>
                                <span>Add Recipe</span>
                            </a>

                            <a href="/profile/${loggedInUser.id}"
                                class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover mt-2">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor"
                                    fill="none">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M5.121 17.804A9 9 0 1118.88 17.804M12 7a4 4 0 100-8 4 4 0 000 8z" />
                                </svg>
                                <span>Profile</span>
                            </a>

                            <a href="/ingredientMatcher"
                                class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor"
                                    fill="none">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M21 21l-4.35-4.35M11 18a7 7 0 100-14 7 7 0 000 14z" />
                                </svg>
                                <span>Ingredient Matcher</span>
                            </a>
                        </c:if>

                        <a href="/about"
                            class="flex items-center space-x-1 text-gray-600 hover:text-orange-600 transition">
                            <svg class="w-8 h-8 text-gray-500 hover:text-orange-500" fill="none" stroke="currentColor"
                                viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M13 16h-1v-4h-1m1-4h.01M12 20a8 8 0 100-16 8 8 0 000 16z" />
                            </svg>
                            <span>About Us</span>
                        </a>

                    </nav>
                    <div id="mobileMenu" class="hidden md:hidden px-4 pb-4 space-y-3 border-t border-gray-200">
                        <a href="/" class="block text-gray-700">Recipes</a>
                        <c:if test="${not empty sessionScope.loggedInUser}">
                            <a href="/marketList" class="block text-gray-700">Market List</a>
                            <a href="/addRecipe" class="block text-orange-600 font-semibold">Add Recipe</a>
                            <a href="/profile/${loggedInUser.id}" class="block text-gray-700">Profile</a>
                            <a href="/ingredientMatcher" class="block text-gray-700">Ingredient Matcher</a>
                        </c:if>
                        <a href="/about" class="block text-gray-700">About Us</a>

                        <c:if test="${loggedInUser != null}">
                            <a href="/logout"
                                class="block bg-gradient-to-r from-orange-500 to-pink-500 text-white text-center py-2 rounded-xl shadow-md">Logout</a>
                        </c:if>
                        <c:if test="${loggedInUser == null}">
                            <a href="/login"
                                class="block bg-gradient-to-r from-orange-500 to-pink-500 text-white text-center py-2 rounded-xl shadow-md">Login
                                / Register</a>
                        </c:if>
                    </div>
                </header>

                <!-- Main Card -->
                <div
                    class="relative w-full max-w-4xl mx-auto mt-10 sm:mt-16 bg-white rounded-3xl shadow-2xl p-6 sm:p-10 overflow-hidden">

                    <!-- Background Circles -->
                    <div
                        class="absolute -top-20 -left-20 w-56 h-56 sm:w-72 sm:h-72 bg-orange-200 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-pulse">
                    </div>
                    <div
                        class="absolute -bottom-20 -right-20 w-56 h-56 sm:w-72 sm:h-72 bg-emerald-200 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-pulse">
                    </div>

                    <!-- Title -->
                    <h1
                        class="text-2xl sm:text-3xl md:text-4xl font-extrabold text-orange-500 mb-4 text-center relative z-10">
                        Create New Recipe</h1>
                    <p class="text-center text-gray-600 italic mb-8 relative z-10 text-sm sm:text-base">"Cooking is the
                        art of turning fresh ingredients into joy."</p>

                    <!-- Recipe Form -->
                    <form:form modelAttribute="recipe" action="/saveRecipe" method="post"
                        class="space-y-6 relative z-10">

                        <!-- Title + Image -->
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-gray-700 font-semibold mb-2 text-sm sm:text-base">Recipe Title
                                    *</label>
                                <form:input path="title" required="true"
                                    cssClass="border border-emerald-300 rounded-lg p-2 sm:p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 hover:shadow-md transition" />
                            </div>
                            <div>
                                <label class="block text-gray-700 font-semibold mb-2 text-sm sm:text-base">Image URL
                                    *</label>
                                <form:input path="image" required="true"
                                    cssClass="border border-emerald-300 rounded-lg p-2 sm:p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 hover:shadow-md transition" />
                            </div>
                        </div>

                        <!-- Description -->
                        <div>
                            <label class="block text-gray-700 font-semibold mb-2 text-sm sm:text-base">Description
                                *</label>
                            <form:textarea path="description" required="true" rows="3"
                                cssClass="border border-emerald-300 rounded-lg p-2 sm:p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 resize-none hover:shadow-md transition" />
                        </div>

                        <!-- Calories, Cooking Time, Category, Cuisine -->
                        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4">
                            <div>
                                <label class="block text-gray-700 font-semibold mb-2 text-sm sm:text-base">Calories
                                    *</label>
                                <form:input path="calories" type="number" required="true"
                                    cssClass="border border-emerald-300 rounded-lg p-2 sm:p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 hover:shadow-md transition" />
                            </div>
                            <div>
                                <label class="block text-gray-700 font-semibold mb-2 text-sm sm:text-base">Cooking Time
                                    *</label>
                                <form:input path="cookingTime" type="text" required="true" placeholder="e.g., 30 min"
                                    cssClass="border border-emerald-300 rounded-lg p-2 sm:p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 hover:shadow-md transition" />
                            </div>
                            <div>
                                <label class="block text-gray-700 font-semibold mb-2 text-sm sm:text-base">Category
                                    *</label>
                                <form:select path="category" required="true"
                                    cssClass="border border-emerald-300 rounded-lg p-2 sm:p-3 w-full bg-white focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 hover:shadow-md transition">
                                    <form:option value="" label="Select a category" />
                                    <form:option value="Main Dishes" label="Main Dishes" />
                                    <form:option value="Salads" label="Salads" />
                                    <form:option value="Dessert" label="Dessert" />
                                    <form:option value="Healthy Food" label="Healthy Food" />
                                    <form:option value="Vegan" label="Vegan" />
                                </form:select>
                            </div>
                            <div>
                                <label class="block text-gray-700 font-semibold mb-2 text-sm sm:text-base">Cuisine
                                    *</label>
                                <form:input path="cuisine" required="true" placeholder="e.g., Italian"
                                    cssClass="border border-emerald-300 rounded-lg p-2 sm:p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 hover:shadow-md transition" />
                            </div>
                        </div>

                        <!-- Ingredients -->
                        <div>
                            <label class="block text-gray-700 font-semibold mb-2 text-sm sm:text-base">Ingredients
                                *</label>
                            <form:textarea path="ingredients" required="true"
                                placeholder="Write all ingredients here..." rows="3"
                                cssClass="border border-emerald-300 rounded-lg p-2 sm:p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 resize-none hover:shadow-md transition" />
                        </div>

                        <!-- Steps -->
                        <div>
                            <label class="block text-gray-700 font-semibold mb-2 text-sm sm:text-base">Steps *</label>
                            <form:textarea path="steps" required="true" placeholder="Write all steps here..." rows="3"
                                cssClass="border border-emerald-300 rounded-lg p-2 sm:p-3 w-full focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-opacity-50 resize-none hover:shadow-md transition" />
                        </div>

                        <!-- Buttons -->
                        <div class="flex flex-col sm:flex-row gap-4 mt-6 justify-center">
                            <button type="submit"
                                class="bg-gradient-to-r from-orange-400 to-emerald-500 text-white px-6 sm:px-8 py-2 sm:py-3 rounded-full font-semibold hover:scale-105 hover:shadow-xl transition-all duration-300">
                                Create Recipe
                            </button>
                            <a href="/"
                                class="bg-gray-200 text-gray-800 px-6 sm:px-8 py-2 sm:py-3 rounded-full font-semibold hover:bg-gray-300 hover:scale-105 transition-all duration-300 text-center shadow-sm">
                                Cancel
                            </a>
                        </div>

                    </form:form>
                </div>

            </body>

            </html>