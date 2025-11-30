<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>About Us - Smart Recipe Planner</title>
                <script src="https://cdn.tailwindcss.com"></script>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

            <body class="bg-gradient-to-br from-orange-50 via-white to-green-50 min-h-screen">
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
                                class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor"
                                    fill="none">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M5.121 17.804A9 9 0 1118.88 17.804M12 7a4 4 0 100-8 4 4 0 000 8z" />
                                </svg>
                                <span>Profile</span>
                            </a>

                            <a href="/ingredientMatcher"
                                class="flex items-center space-x-1 text-gray-600 hover:text-orange-600 transition">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor"
                                    fill="none">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M21 21l-4.35-4.35M11 18a7 7 0 100-14 7 7 0 000 14z" />
                                </svg>
                                <span>Ingredient Matcher</span>
                            </a>
                        </c:if>

                        <a href="/about"
                            class="text-orange-600 border-b-2 border-orange-600 pb-1 flex items-center space-x-2 smooth-hover">
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
                            <a href="/profile/${loggedInUser.id}" class="block text-gray-700">Profile</a>
                            <a href="/ingredientMatcher" class="block text-gray-700">Ingredient
                                Matcher</a>
                        </c:if>
                        <a href="/about" class="block text-orange-600 font-semibold">About Us</a>

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
                        class="bg-gradient-to-r from-orange-500 to-pink-500 rounded-3xl p-12 text-white mb-12 text-center">
                        <h1 class="text-5xl md:text-6xl font-bold mb-6">About Us</h1>
                        <p class="text-2xl text-white/90 leading-relaxed max-w-3xl mx-auto">
                            Smart platform combining love for cooking and technology to make your kitchen experience
                            easier and more enjoyable.
                        </p>
                    </div>
                    <div class="bg-white rounded-3xl p-10 shadow-2xl mb-12">
                        <h2 class="text-3xl font-bold mb-6 text-orange-600">Our Story</h2>
                        <div class="space-y-6 text-gray-700 text-lg leading-relaxed">
                            <p>
                                Our journey started with a simple idea: how can we make healthy cooking easier and more
                                enjoyable for everyone?
                                In 2025, we launched <span class="font-bold text-orange-600">Smart Recipe Planner</span>
                                to become the first platform in the Arab world combining AI and culinary expertise.
                            </p>
                            <p>
                                We believe cooking is not just preparing a meal—it’s an art and an experience that
                                brings loved ones together and creates lasting memories.
                                That’s why we designed a platform to help you plan meals smartly, discover new recipes,
                                and share your creations with a community of cooking enthusiasts.
                            </p>
                            <p>
                                Today, we proudly serve thousands of users who use our platform daily to improve their
                                healthy lifestyle and reach their nutritional goals.
                            </p>
                        </div>
                    </div>


                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-12">

                        <div
                            class="bg-gradient-to-r from-orange-500 to-pink-500 rounded-3xl p-10 text-white shadow-2xl">
                            <h2 class="text-3xl font-bold mb-4">Our Mission</h2>
                            <p class="text-xl leading-relaxed">
                                Empower individuals to achieve a healthy lifestyle by providing smart meal planning
                                tools, discovering diverse recipes, and building a supportive community of healthy
                                cooking lovers.
                            </p>
                        </div>

                        <div
                            class="bg-gradient-to-r from-orange-500 to-pink-500 rounded-3xl p-10 text-white shadow-2xl">
                            <h2 class="text-3xl font-bold mb-4">Our Vision</h2>
                            <p class="text-xl leading-relaxed">
                                To become the leading platform in the Arab world for smart meal planning,
                                and the first source of inspiration for anyone seeking a balanced, healthy home-cooked
                                life.
                            </p>
                        </div>
                    </div>

                    <div class="bg-white rounded-3xl p-10 shadow-2xl mb-12">
                        <h2 class="text-4xl font-bold mb-8 text-center text-orange-600">Why Choose Smart Recipe Planner?
                        </h2>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                            <div class="text-center p-6 rounded-2xl hover:bg-orange-50 transition-all">
                                <div
                                    class="w-20 h-20 bg-gradient-to-r from-orange-500 to-pink-500 rounded-2xl flex items-center justify-center mx-auto mb-4 shadow-lg">
                                    <i class="fa-solid fa-microchip text-3xl text-white"></i>
                                    <span class="text-white text-xl ml-2">AI</span>

                                </div>
                                <h3 class="text-xl font-bold mb-2">Smart Recommendations</h3>
                                <p class="text-gray-600 text-sm">AI-powered system suggests recipes based on your
                                    available ingredients and health goals.</p>
                            </div>

                            <div class="text-center p-6 rounded-2xl hover:bg-green-50 transition-all">
                                <div
                                    class="w-20 h-20 bg-gradient-to-r from-orange-500 to-pink-500 rounded-2xl flex items-center justify-center mx-auto mb-4 shadow-lg">
                                    <i class="fas fa-calendar-alt text-white text-3xl"></i>
                                </div>
                                <h3 class="text-xl font-bold mb-2">Meal Planning</h3>
                                <p class="text-gray-600 text-sm">Plan your weekly meals smartly with automatic calorie
                                    and nutrition calculations.</p>
                            </div>

                            <div class="text-center p-6 rounded-2xl hover:bg-purple-50 transition-all">
                                <div
                                    class="w-20 h-20 bg-gradient-to-r from-orange-500 to-pink-500 rounded-2xl flex items-center justify-center mx-auto mb-4 shadow-lg">
                                    <i class="fas fa-users text-white text-3xl"></i>
                                </div>
                                <h3 class="text-xl font-bold mb-2">Active Community</h3>
                                <p class="text-gray-600 text-sm">Join a community of cooking enthusiasts, share recipes,
                                    and learn from others' experiences.</p>
                            </div>
                        </div>
                    </div>


                    <div
                        class="bg-gradient-to-r from-orange-500 to-pink-500 rounded-3xl p-12 text-white text-center shadow-2xl mb-12">
                        <h2 class="text-4xl font-bold mb-4">Have a Question?</h2>
                        <p class="text-xl mb-6">We’re here to help! Feel free to reach out anytime.</p>
                        <a href="mailto:info@smart-recipe.com"
                            class="bg-white text-orange-500 px-8 py-4 rounded-xl font-bold hover:bg-gray-100 transition-all">Contact
                            Us</a>
                    </div>

                </main>



            </body>

            </html>