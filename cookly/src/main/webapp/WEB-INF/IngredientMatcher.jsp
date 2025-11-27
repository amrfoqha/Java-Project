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
                            <a href="/addRecipe" class="text-gray-600 hover:text-orange-600 transition">Add
                                Recipe</a>
                            <a href="/profile" class="text-gray-600 hover:text-orange-600 transition">Profile</a>
                            <a href="/ingredientMatcher"
                                class="text-orange-600 border-b-2 border-orange-600 pb-1">Ingredient
                                Matcher</a>
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
                </body>

                </html>