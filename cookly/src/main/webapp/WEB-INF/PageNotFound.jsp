<%-- Created by IntelliJ IDEA. User: chrisbsharah Date: 26/11/2025 Time: 1:56 pm To change this template use File |
    Settings | File Templates. --%>
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
                </head>

                <body class="bg-gradient-to-br from-orange-50 via-white to-green-50 min-h-screen"
                    style="background-image: url('https://img.freepik.com/free-vector/glitch-error-404-page-background_23-2148090410.jpg?semt=ais_hybrid&w=740&q=80');background-size:contain;">
                    <header class="bg-white shadow-lg sticky top-0 z-50 px-10">
                        <div class="flex justify-between px-6 py-5 items-center">
                            <div class="flex items-center  space-x-4">


                                <span
                                    class="inline-flex items-center justify-center w-14 h-14 bg-gradient-to-br from-orange-200 to-pink-200 text-orange-600 rounded-2xl shadow-sm">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8" fill="none"
                                        viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                            d="M12 6a4 4 0 00-8 0c0 1.657 1.343 3 3 3h10a3 3 0 100-6 4 4 0 00-8 0" />
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                            d="M5 12h14v6a2 2 0 01-2 2H7a2 2 0 01-2-2v-6z" />
                                    </svg>
                                </span>
                                <div class="flex flex-col justify-center space-y-1 ">
                                    <h1 class="text-3xl font-bold text-gray-900 tracking-tight">
                                        Smart Recipe Platform
                                    </h1>
                                    <span
                                        class="text-sm font-semibold bg-clip-text text-transparent bg-gradient-to-r from-orange-500 to-pink-500">
                                        AI-Powered Recipe Discovery
                                    </span>
                                </div>



                            </div>
                            <c:if test="${loggedInUser != null}">
                                <a href="/logout"
                                    class="bg-orange-600 text-white text-sm font-medium py-2 px-4 rounded-lg shadow-md hover:bg-orange-700">Logout</a>
                            </c:if>
                            <c:if test="${loggedInUser == null}">
                                <a href="/login"
                                    class="bg-orange-600 text-white text-sm font-medium py-2 px-4 rounded-lg shadow-md hover:bg-orange-700">Login
                                    / Register</a>
                            </c:if>
                        </div>



                        <nav class="hidden md:flex ml-8 mt-3 space-x-10 text-base font-semibold pb-4">

                            <a href="/"
                                class="text-orange-600 border-b-2 border-orange-600 pb-1 flex items-center space-x-2">
                                <!-- Recipe Icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M4 6h16M4 12h16M4 18h7" />
                                </svg>
                                <span>Recipes</span>
                            </a>

                            <a href="/marketList"
                                class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
                                <!-- Shopping Basket Icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M4 9h16l-1.5 9h-13L4 9zM7 9l3-6m4 6l3-6" />
                                </svg>
                                <span>Market List</span>
                            </a>

                            <a href="/addRecipe"
                                class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
                                <!-- Plus Icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M12 4v16m8-8H4" />
                                </svg>
                                <span>Add Recipe</span>
                            </a>

                            <a href="/profile/${loggedInUser.id}"
                                class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
                                <!-- User Icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M5.121 17.804A9 9 0 1118.88 17.804M12 7a4 4 0 100-8 4 4 0 000 8z" />
                                </svg>
                                <span>Profile</span>
                            </a>

                            <a href="/ingredientMatcher"
                                class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
                                <!-- Search Icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M21 21l-4.35-4.35M11 18a7 7 0 100-14 7 7 0 000 14z" />
                                </svg>
                                <span>Ingredient Matcher</span>
                            </a>
                        </nav>
                    </header>

                    <div class="flex flex-col justify-center items-center h-[calc(100vh-16rem)]">
                        <h1 class="text-4xl font-bold text-gray-800">Page Not Found 404</h1>
                        <p class="text-white mt-2 bg-gray-800 p-2 rounded">The page you are looking for might have been
                            removed, had its
                            name changed, or is temporarily unavailable.</p>
                        <a href="/"
                            class="bg-orange-600 text-white text-sm font-medium py-2 px-4 rounded-lg shadow-md hover:bg-orange-700 mt-4">Back
                            to Home</a>
                    </div>


                    <!-- Footer -->
                    <footer class="bg-gray-100 mt-12 py-6 text-center">
                        <p class="text-gray-600">&copy; 2025 Smart Kitchen. All rights reserved.</p>
                    </footer>

                </body>

                </html>