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
                        <title>Smart Recipe Platform</title>
                        <!-- Load Tailwind CSS from CDN -->
                        <script src="https://cdn.tailwindcss.com"></script>
                        <style>
                            /* Custom styles for the rating stars and card shadow */
                            .star-filled {
                                color: #ffc107;
                                /* Yellow */
                            }

                            .card-shadow {
                                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
                                transition: transform 0.2s;
                            }

                            .card-shadow:hover {
                                transform: translateY(-4px);
                                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
                            }

                            /* Ensure the body uses Inter font, as per best practices */
                            body {
                                font-family: 'Inter', sans-serif;
                                background-color: #f8fafc;
                            }
                        </style>
                        <script>
                            tailwind.config = {
                                theme: {
                                    extend: {
                                        colors: {
                                            'primary-orange': '#f97316',
                                            'soft-gray': '#e5e7eb',
                                        }
                                    }
                                }
                            }
                        </script>
                    </head>

                    <body class="min-h-screen">

                        <!-- 1. Navigation Bar (Header) -->
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
            <span><a href="/login" class="bg-orange-600 text-white text-sm font-medium py-2 px-4 rounded-lg shadow-md hover:bg-orange-700">Login / Register</a></span>
        </button>
    </div>

    <!-- Nav -->
    <nav class="hidden md:flex ml-8 mt-3 space-x-10 text-base font-semibold pb-4">

        <a href="/" class="text-orange-600 border-b-2 border-orange-600 pb-1 flex items-center space-x-2">
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

        <a href="/ingredientMatcher" class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
            <!-- Search Icon -->
            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M21 21l-4.35-4.35M11 18a7 7 0 100-14 7 7 0 000 14z" />
            </svg>
            <span>Ingredient Matcher</span>
        </a>
    </nav>
</header>


                        <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">


                            <section class="mb-8">
                                <h1 class="text-3xl font-extrabold text-gray-900 mb-2">Discover Recipes</h1>
                                <p class="text-gray-500 mb-6">Explore our collection of delicious recipes</p>

                                <div class="flex flex-col sm:flex-row space-y-4 sm:space-y-0 sm:space-x-4">
                                    <!-- Search Input - REMOVED SVG and adjusted padding from pl-10 to pl-4 -->
                                    <div class="relative flex-grow">
                                        <input type="text" placeholder="Search recipe..."
                                            class="w-full pl-4 pr-4 py-3 border border-gray-300 rounded-xl focus:ring-primary-orange focus:border-primary-orange transition"
                                            aria-label="Search recipes">
                                    </div>

                                    <button
                                        class="flex items-center gap-2 px-4 py-2 rounded-lg border transition-colors border-gray-300 hover:bg-gray-50"><svg
                                            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round"
                                            class="lucide lucide-sliders-horizontal w-5 h-5" aria-hidden="true">
                                            <path d="M10 5H3"></path>
                                            <path d="M12 19H3"></path>
                                            <path d="M14 3v4"></path>
                                            <path d="M16 17v4"></path>
                                            <path d="M21 12h-9"></path>
                                            <path d="M21 19h-5"></path>
                                            <path d="M21 5h-7"></path>
                                            <path d="M8 10v4"></path>
                                            <path d="M8 12H3"></path>
                                        </svg>Filters</button>
                                </div>
                            </section>


                            <section class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">

                                <c:forEach var="recipe" items="${recipes}">

                                    <a href="/recipeDetails/${recipe.id}"
                                        class="bg-white relative shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                                        <div>
                                            <img src="${recipe.image}" alt="${recipe.image}" loading="lazy"
                                                class="w-full h-48 object-cover hover:scale-110 ease-in-out duration-300" />
                                            <button
                                                class="p-2 absolute top-3 right-3 rounded-full backdrop-blur-sm transition-all bg-white/90 text-gray-600 hover:bg-orange-500 hover:text-white"><svg
                                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                    class="lucide lucide-bookmark" aria-hidden="true">
                                                    <path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z">
                                                    </path>
                                                </svg></button>
                                        </div>
                                        <div class="p-4 ">
                                            <h3 class="font-semibold text-lg mb-1">${recipe.title}</h3>
                                            <h3 class="font-light text-xs mb-1 text-gray-500">${recipe.description}</h3>


                                            <div class="flex items-center text-sm text-gray-500 gap-4 mb-2 mt-3">
                                                <span class="flex items-center gap-1"><span><svg
                                                            xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round" class="lucide lucide-clock"
                                                            aria-hidden="true">
                                                            <path d="M12 6v6l4 2"></path>
                                                            <circle cx="12" cy="12" r="10"></circle>
                                                        </svg></span>
                                                    ${recipe.cookingTime}</span>
                                                <span class="flex items-center gap-1 text-red-500"><span>
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round" class="lucide lucide-flame"
                                                            aria-hidden="true">
                                                            <path
                                                                d="M12 3q1 4 4 6.5t3 5.5a1 1 0 0 1-14 0 5 5 0 0 1 1-3 1 1 0 0 0 5 0c0-2-1.5-3-1.5-5q0-2 2.5-4">
                                                            </path>
                                                        </svg>
                                                    </span>
                                                    ${recipe.calories}</span>
                                            </div>


                                            <%-- <div
                                                class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                                ${recipe.rating} <span
                                                    class="text-gray-500 font-normal">(${recipe.ratingCount})</span>
                                        </div> --%>


                                        <div class="flex gap-2 pt-1">
                                            <c:forEach var="cate"
                                                items="${fn:split(fn:replace(fn:replace(recipe.category, '[', ''), ']', ''), ',')}">
                                                <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">
                                                    ${fn:trim(fn:replace(cate, '"', ''))}
                                                </span>
                                            </c:forEach>

                                        </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </section>

                            <div class="flex justify-center mt-6 w-full mx-auto">
                                <nav aria-label="Page navigation ">
                                    <ul class="flex items-center gap-2">
                                        <li>
                                            <a href="/?page=${currentPage-1}"
                                                class="flex items-center justify-center px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition duration-150">Previous</a>
                                        </li>
                                        <li>
                                            <p
                                                class="flex items-center justify-center px-4 py-2 border border-gray-300 rounded-lg  transition duration-150">
                                                <span style="margin: 0 10px;">
                                                    Page ${currentPage + 1} of ${totalPages}
                                                </span>
                                            </p>
                                        </li>
                                        <li>
                                            <a href="/?page=${currentPage+1}"
                                                class="flex items-center justify-center px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition duration-150">Next</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </main>
                                                            <footer class="bg-gray-100 mt-12 py-6 text-center">
                                                            <p class="text-gray-600">&copy; 2025 coockly. All rights reserved.</p>
                                                            </footer>














                    </body>

                    </html>