<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ page isErrorPage="true" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                        </style>
                    </head>

                    <body>
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
                                    class="text-gray-600 hover:text-orange-600 transition">Ingredient
                                    Matcher</a>
                            </nav>
                        </header>
                        <div class="max-w-5xl mx-auto mt-10"><a href="/"
                                class="flex items-center gap-2 text-gray-600 hover:text-gray-900 mb-4"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="lucide lucide-arrow-left w-5 h-5" aria-hidden="true">
                                    <path d="m12 19-7-7 7-7"></path>
                                    <path d="M19 12H5"></path>
                                </svg>Back to recipes</a>
                            <div class="bg-white rounded-lg shadow-sm overflow-hidden">
                                <div class="relative h-96"><img src="${recipe.image}" alt="${recipe.title}"
                                        class="w-full h-full object-cover"></div>
                                <div class="p-6">
                                    <div class="flex items-start justify-between mb-4">
                                        <div class="flex-1">
                                            <h1 class="mb-2">${recipe.title}</h1>
                                            <div class="flex items-center gap-4 text-gray-600">
                                                <div class="flex items-center gap-1"><svg
                                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                        viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                        class="lucide lucide-star w-5 h-5 fill-yellow-400 text-yellow-400"
                                                        aria-hidden="true">
                                                        <path
                                                            d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z">
                                                        </path>
                                                    </svg><span>4.9</span><span class="text-sm">(56 reviews)</span>
                                                </div>
                                                <div class="flex items-center gap-1"><svg
                                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                        viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                        class="lucide lucide-clock w-5 h-5" aria-hidden="true">
                                                        <path d="M12 6v6l4 2"></path>
                                                        <circle cx="12" cy="12" r="10"></circle>
                                                    </svg><span>${recipe.cookingTime}</span></div>
                                                <div class="flex items-center gap-1"><svg
                                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                        viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                        class="lucide lucide-trending-up w-5 h-5" aria-hidden="true">
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
                                                    <li class="flex items-start gap-2"><span
                                                            class="text-orange-500 mt-1">•</span><span>${fn:trim(fn:replace(ingredient,
                                                            '"', ''))}</span>
                                                    </li>
                                                </ul>
                                            </c:forEach>
                                        </div>
                                        <div>
                                            <h2 class="mb-4">Instructions</h2>
                                            <ol class="space-y-3">
                                                <li class="flex gap-3"><span
                                                        class="flex-shrink-0 w-6 h-6 bg-orange-500 text-white rounded-full flex items-center justify-center text-sm">1</span><span
                                                        class="flex-1">Mix flour, baking powder, and sugar in a
                                                        bowl</span></li>
                                                <li class="flex gap-3"><span
                                                        class="flex-shrink-0 w-6 h-6 bg-orange-500 text-white rounded-full flex items-center justify-center text-sm">2</span><span
                                                        class="flex-1">Whisk eggs and milk together</span></li>
                                                <li class="flex gap-3"><span
                                                        class="flex-shrink-0 w-6 h-6 bg-orange-500 text-white rounded-full flex items-center justify-center text-sm">3</span><span
                                                        class="flex-1">Combine wet and dry ingredients until just
                                                        mixed</span></li>
                                                <li class="flex gap-3"><span
                                                        class="flex-shrink-0 w-6 h-6 bg-orange-500 text-white rounded-full flex items-center justify-center text-sm">4</span><span
                                                        class="flex-1">Gently fold in blueberries</span></li>
                                                <li class="flex gap-3"><span
                                                        class="flex-shrink-0 w-6 h-6 bg-orange-500 text-white rounded-full flex items-center justify-center text-sm">5</span><span
                                                        class="flex-1">Heat pan over medium heat and add butter</span>
                                                </li>
                                                <li class="flex gap-3"><span
                                                        class="flex-shrink-0 w-6 h-6 bg-orange-500 text-white rounded-full flex items-center justify-center text-sm">6</span><span
                                                        class="flex-1">Pour 1/4 cup batter per pancake</span></li>
                                                <li class="flex gap-3"><span
                                                        class="flex-shrink-0 w-6 h-6 bg-orange-500 text-white rounded-full flex items-center justify-center text-sm">7</span><span
                                                        class="flex-1">Cook until bubbles form, then flip and cook 2
                                                        more minutes</span></li>
                                            </ol>
                                        </div>
                                    </div>
                                    <div class="border-t pt-6">
                                        <div class="flex items-center justify-between mb-4">
                                            <h2>Reviews (1)</h2><button
                                                class="flex items-center gap-2 bg-orange-500 text-white px-4 py-2 rounded-lg hover:bg-orange-600 transition-colors"><svg
                                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                    class="lucide lucide-plus w-4 h-4" aria-hidden="true">
                                                    <path d="M5 12h14"></path>
                                                    <path d="M12 5v14"></path>
                                                </svg>Add Review</button>
                                        </div>
                                        <div class="space-y-4">
                                            <div class="bg-gray-50 p-4 rounded-lg">
                                                <div class="flex items-center justify-between mb-2">
                                                    <div class="flex items-center gap-3">
                                                        <div
                                                            class="w-10 h-10 bg-orange-200 rounded-full flex items-center justify-center">
                                                            B
                                                        </div>
                                                        <div>
                                                            <div>breakfastfan</div>
                                                            <div class="flex items-center gap-2">
                                                                <div class="flex"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="24"
                                                                        height="24" viewBox="0 0 24 24" fill="none"
                                                                        stroke="currentColor" stroke-width="2"
                                                                        stroke-linecap="round" stroke-linejoin="round"
                                                                        class="lucide lucide-star w-4 h-4 fill-yellow-400 text-yellow-400"
                                                                        aria-hidden="true">
                                                                        <path
                                                                            d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z">
                                                                        </path>
                                                                    </svg><svg xmlns="http://www.w3.org/2000/svg"
                                                                        width="24" height="24" viewBox="0 0 24 24"
                                                                        fill="none" stroke="currentColor"
                                                                        stroke-width="2" stroke-linecap="round"
                                                                        stroke-linejoin="round"
                                                                        class="lucide lucide-star w-4 h-4 fill-yellow-400 text-yellow-400"
                                                                        aria-hidden="true">
                                                                        <path
                                                                            d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z">
                                                                        </path>
                                                                    </svg><svg xmlns="http://www.w3.org/2000/svg"
                                                                        width="24" height="24" viewBox="0 0 24 24"
                                                                        fill="none" stroke="currentColor"
                                                                        stroke-width="2" stroke-linecap="round"
                                                                        stroke-linejoin="round"
                                                                        class="lucide lucide-star w-4 h-4 fill-yellow-400 text-yellow-400"
                                                                        aria-hidden="true">
                                                                        <path
                                                                            d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z">
                                                                        </path>
                                                                    </svg><svg xmlns="http://www.w3.org/2000/svg"
                                                                        width="24" height="24" viewBox="0 0 24 24"
                                                                        fill="none" stroke="currentColor"
                                                                        stroke-width="2" stroke-linecap="round"
                                                                        stroke-linejoin="round"
                                                                        class="lucide lucide-star w-4 h-4 fill-yellow-400 text-yellow-400"
                                                                        aria-hidden="true">
                                                                        <path
                                                                            d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z">
                                                                        </path>
                                                                    </svg><svg xmlns="http://www.w3.org/2000/svg"
                                                                        width="24" height="24" viewBox="0 0 24 24"
                                                                        fill="none" stroke="currentColor"
                                                                        stroke-width="2" stroke-linecap="round"
                                                                        stroke-linejoin="round"
                                                                        class="lucide lucide-star w-4 h-4 fill-yellow-400 text-yellow-400"
                                                                        aria-hidden="true">
                                                                        <path
                                                                            d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z">
                                                                        </path>
                                                                    </svg></div><span
                                                                    class="text-sm text-gray-500">11/23/2024</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <p class="text-gray-700">My kids absolutely love these pancakes! Sunday
                                                    morning favorite.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </body>

                    </html>