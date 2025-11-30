<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <%@ page isErrorPage="true" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Document</title>
                        <script src="https://cdn.tailwindcss.com"></script>
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
                        <header class="bg-white shadow-lg sticky top-0 z-50 px-10 smooth-hover">
                            <div class="flex justify-between px-6 py-5 items-center">
                                <div class="flex items-center space-x-4 smooth-hover">
                                    <span
                                        class="inline-flex items-center justify-center w-12 h-12 bg-gradient-to-br from-orange-300 to-pink-300 text-orange-700 rounded-2xl shadow-md">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-7 h-7" fill="none"
                                            viewBox="0 0 24 24" stroke="currentColor">
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
                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none"
                                            viewBox="0 0 24 24" stroke="currentColor">
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
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor"
                                        fill="none">
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
                                        class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor"
                                            fill="none">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M5.121 17.804A9 9 0 1118.88 17.804M12 7a4 4 0 100-8 4 4 0 000 8z" />
                                        </svg>
                                        <span>Profile</span>
                                    </a>

                                    <a href="/ingredientMatcher"
                                        class="text-orange-600 border-b-2 border-orange-600 pb-1 flex items-center space-x-2 smooth-hover">
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
                                    <svg class="w-8 h-8 text-gray-500 hover:text-orange-500" fill="none"
                                        stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
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
                                    <a href="/profile/${loggedInUser.id}" class="block text-gray-700">Profile</a>
                                    <a href="/ingredientMatcher" class="block text-orange-600 font-semibold">Ingredient
                                        Matcher</a>
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


                        <div
                            class="w-[80%] h-42 rounded-2xl bg-gradient-to-r from-[#FF6900] to-[#F73698] py-12 mx-auto pl-16 mt-10">
                            <div class="flex items-center">

                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"
                                    fill="none" stroke="white" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="lucide lucide-sparkles w-12 h-12" aria-hidden="true">
                                    <path
                                        d="M11.017 2.814a1 1 0 0 1 1.966 0l1.051 5.558a2 2 0 0 0 1.594 1.594l5.558 1.051a1 1 0 0 1 0 1.966l-5.558 1.051a2 2 0 0 0-1.594 1.594l-1.051 5.558a1 1 0 0 1-1.966 0l-1.051-5.558a2 2 0 0 0-1.594-1.594l-5.558-1.051a1 1 0 0 1 0-1.966l5.558-1.051a2 2 0 0 0 1.594-1.594z">
                                    </path>
                                    <path d="M20 2v4"></path>
                                    <path d="M22 4h-4"></path>
                                    <circle cx="4" cy="20" r="2"></circle>
                                </svg>
                                <h1 class="text-white text-2xl font-light ml-4">What's in Your Kitchen?</h1>
                            </div>
                            <div class="ml-4 mt-2">
                                <h1 class="text-white text-2xl font-light">Add the ingredients you have, and
                                    we'll
                                    find recipes you can make!</h1>
                            </div>
                        </div>
                        <div class="w-[80%] h-48 rounded-2xl p-6 mx-auto pl-8 bg-gray-200 mt-10">
                            <h1 class="text-xl font-light">Your Ingredients</h1>
                            <div class="pr-10">
                                <form id="ingredientForm" class="flex items-center justify-between mt-2">
                                    <input type="text" id="ingredientInput"
                                        placeholder="e.g., chicken, tomatoes, pasta..."
                                        class="w-4/5 p-2 rounded-lg h-12 pl-4">
                                    <button type="submit"
                                        class="bg-[#FF6900] text-white p-2 rounded-lg w-1/6 h-12 hover:bg-[#FF695f] text-2xl">
                                        Add
                                    </button>
                                </form>

                                <ul id="ingredientsList" class="mt-2 flex space-x-2 text-sm text-red-700">

                                </ul>

                                <button id="submitIngredients"
                                    class="mt-2 bg-green-500 text-white p-2 rounded-lg">Submit
                                    All</button>
                            </div>
                        </div>
                        <div id="recipeContainer"
                            class="flex gap-36 mx-auto mt-10 flex-wrap items-center justify-center w-[80%] mb-32">


                        </div>
                        <footer class="bg-gray-100 mt-12 py-6 text-center fixed bottom-0 w-full">
                            <p class="text-gray-600">&copy; 2025 coockly. All rights reserved.</p>
                        </footer>
                        <script src="../js/integration.js"></script>


                    </body>

                    </html>