<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Profile - Smart Kitchen</title>
                <script src="https://cdn.tailwindcss.com"></script>

                <style>
                    @import url('https://fonts.googleapis.com/css2?family=Cairo:wght@400;600;700;900&display=swap');

                    * {
                        font-family: 'Cairo', sans-serif;
                    }
                </style>

                <script>
                    // Toggle mobile menu
                    function toggleMenu() {
                        document.getElementById("mobileMenu").classList.toggle("hidden");
                    }
                </script>
            </head>

            <body class="min-h-screen bg-gray-50">

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
                            <a href="/profile/${loggedInUser.id}" class="block text-gray-700">Profile</a>
                            <a href="/ingredientMatcher" class="block text-gray-700">Ingredient
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

                <!-- CONTENT -->
                <div class="flex flex-col items-center text-center px-6 py-20">
                    <h1 class="text-2xl sm:text-4xl font-bold text-gray-800">Page Not Found 404</h1>

                    <p class="text-sm sm:text-base text-white mt-4 bg-gray-800 py-2 px-3 rounded-lg max-w-md">
                        The page you are looking for might have been removed, had its name changed, or is temporarily
                        unavailable.
                    </p>

                    <a href="/"
                        class="mt-6 bg-orange-600 text-white text-sm sm:text-base font-semibold py-2 px-6 rounded-lg shadow hover:bg-orange-700 transition">
                        Back to Home
                    </a>
                </div>

                <!-- FOOTER -->
                <footer class="bg-gray-100 py-6 text-center mt-12 fixed bottom-0 w-full">
                    <p class="text-gray-600">&copy; 2025 Smart Kitchen. All rights reserved.</p>
                </footer>

            </body>

            </html>