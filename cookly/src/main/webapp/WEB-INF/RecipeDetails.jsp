<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ page isErrorPage="true" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                            <script src="../js/recipeDetails.js"></script>
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
                                        class="text-orange-600 border-b-2 border-orange-600 pb-1 flex items-center space-x-2 smooth-hover">
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
                                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6"
                                                stroke="currentColor" fill="none">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M4 9h16l-1.5 9h-13L4 9zM7 9l3-6m4 6l3-6" />
                                            </svg>
                                            <span>Market List</span>
                                        </a>



                                        <a href="/addRecipe"
                                            class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6"
                                                stroke="currentColor" fill="none">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M12 4v16m8-8H4" />
                                            </svg>
                                            <span>Add Recipe</span>
                                        </a>

                                        <a href="/profile/${loggedInUser.id}"
                                            class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover mt-2">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6"
                                                stroke="currentColor" fill="none">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M5.121 17.804A9 9 0 1118.88 17.804M12 7a4 4 0 100-8 4 4 0 000 8z" />
                                            </svg>
                                            <span>Profile</span>
                                        </a>

                                        <a href="/ingredientMatcher"
                                            class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6"
                                                stroke="currentColor" fill="none">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M21 21l-4.35-4.35M11 18a7 7 0 100-14 7 7 0 000 14z" />
                                            </svg>
                                            <span>Ingredient Matcher</span>
                                        </a>
                                    </c:if>

                                    <a href="/about"
                                        class="flex items-center space-x-1 text-gray-600 hover:text-orange-600 transition">
                                        <svg class="w-8 h-8 text-gray-500 hover:text-orange-500" fill="none"
                                            stroke="currentColor" viewBox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M13 16h-1v-4h-1m1-4h.01M12 20a8 8 0 100-16 8 8 0 000 16z" />
                                        </svg>
                                        <span>About Us</span>
                                    </a>

                                </nav>
                                <div id="mobileMenu"
                                    class="hidden md:hidden px-4 pb-4 space-y-3 border-t border-gray-200">
                                    <a href="/" class="block text-orange-600 font-semibold">Recipes</a>
                                    <c:if test="${not empty sessionScope.loggedInUser}">
                                        <a href="/marketList" class="block text-gray-700">Market List</a>
                                        <a href="/addRecipe" class="block text-gray-700">Add Recipe</a>
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

                            <main class="max-w-5xl mx-auto mt-10 px-4 md:px-0">

                                <!-- Back Button -->
                                <a href="/"
                                    class="flex items-center gap-2 text-gray-600 hover:text-gray-900 mb-4 text-sm md:text-base">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none"
                                        stroke="currentColor" stroke-width="2">
                                        <path d="m12 19-7-7 7-7"></path>
                                        <path d="M19 12H5"></path>
                                    </svg>
                                    Back to recipes
                                </a>

                                <div class="bg-white rounded-lg shadow-sm overflow-hidden">

                                    <!-- Image + Favorite -->
                                    <div class="relative h-60 sm:h-80 md:h-96">
                                        <c:if test="${loggedInUser != null}">
                                            <button onclick="addToFavorites(this)" data-recipe-id="${recipe.id}"
                                                class="p-2 absolute top-3 right-3 z-10 rounded-full backdrop-blur-sm bg-white/90 text-gray-600 shadow-sm">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" <c:if
                                                    test="${isFavorited}">fill="red"
                                        </c:if>
                                        <c:if test="${!isFavorited}">fill="none"</c:if>
                                        stroke="currentColor" stroke-width="2">
                                        <path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path>
                                        </svg>
                                        </button>
                                        </c:if>

                                        <img src="${recipe.image}" alt="${recipe.title}"
                                            class="w-full h-full object-cover">
                                    </div>

                                    <!-- Recipe Body -->
                                    <div class="p-4 sm:p-6">

                                        <!-- Title + Stats -->
                                        <div
                                            class="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-3 mb-4">
                                            <div class="flex-1">
                                                <h1 class="text-xl sm:text-2xl font-bold mb-2">${recipe.title}</h1>

                                                <div
                                                    class="flex flex-wrap items-center gap-4 text-gray-600 text-sm sm:text-base">

                                                    <!-- Rating -->
                                                    <div class="flex items-center gap-1">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round"
                                                            class="lucide lucide-star w-5 h-5 fill-yellow-400 text-yellow-400"
                                                            aria-hidden="true">
                                                            <path
                                                                d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z">
                                                            </path>
                                                        </svg>
                                                        <span>${avarageRating}</span>
                                                        <span class="text-sm">(${totalComments} reviews)</span>
                                                    </div>

                                                    <!-- Cooking Time -->
                                                    <div class="flex items-center gap-1">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round" class="lucide lucide-clock w-5 h-5"
                                                            aria-hidden="true">
                                                            <path d="M12 6v6l4 2"></path>
                                                            <circle cx="12" cy="12" r="10"></circle>
                                                        </svg>
                                                        <span>${recipe.cookingTime}</span>
                                                    </div>

                                                    <!-- Calories -->
                                                    <div class="flex items-center gap-1">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round"
                                                            class="lucide lucide-trending-up w-5 h-5"
                                                            aria-hidden="true">
                                                            <path d="M16 7h6v6"></path>
                                                            <path d="m22 7-8.5 8.5-5-5L2 17"></path>
                                                        </svg>
                                                        <span>${recipe.calories} calories</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Categories -->
                                        <div class="flex flex-wrap gap-2 mb-4">
                                            <c:forEach var="cate"
                                                items="${fn:split(fn:replace(fn:replace(recipe.category, '[', ''), ']', ''), ',')}">
                                                <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">
                                                    ${fn:trim(fn:replace(cate, '"', ''))}
                                                </span>
                                            </c:forEach>
                                        </div>

                                        <!-- Ingredients + Instructions -->
                                        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-8">

                                            <!-- Ingredients -->
                                            <div>
                                                <h2 class="text-lg font-semibold mb-4">Ingredients</h2>
                                                <ul class="space-y-2">
                                                    <c:forEach var="ingredient"
                                                        items="${fn:split(fn:replace(fn:replace(recipe.ingredients, '[', ''), ']', ''), ',')}">
                                                        <li class="flex items-center gap-2">
                                                            <span class="text-orange-500">&#9830;</span>
                                                            <span>${fn:trim(fn:replace(ingredient, '"', ''))}</span>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>

                                            <!-- Instructions -->
                                            <div>
                                                <h2 class="text-lg font-semibold mb-4">Instructions</h2>
                                                <ol class="space-y-3">
                                                    <c:forEach var="instruction"
                                                        items="${fn:split(fn:replace(fn:replace(recipe.steps, '[', ''), ']', ''), ',')}">
                                                        <li class="flex gap-3 items-center">
                                                            <span
                                                                class="w-4 h-4 bg-orange-500 text-white rounded-full flex items-center justify-center text-xs"></span>
                                                            <span class="flex-1">${fn:trim(fn:replace(instruction, '"',
                                                                ''))}</span>
                                                        </li>
                                                    </c:forEach>
                                                </ol>
                                            </div>

                                        </div>

                                        <!-- Reviews Section -->
                                        <div class="border-t pt-6">
                                            <div
                                                class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-4">

                                                <h2 class="text-lg font-semibold">Reviews (${totalComments})</h2>

                                                <!-- Buttons -->
                                                <c:if test="${loggedInUser != null}">
                                                    <div class="flex flex-wrap gap-3">
                                                        <button onclick="saveRecipe(this)" data-recipe-id="${recipe.id}"
                                                            id="addToMarket"
                                                            class="flex items-center gap-2 bg-orange-500 text-white px-4 py-2 rounded-lg hover:bg-orange-600 transition">
                                                            Save Recipe
                                                        </button>

                                                        <button onclick="showReviewForm()"
                                                            class="flex items-center gap-2 bg-orange-500 text-white px-4 py-2 rounded-lg hover:bg-orange-600 transition">
                                                            Add Review
                                                        </button>
                                                    </div>
                                                </c:if>
                                            </div>

                                            <!-- Add Review Form -->
                                            <form action="/recipe/${recipe.id}/review" method="post"
                                                class="bg-gray-50 p-4 rounded-lg mb-6 hidden" id="reviewForm">

                                                <div class="mb-4">
                                                    <label class="block text-sm mb-2">Rating</label>
                                                    <div id="starRating"
                                                        class="flex gap-1 text-gray-400 text-4xl cursor-pointer">
                                                        <span class="star" data-value="1">&#9733;</span>
                                                        <span class="star" data-value="2">&#9733;</span>
                                                        <span class="star" data-value="3">&#9733;</span>
                                                        <span class="star" data-value="4">&#9733;</span>
                                                        <span class="star" data-value="5">&#9733;</span>
                                                    </div>
                                                    <input type="hidden" id="rating" name="rating" value="0">
                                                </div>

                                                <div class="mb-4">
                                                    <label class="block text-sm mb-2">Comment</label>
                                                    <textarea name="reviewText"
                                                        class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500"
                                                        rows="3" required></textarea>
                                                </div>

                                                <div class="flex gap-2">
                                                    <button type="submit"
                                                        class="bg-orange-500 text-white px-4 py-2 rounded-lg hover:bg-orange-600 transition">
                                                        Submit Review
                                                    </button>
                                                    <button type="button" onclick="hideReviewForm()"
                                                        class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-300 transition">
                                                        Cancel
                                                    </button>
                                                </div>
                                            </form>

                                            <!-- All Reviews -->
                                            <div class="space-y-4">
                                                <c:forEach items="${comments}" var="comment">
                                                    <div class="bg-gray-50 p-4 rounded-lg">
                                                        <div class="flex items-start justify-between mb-2">

                                                            <div class="flex items-center gap-3">
                                                                <div
                                                                    class="w-10 h-10 bg-orange-200 rounded-full flex items-center justify-center">
                                                                    ${comment.pubUser.name.charAt(0)}
                                                                </div>

                                                                <div>
                                                                    <div class="font-semibold">${comment.pubUser.name}
                                                                    </div>

                                                                    <div class="flex items-center gap-2">
                                                                        <div class="flex">
                                                                            <c:forEach begin="1" end="${comment.rate}">
                                                                                <svg xmlns="http://www.w3.org/2000/svg"
                                                                                    width="24" height="24"
                                                                                    viewBox="0 0 24 24" fill="none"
                                                                                    stroke="currentColor"
                                                                                    stroke-width="2"
                                                                                    stroke-linecap="round"
                                                                                    stroke-linejoin="round"
                                                                                    class="lucide lucide-star w-4 h-4 fill-yellow-400 text-yellow-400"
                                                                                    aria-hidden="true">
                                                                                    <path
                                                                                        d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z">
                                                                                    </path>
                                                                                </svg>
                                                                            </c:forEach>
                                                                        </div>

                                                                        <span class="text-sm">
                                                                            <fmt:formatDate value="${comment.createdAt}"
                                                                                pattern="dd/MM/yyyy" />
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <p class="text-gray-700">${comment.comment}</p>
                                                    </div>
                                                </c:forEach>
                                            </div>

                                        </div>

                                    </div>
                                </div>

                            </main>

                            <footer class="bg-gray-100 mt-12 py-6 text-center">
                                <p class="text-gray-600">&copy; 2025 coockly. All rights reserved.</p>
                            </footer>

                        </body>

                        </html>