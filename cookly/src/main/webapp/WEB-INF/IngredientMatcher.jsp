<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ page isErrorPage="true" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Document</title>
                    <script src="https://cdn.tailwindcss.com"></script>
                </head>

                <body class="mx-auto w-[100%] mx-auto">
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
                            <span>Login / Register</span>
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

                        <a href="/addRecipe" class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
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

                        <a href="/ingredientMatcher" class="text-orange-600 border-b-2 border-orange-600 pb-1 flex items-center space-x-2">
                            <!-- Search Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M21 21l-4.35-4.35M11 18a7 7 0 100-14 7 7 0 000 14z" />
                            </svg>
                            <span>Ingredient Matcher</span>
                        </a>
                    </nav>
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
                            <h1 class="text-white text-2xl font-light">Add the ingredients you have, and we'll
                                find recipes you can make!</h1>
                        </div>
                    </div>
                    <div class="w-[80%] h-48 rounded-2xl p-6 mx-auto pl-8 bg-gray-200 mt-10">
                        <h1 class="text-xl font-light">Your Ingredients</h1>
                        <div class="pr-10">
                            <form action="/ingredientMatcher" method="post"
                                class="flex items-center justify-between mt-2 ">
                                <input type="text" name="ingredient" placeholder="e.g., chicken, tomatoes, pasta..."
                                    class="w-4/5 p-2 rounded-lg h-12 pl-4">
                                <button type="submit"
                                    class="bg-[#FF6900] text-white p-2 rounded-lg  w-1/6 h-12 hover:bg-[#FF695f] text-2xl">Add</button>
                            </form>
                        </div>
                    </div>
                    <div class="w-[80%] mx-auto">
                        <h1 class=" text-xl font-normal mt-10 ml-10">Found 1 Recipe</h1>
                    </div>
                    <div class="flex gap-36 mx-auto mt-10 flex-wrap items-center justify-center w-[80%]">
                        <div
                            class="bg-white shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                            <div class="relative">
                                <img src="https://via.placeholder.com/400x250" class="w-full h-48 object-cover" />

                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Fluffy Blueberry Pancakes</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <span class="flex items-center gap-1"><span></span> 20m</span>
                                    <span class="flex items-center gap-1"><span></span> 340 cal</span>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    4.9 <span class="text-gray-500 font-normal">(56)</span>
                                </div>


                                <div class="flex gap-2 mt-3">
                                    <span
                                        class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Breakfast</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Sweet</span>
                                </div>
                            </div>
                        </div>
                        <div
                            class="bg-white shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                            <div class="relative">
                                <img src="https://via.placeholder.com/400x250" class="w-full h-48 object-cover" />
                                <span
                                    class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Easy</span>
                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Fluffy Blueberry Pancakes</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <span class="flex items-center gap-1"><span></span> 20m</span>
                                    <span class="flex items-center gap-1"><span></span> 340 cal</span>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    4.9 <span class="text-gray-500 font-normal">(56)</span>
                                </div>


                                <div class="flex gap-2 mt-3">
                                    <span
                                        class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Breakfast</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Sweet</span>
                                </div>
                            </div>
                        </div>
                        <div
                            class="bg-white shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                            <div class="relative">
                                <img src="https://via.placeholder.com/400x250" class="w-full h-48 object-cover" />
                                <span
                                    class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Easy</span>
                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Fluffy Blueberry Pancakes</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <span class="flex items-center gap-1"><span></span> 20m</span>
                                    <span class="flex items-center gap-1"><span></span> 340 cal</span>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    4.9 <span class="text-gray-500 font-normal">(56)</span>
                                </div>


                                <div class="flex gap-2 mt-3">
                                    <span
                                        class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Breakfast</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Sweet</span>
                                </div>
                            </div>
                        </div>
                        <div
                            class="bg-white shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                            <div class="relative">
                                <img src="https://via.placeholder.com/400x250" class="w-full h-48 object-cover" />
                                <span
                                    class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Easy</span>
                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Fluffy Blueberry Pancakes</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <span class="flex items-center gap-1"><span></span> 20m</span>
                                    <span class="flex items-center gap-1"><span></span> 340 cal</span>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    4.9 <span class="text-gray-500 font-normal">(56)</span>
                                </div>


                                <div class="flex gap-2 mt-3">
                                    <span
                                        class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Breakfast</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Sweet</span>
                                </div>
                            </div>
                        </div>
                        <div
                            class="bg-white shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                            <div class="relative">
                                <img src="https://via.placeholder.com/400x250" class="w-full h-48 object-cover" />
                                <span
                                    class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Easy</span>
                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Fluffy Blueberry Pancakes</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <span class="flex items-center gap-1"><span></span> 20m</span>
                                    <span class="flex items-center gap-1"><span></span> 340 cal</span>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    4.9 <span class="text-gray-500 font-normal">(56)</span>
                                </div>


                                <div class="flex gap-2 mt-3">
                                    <span
                                        class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Breakfast</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Sweet</span>
                                </div>
                            </div>
                        </div>
                        <div
                            class="bg-white shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                            <div class="relative">
                                <img src="https://via.placeholder.com/400x250" class="w-full h-48 object-cover" />
                                <span
                                    class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Easy</span>
                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Fluffy Blueberry Pancakes</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <span class="flex items-center gap-1"><span></span> 20m</span>
                                    <span class="flex items-center gap-1"><span></span> 340 cal</span>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    4.9 <span class="text-gray-500 font-normal">(56)</span>
                                </div>


                                <div class="flex gap-2 mt-3">
                                    <span
                                        class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Breakfast</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Sweet</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <footer class="bg-gray-100 mt-12 py-6 text-center">
                        <p class="text-gray-600">&copy; 2025 coockly. All rights reserved.</p>
                    </footer>
                </body>

                </html>