<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Profile - Smart Kitchen</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <script src="https://cdn.tailwindcss.com"></script>

                <style>
                    @import url('https://fonts.googleapis.com/css2?family=Cairo:wght@400;600;700;900&display=swap');

                    * {
                        font-family: 'Cairo', sans-serif;
                    }


                    .smooth-hover {
                        transition: all .25s ease-in-out;
                    }
                </style>
                <script src="../js/quotes.js"></script>
            </head>

            <body class="bg-gray-50">

                <!-- HEADER -->
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
                            class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover mt-2">
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
                                class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor"
                                    fill="none">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M12 4v16m8-8H4" />
                                </svg>
                                <span>Add Recipe</span>
                            </a>

                            <a href="/profile/${loggedInUser.id}"
                                class="text-orange-600 border-b-2 border-orange-600 pb-1 flex items-center space-x-2 smooth-hover">
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
                            <a href="/addRecipe" class="block text-gray-700">Add Recipe</a>
                            <a href="/profile/${loggedInUser.id}"
                                class="block text-orange-600 font-semibold">Profile</a>
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

                <main class="container mx-auto px-4 py-8 max-w-7xl">

                    <div
                        class="bg-gradient-to-r from-orange-500 to-pink-500 rounded-3xl p-10 text-white shadow-xl mb-10 smooth-hover">
                        <div class="flex items-center gap-8">
                            <div class="w-32 h-32 rounded-full overflow-hidden border-4 border-white shadow-2xl">
                                <img src="https://i.pinimg.com/736x/2c/47/d5/2c47d5dd5b532f83bb55c4cd6f5bd1ef.jpg"
                                    alt="${user.name}" class="w-full h-full object-cover">
                            </div>

                            <div class="flex-1">
                                <h1 class="text-4xl font-bold mb-2 drop-shadow-sm">${user.name}</h1>

                                <div class="mt-4">
                                    <div class="flex items-center justify-between mb-1">
                                        <span id="quoteContainer"
                                            class="text-white/90 text-lg italic smooth-hover">“Where taste
                                            meets tech.”</span>

                                    </div>
                                    <div class="w-full bg-white/25 rounded-full h-3">
                                        <div class="bg-white h-full rounded-full" style="width: 25%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="flex justify-center gap-10 mb-12">

                        <!-- Favorite Meals -->
                        <div class="bg-white rounded-2xl p-6 shadow-xl w-64 smooth-hover hover:-translate-y-1">
                            <div
                                class="w-12 h-12 rounded-xl bg-red-50 text-red-500 flex items-center justify-center mb-3">
                                ❤️
                            </div>
                            <div class="text-4xl font-bold mb-1 text-gray-900">
                                ${fn:length(user.favoritedRecipes)}
                            </div>
                            <div class="text-gray-600 text-sm">Favourite Meals</div>
                        </div>

                        <!-- My Recipes -->
                        <div class="bg-white rounded-2xl p-6 shadow-xl w-64 smooth-hover hover:-translate-y-1">
                            <div
                                class="w-12 h-12 rounded-xl bg-orange-50 text-orange-500 flex items-center justify-center mb-3">
                                🍴
                            </div>
                            <div class="text-4xl font-bold mb-1 text-gray-900">
                                ${fn:length(user.publishedRecipes)}
                            </div>
                            <div class="text-gray-600 text-sm">My Recipes</div>
                        </div>

                    </div>


                    <div class="bg-white rounded-3xl p-8 shadow-xl">
                        <h2 class="text-3xl font-bold mb-6 text-gray-900">Favorite Recipes</h2>

                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">

                            <c:forEach var="recipe" items="${user.favoritedRecipes}">
                                <a href="/recipeDetails/${recipe.id}"
                                    class="flex gap-4 p-4 border-2 border-gray-200 rounded-xl hover:border-orange-400 hover:bg-orange-50 smooth-hover cursor-pointer shadow-sm">
                                    <img src="${recipe.image}" class="w-20 h-20 rounded-lg object-cover">

                                    <div class="flex-1">
                                        <div class="font-bold text-lg mb-1 line-clamp-1 text-gray-900">${recipe.title}
                                        </div>
                                        <div class="text-sm text-gray-600 line-clamp-1">${recipe.description}</div>

                                        <div class="flex items-center text-sm text-gray-500 gap-4 mb-2 mt-3">
                                            <span class="flex items-center gap-1"><span><svg
                                                        xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                        viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                        class="lucide lucide-clock" aria-hidden="true">
                                                        <path d="M12 6v6l4 2"></path>
                                                        <circle cx="12" cy="12" r="10"></circle>
                                                    </svg></span>
                                                ${recipe.cookingTime}</span>
                                            <span class="flex items-center gap-1 text-red-500"><span>
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                        viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                        class="lucide lucide-flame" aria-hidden="true">
                                                        <path
                                                            d="M12 3q1 4 4 6.5t3 5.5a1 1 0 0 1-14 0 5 5 0 0 1 1-3 1 1 0 0 0 5 0c0-2-1.5-3-1.5-5q0-2 2.5-4">
                                                        </path>
                                                    </svg>
                                                </span>
                                                ${recipe.calories}</span>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="bg-white rounded-3xl p-8 shadow-xl mt-12">
                        <h2 class="text-3xl font-bold mb-6 text-gray-900">My Recipes</h2>


                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">


                            <c:forEach var="recipe" items="${user.publishedRecipes}">
                                <a href="/recipeDetails/${recipe.id}"
                                    class="flex flex-col p-4 border-2 border-gray-200 rounded-xl hover:border-orange-400 hover:bg-orange-50 smooth-hover cursor-pointer shadow-sm">

                                    <img src="${recipe.image}" class="w-full h-40 rounded-lg object-cover mb-3">

                                    <div class="font-bold text-lg mb-1 text-gray-900 line-clamp-1">
                                        ${recipe.title}
                                    </div>

                                    <div class="text-sm text-gray-600 line-clamp-2">
                                        ${recipe.description}
                                    </div>

                                </a>
                            </c:forEach>

                        </div>
                    </div>

                </main>

                <footer class="bg-gray-100 mt-20 py-6 text-center">
                    <p class="text-gray-600">&copy; 2025 Smart Kitchen. All rights reserved.</p>
                </footer>



            </body>

            </html>