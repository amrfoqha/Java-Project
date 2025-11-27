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

                    <header class="bg-white shadow-sm sticky top-0 z-50 px-8">
                        <div class="flex justify-between px-6 py-4 items-center">
                            <div>
                                <h1 class="text-2xl font-bold text-gray-800">Smart Recipe Platform</h1>
                                <span class="text-xs text-gray-500 bg-gray-200 px-2 py-0.5 rounded">AI-Powered
                                    Recipe
                                    Discovery</span>
                            </div>
                            <a href="/login"
                                class="bg-orange-600 text-white text-sm font-medium py-2 px-4 rounded-lg shadow-md hover:bg-orange-700">Login
                                / Register</a>
                        </div>



                        <nav class="hidden md:flex ml-6 mt-2 space-x-8 text-sm font-medium pb-3">
                            <a href="/" class="text-orange-600 border-b-2 border-orange-600 pb-1">Recipes</a>
                            <c:if test="${loggedInUser != null}">

                                <a href="/marketList" class="text-gray-600 hover:text-orange-600 transition">Market
                                    List</a>
                                <a href="/addRecipe" class="text-gray-600 hover:text-orange-600 transition">Add
                                    Recipe</a>
                                <a href="/profile" class="text-gray-600 hover:text-orange-600 transition">Profile</a>
                                <a href="/ingredientMatcher"
                                    class="text-gray-600 hover:text-orange-600 transition">Ingredient
                                    Matcher</a>
                            </c:if>
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