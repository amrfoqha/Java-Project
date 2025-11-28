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

                        <body>
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

                                <!-- Nav -->
                                <nav class="hidden md:flex ml-8 mt-3 space-x-10 text-base font-semibold pb-4">

                                    <a href="/"
                                        class="text-orange-600 border-b-2 border-orange-600 pb-1 flex items-center space-x-2">
                                        <!-- Recipe Icon -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none"
                                            viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M4 6h16M4 12h16M4 18h7" />
                                        </svg>
                                        <span>Recipes</span>
                                    </a>

                                    <a href="/marketList"
                                        class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
                                        <!-- Shopping Basket Icon -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none"
                                            viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M4 9h16l-1.5 9h-13L4 9zM7 9l3-6m4 6l3-6" />
                                        </svg>
                                        <span>Market List</span>
                                    </a>

                                    <a href="/addRecipe"
                                        class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
                                        <!-- Plus Icon -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none"
                                            viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M12 4v16m8-8H4" />
                                        </svg>
                                        <span>Add Recipe</span>
                                    </a>

                                    <a href="/profile/${loggedInUser.id}"
                                        class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
                                        <!-- User Icon -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none"
                                            viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M5.121 17.804A9 9 0 1118.88 17.804M12 7a4 4 0 100-8 4 4 0 000 8z" />
                                        </svg>
                                        <span>Profile</span>
                                    </a>

                                    <a href="/ingredientMatcher"
                                        class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
                                        <!-- Search Icon -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none"
                                            viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M21 21l-4.35-4.35M11 18a7 7 0 100-14 7 7 0 000 14z" />
                                        </svg>
                                        <span>Ingredient Matcher</span>
                                    </a>
                                </nav>
                            </header>
                            <div class="max-w-5xl mx-auto mt-10"><a href="/"
                                    class="flex items-center gap-2 text-gray-600 hover:text-gray-900 mb-4"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="lucide lucide-arrow-left w-5 h-5"
                                        aria-hidden="true">
                                        <path d="m12 19-7-7 7-7"></path>
                                        <path d="M19 12H5"></path>
                                    </svg>Back to recipes</a>
                                <div class="bg-white rounded-lg shadow-sm overflow-hidden">
                                    <div class="relative h-96">
                                        <button onclick="addToFavorites(this)" data-recipe-id="${recipe.id}"
                                            class="p-2 absolute top-3 right-3 z-10 rounded-full backdrop-blur-sm transition-all bg-white/90 text-gray-600  ">

                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                                viewBox="0 0 24 24" fill="red" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round"
                                                class="lucide lucide-bookmark" aria-hidden="true">
                                                <path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path>
                                            </svg>
                                        </button>
                                        <img src="${recipe.image}" alt="${recipe.title}"
                                            class="w-full h-full object-cover">
                                    </div>
                                    <div class="p-6">
                                        <div class="flex items-start justify-between mb-4">
                                            <div class="flex-1">
                                                <h1 class="mb-2">${recipe.title}</h1>
                                                <div class="flex items-center gap-4 text-gray-600">
                                                    <div class="flex items-center gap-1"><svg
                                                            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round"
                                                            class="lucide lucide-star w-5 h-5 fill-yellow-400 text-yellow-400"
                                                            aria-hidden="true">
                                                            <path
                                                                d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z">
                                                            </path>
                                                        </svg><span>${avarageRating}</span><span
                                                            class="text-sm">(${totalComments} reviews)</span>
                                                    </div>
                                                    <div class="flex items-center gap-1"><svg
                                                            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round" class="lucide lucide-clock w-5 h-5"
                                                            aria-hidden="true">
                                                            <path d="M12 6v6l4 2"></path>
                                                            <circle cx="12" cy="12" r="10"></circle>
                                                        </svg><span>${recipe.cookingTime}</span></div>
                                                    <div class="flex items-center gap-1"><svg
                                                            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round"
                                                            class="lucide lucide-trending-up w-5 h-5"
                                                            aria-hidden="true">
                                                            <path d="M16 7h6v6"></path>
                                                            <path d="m22 7-8.5 8.5-5-5L2 17"></path>
                                                        </svg><span>${recipe.calories} calories</span></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="flex gap-2 pt-1 mb-4">
                                            <c:forEach var="cate"
                                                items="${fn:split(fn:replace(fn:replace(recipe.category, '[', ''), ']', ''), ',')}">
                                                <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">
                                                    ${fn:trim(fn:replace(cate, '"', ''))}
                                                </span>
                                            </c:forEach>

                                        </div>
                                        <div class="grid md:grid-cols-2 gap-8 mb-8">
                                            <div>
                                                <h2 class="mb-4">Ingredients</h2>
                                                <c:forEach var="ingredient"
                                                    items="${fn:split(fn:replace(fn:replace(recipe.ingredients, '[', ''), ']', ''), ',')}">

                                                    <ul class="space-y-2">
                                                        <li class="flex items-center gap-2 mt-2"><span
                                                                class="text-orange-500">&#9830;</span><span>${fn:trim(fn:replace(ingredient,
                                                                '"', ''))}</span>
                                                        </li>
                                                    </ul>
                                                </c:forEach>
                                            </div>
                                            <div>
                                                <h2 class="mb-4">Instructions</h2>
                                                <ol class="space-y-3">
                                                    <c:forEach var="instruction"
                                                        items="${fn:split(fn:replace(fn:replace(recipe.steps, '[', ''), ']', ''), ',')}">
                                                        <li class="flex gap-3 items-center"><span
                                                                class="flex-shrink-0 w-4 h-4 bg-orange-500 text-white rounded-full flex items-center justify-center text-sm"></span><span
                                                                class="flex-1">${fn:trim(fn:replace(instruction, '"',
                                                                ''))}</span></li>
                                                    </c:forEach>
                                                </ol>
                                            </div>
                                        </div>
                                        <div class="border-t pt-6">
                                            <div class="flex items-center justify-between mb-4">
                                                <h2>Reviews (${totalComments})</h2>
                                                <div class="flex gap-10">


                                                    <button onclick="saveRecipe(this)" data-recipe-id="${recipe.id}"
                                                        id="addToMarket"
                                                        class="flex items-center gap-2 bg-orange-500 text-white px-4 py-2 rounded-lg hover:bg-orange-600 transition-colors"><svg
                                                            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round" class="lucide lucide-plus w-4 h-4"
                                                            aria-hidden="true">
                                                            <path d="M5 12h14"></path>
                                                            <path d="M12 5v14"></path>
                                                        </svg>Save Recipe</button>
                                                    <button onclick="showReviewForm()"
                                                        class="flex items-center gap-2 bg-orange-500 text-white px-4 py-2 rounded-lg hover:bg-orange-600 transition-colors"><svg
                                                            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round" class="lucide lucide-plus w-4 h-4"
                                                            aria-hidden="true">
                                                            <path d="M5 12h14"></path>
                                                            <path d="M12 5v14"></path>
                                                        </svg>Add Review</button>
                                                </div>

                                            </div>
                                            <form action="/recipe/${recipe.id}/review" method="post"
                                                class="bg-gray-50 p-4 rounded-lg mb-6 hidden" id="reviewForm">

                                                <div class="mb-4">
                                                    <label class="block text-sm mb-2">Rating</label>

                                                    <div id="starRating"
                                                        class="flex gap-1 text-gray-400 text-4xl cursor-pointer">
                                                        <span class="star " data-value="1">&#9733;</span>
                                                        <span class="star" data-value="2">&#9733;</span>
                                                        <span class="star" data-value="3">&#9733;</span>
                                                        <span class="star" data-value="4">&#9733;</span>
                                                        <span class="star" data-value="5">&#9733;</span>
                                                    </div>

                                                    <!-- This hidden input will store the selected rating -->
                                                    <input type="hidden" id="rating" name="rating" value="0">
                                                </div>


                                                <div class="mb-4">
                                                    <label class="block text-sm mb-2">Comment</label>
                                                    <textarea name="reviewText" class="w-full px-3 py-2 border border-gray-300 rounded-lg 
                                                      focus:outline-none focus:ring-2 focus:ring-orange-500" rows="3"
                                                        required></textarea>
                                                </div>

                                                <div class="flex gap-2">
                                                    <button type="submit"
                                                        class="bg-orange-500 text-white px-4 py-2 rounded-lg hover:bg-orange-600 transition-colors">
                                                        Submit Review
                                                    </button>
                                                    <button type="button" onclick="hideReviewForm()"
                                                        class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-300 transition-colors">
                                                        Cancel
                                                    </button>
                                                </div>
                                            </form>

                                            <div class="space-y-4">
                                                <c:forEach items="${comments}" var="comment">
                                                    <div class="bg-gray-50 p-4 rounded-lg">
                                                        <div class="flex items-center justify-between mb-2">
                                                            <div class="flex items-center gap-3">
                                                                <div
                                                                    class="w-10 h-10 bg-orange-200 rounded-full flex items-center justify-center">
                                                                    ${comment.pubUser.name.charAt(0)}
                                                                </div>


                                                                <div>
                                                                    <div>${comment.pubUser.name}</div>
                                                                    <div class="flex items-center gap-2">
                                                                        <div class="flex">
                                                                            <c:forEach begin="1" end="${comment.rate}"
                                                                                varStatus="status">
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
                                                                        <span class="text-sm text-black">
                                                                            <fmt:formatDate value="${comment.createdAt}"
                                                                                pattern="dd/MM/yyyy" />
                                                                        </span>

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
                            </div>
                            <footer class="bg-gray-100 mt-12 py-6 text-center">
                                <p class="text-gray-600">&copy; 2025 coockly. All rights reserved.</p>
                            </footer>

                        </body>

                        </html>