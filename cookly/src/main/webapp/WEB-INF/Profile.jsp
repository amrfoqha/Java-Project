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

                <body class="mx-auto w-[100%] mx-auto">
                    <header class="bg-white shadow-lg sticky top-0 z-50 px-10">
                        <div class="flex justify-between px-6 py-5 items-center">
                            <!-- Logo + Title -->
                            <div class="flex items-center space-x-4">
                                <span
                                    class="inline-flex items-center justify-center w-12 h-12 bg-gradient-to-br from-orange-200 to-pink-200 text-orange-600 rounded-2xl shadow-sm">
                                    <!-- Chef Hat Icon -->
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-7 h-7" fill="none"
                                        viewBox="0 0 24 24" stroke="currentColor">
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
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M15 12H3m12-6l6 6-6 6" />
                                </svg>
                                <span><a href="/login"
                                        class="bg-orange-600 text-white text-sm font-medium py-2 px-4 rounded-lg shadow-md hover:bg-orange-700">Login
                                        / Register</a></span>
                            </button>
                        </div>

                        <!-- Nav -->
                        <nav class="hidden md:flex ml-8 mt-3 space-x-10 text-base font-semibold pb-4">

                            <a href="/"
                                class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
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
                                class="text-orange-600 border-b-2 border-orange-600 pb-1 flex items-center space-x-2">
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



                    <main class="container mx-auto px-4 py-8 max-w-7xl">
                        <!-- Profile Header -->
                        <div class="bg-gradient-to-r from-[#FF6900] to-[#F73698] rounded-3xl p-8 text-white mb-8">
                            <div class="flex items-center gap-6">
                                <div class="w-32 h-32 rounded-full overflow-hidden border-4 border-white shadow-2xl">
                                    <img src="https://scontent.fjrs2-2.fna.fbcdn.net/v/t39.30808-6/476830334_9124096434325901_976653848012665385_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=hfC-WlcWg7oQ7kNvwGw4K7R&_nc_oc=AdnbjQMaETVZ-GaKAnyVamYoYn-QPgwZUgm97DEwuPMF49o6VcSvE84_Yjrsc7qfqM8&_nc_zt=23&_nc_ht=scontent.fjrs2-2.fna&_nc_gid=hOG-MAGxhOAYSecdinAInw&oh=00_AfigRlQGTk6x-ZjFPghyUIHZZ-NiR97DolO_Nu46dEjEnA&oe=692DF4B8"
                                        alt="${user.name}" class="w-full h-full object-cover">
                                </div>
                                <div class="flex-1">
                                    <h1 class="text-4xl font-bold mb-2">${user.name}</h1>
                                    <div class="flex items-center gap-4 mb-4">

                                    </div>
                                    <div>
                                        <div class="flex items-center justify-between mb-2 text-bg text-white/90">
                                            <span>“Where taste meets tech.”</span>
                                            <span class="font-semibold">250 / 1000</span>
                                        </div>
                                        <div class="w-full bg-white/20 rounded-full h-3 overflow-hidden">
                                            <div class="bg-white h-full rounded-full transition-all duration-500"
                                                style="width: 25%"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Achievements -->
                        <div class=" flex justify-center gap-10 mb-8 w-[100%] mx-auto">
                            <div class="bg-white rounded-2xl p-6 shadow-lg w-1/4">
                                <div
                                    class="w-12 h-12 rounded-xl bg-blue-50 text-blue-500 flex items-center justify-center mb-3">
                                    <span class="text-2xl">📌</span>
                                </div>
                                <div class="text-3xl font-bold mb-1">${fn:length(user.favoritedRecipes)}</div>
                                <div class="text-gray-600 text-sm">Saved Recipes</div>
                            </div>
                            <div class="bg-white rounded-2xl p-6 shadow-lg w-1/4">
                                <div
                                    class="w-12 h-12 rounded-xl bg-orange-50 text-orange-500 flex items-center justify-center mb-3">
                                    <span class="text-2xl">🍴</span>
                                </div>
                                <div class="text-3xl font-bold mb-1">${fn:length(user.publishedRecipes)}</div>
                                <div class="text-gray-600 text-sm">My Recipes</div>
                            </div>
                            <div class="bg-white rounded-2xl p-6 shadow-lg w-1/4">
                                <div
                                    class="w-12 h-12 rounded-xl bg-purple-50 text-purple-500 flex items-center justify-center mb-3">
                                    <span class="text-2xl">🏅</span>
                                </div>
                                <div class="text-3xl font-bold mb-1">15</div>
                                <div class="text-gray-600 text-sm">favourite meal</div>
                            </div>

                        </div>



                        <main class="container mx-auto px-4 py-8 max-w-7xl">
                            <!-- Profile Header -->
                            <div
                                class="bg-gradient-to-br from-indigo-500 via-purple-500 to-pink-500 rounded-3xl p-8 text-white mb-8">
                                <div class="flex items-center gap-6">
                                    <div
                                        class="w-32 h-32 rounded-full overflow-hidden border-4 border-white shadow-2xl">
                                        <img src="https://scontent.fjrs2-2.fna.fbcdn.net/v/t39.30808-6/476830334_9124096434325901_976653848012665385_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=hfC-WlcWg7oQ7kNvwGw4K7R&_nc_oc=AdnbjQMaETVZ-GaKAnyVamYoYn-QPgwZUgm97DEwuPMF49o6VcSvE84_Yjrsc7qfqM8&_nc_zt=23&_nc_ht=scontent.fjrs2-2.fna&_nc_gid=hOG-MAGxhOAYSecdinAInw&oh=00_AfigRlQGTk6x-ZjFPghyUIHZZ-NiR97DolO_Nu46dEjEnA&oe=692DF4B8"
                                            alt="${user.name}" class="w-full h-full object-cover">
                                    </div>
                                    <div class="flex-1">
                                        <h1 class="text-4xl font-bold mb-2">${user.name}
                                        </h1>
                                        <div class="flex items-center gap-4 mb-4">
                                            <div
                                                class="flex items-center gap-2 bg-white/20 px-4 py-2 rounded-full backdrop-blur-sm">
                                                <span class="text-xl">🏆</span>
                                                <span class="font-semibold">Level 5</span>
                                            </div>
                                            <div
                                                class="flex items-center gap-2 bg-white/20 px-4 py-2 rounded-full backdrop-blur-sm">
                                                <span class="text-xl">⭐</span>
                                                <span class="font-semibold">1250 XP</span>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="flex items-center justify-between mb-2 text-sm text-white/90">
                                                <span>Progress to Next Level</span>
                                                <span class="font-semibold">250 /
                                                    1000</span>
                                            </div>
                                            <div class="w-full bg-white/20 rounded-full h-3 overflow-hidden">
                                                <div class="bg-white h-full rounded-full transition-all duration-500"
                                                    style="width: 25%">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Achievements -->
                            <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-8">
                                <div class="bg-white rounded-2xl p-6 shadow-lg">
                                    <div
                                        class="w-12 h-12 rounded-xl bg-blue-50 text-blue-500 flex items-center justify-center mb-3">
                                        <span class="text-2xl">📌</span>
                                    </div>
                                    <div class="text-3xl font-bold mb-1">
                                        ${fn:length(user.favoritedRecipes)}</div>
                                    <div class="text-gray-600 text-sm">Saved Recipes</div>
                                </div>
                                <div class="bg-white rounded-2xl p-6 shadow-lg">
                                    <div
                                        class="w-12 h-12 rounded-xl bg-orange-50 text-orange-500 flex items-center justify-center mb-3">
                                        <span class="text-2xl">🍴</span>
                                    </div>
                                    <div class="text-3xl font-bold mb-1">
                                        ${fn:length(user.publishedRecipes)}</div>
                                    <div class="text-gray-600 text-sm">My Recipes</div>
                                </div>
                                <div class="bg-white rounded-2xl p-6 shadow-lg">
                                    <div
                                        class="w-12 h-12 rounded-xl bg-purple-50 text-purple-500 flex items-center justify-center mb-3">
                                        <span class="text-2xl">📊</span>
                                    </div>
                                    <div class="text-3xl font-bold mb-1">15</div>
                                    <div class="text-gray-600 text-sm">Planned Meals</div>
                                </div>
                                <div class="bg-white rounded-2xl p-6 shadow-lg">
                                    <div
                                        class="w-12 h-12 rounded-xl bg-yellow-50 text-yellow-500 flex items-center justify-center mb-3">
                                        <span class="text-2xl">🏅</span>
                                    </div>


                                </div>
                            </div>

                            <!-- Saved Recipes -->
                            
                        </main>
                        <div class="bg-white rounded-2xl p-8 shadow-lg mb-8">
                            <h2 class="text-2xl font-bold mb-6">Saved Recipes</h2>
                            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                <c:forEach var="recipe" items="${user.favoritedRecipes}">
                                    <div
                                        class="flex gap-4 p-4 border-2 border-gray-200 rounded-xl hover:border-orange-500 hover:bg-orange-50 transition-all cursor-pointer">
                                        <img src="${recipe.image}" alt="${recipe.title}" class="w-20 h-20 rounded-lg object-cover">
                                        <div class="flex-1">
                                            <div class="font-bold mb-1 line-clamp-1">
                                                ${recipe.title}</div>
                                            <div class="text-sm text-gray-600 line-clamp-1">
                                                ${recipe.description}</div>
                                            <div class="flex items-center gap-2 mt-2">
                                                <span class="text-yellow-500 text-sm">⭐</span>
                                                <span class="text-sm font-semibold">${recipe.calories}
                                                    cal</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <!-- Footer -->
                        <footer class="bg-gray-100 mt-12 py-6 text-center">
                            <p class="text-gray-600">&copy; 2025 Smart Kitchen. All rights
                                reserved.</p>
                        </footer>

                </body>

                </html>