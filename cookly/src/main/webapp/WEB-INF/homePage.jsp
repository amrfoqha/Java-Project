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
                            @import url('https://fonts.googleapis.com/css2?family=Cairo:wght@400;600;700;900&display=swap');

                            * {
                                font-family: 'Cairo', sans-serif;
                            }

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
                        <script src="../js/search.js"></script>
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
                                        class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover mt-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor"
                                            fill="none">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M5.121 17.804A9 9 0 1118.88 17.804M12 7a4 4 0 100-8 4 4 0 000 8z" />
                                        </svg>
                                        <span>Profile</span>
                                    </a>

                                    <a href="/ingredientMatcher"
                                        class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover">
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
                                    <svg class="w-8 h-8 text-gray-500 hover:text-orange-500" fill="none"
                                        stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M13 16h-1v-4h-1m1-4h.01M12 20a8 8 0 100-16 8 8 0 000 16z" />
                                    </svg>
                                    <span>About Us</span>
                                </a>

                            </nav>
                            <div id="mobileMenu" class="hidden md:hidden px-4 pb-4 space-y-3 border-t border-gray-200">
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

                        </div>

                        <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 mb-16">


                            <section class="mb-8">
                                <h1 class="text-3xl font-extrabold text-gray-900 mb-2">Discover Recipes</h1>
                                <p class="text-gray-500 mb-6">Explore our collection of delicious recipes</p>

                                <div class="flex flex-col sm:flex-row space-y-4 sm:space-y-0 sm:space-x-4 pr-7">
                                    <div class="relative flex-grow">
                                        <input id="searchInput" type="text" placeholder="Search recipe..."
                                            class="w-full pl-4 pr-4 py-3 border border-gray-300 rounded-xl focus:ring-primary-orange focus:border-primary-orange transition"
                                            aria-label="Search recipes">
                                    </div>

                                    <button onclick="applyFilters()"
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
                                <div id="filters"
                                    class="hidden max-w-4xl mx-auto bg-white shadow-md rounded-xl p-6 mt-6">
                                    <form class="space-y-6" action="/filter" method="post">
                                        <input type="hidden" name="category" id="categoryInput">
                                        <div>
                                            <h3 class="font-medium text-gray-700 mb-2">Category</h3>
                                            <div class="flex flex-wrap gap-3">

                                                <button type="button" value="Main Dishes"
                                                    class="cat-btn px-4 py-2 rounded-full border border-gray-300 bg-gray-100 text-gray-700 hover:bg-gray-200 transition">
                                                    Main Dishes
                                                </button>

                                                <button type="button" value="Salads"
                                                    class="cat-btn px-4 py-2 rounded-full border border-gray-300 bg-gray-100 text-gray-700 hover:bg-gray-200 transition">
                                                    Salads
                                                </button>

                                                <button type="button" value="Dessert"
                                                    class="cat-btn px-4 py-2 rounded-full border border-gray-300 bg-gray-100 text-gray-700 hover:bg-gray-200 transition">
                                                    Dessert
                                                </button>

                                                <button type="button" value="Healthy Food"
                                                    class="cat-btn px-4 py-2 rounded-full border border-gray-300 bg-gray-100 text-gray-700 hover:bg-gray-200 transition">
                                                    Healthy Food
                                                </button>

                                                <button type="button" value="Vegan"
                                                    class="cat-btn px-4 py-2 rounded-full border border-gray-300 bg-gray-100 text-gray-700 hover:bg-gray-200 transition">
                                                    Vegan
                                                </button>

                                            </div>
                                        </div>


                                        <div class="flex items-center gap-3 mt-2">
                                            <label class="font-medium text-gray-700">Calories</label>
                                            <input type="range" name="calories" min="0" max="4500" step="50"
                                                id="calories" class="w-full accent-orange-500 cursor-pointer">
                                            <span id="caloriesLabel"
                                                class="px-3 py-1 bg-orange-100 text-orange-700 rounded-lg text-sm font-semibold">
                                                0
                                            </span>
                                        </div>

                                        <div class="pt-2">
                                            <button type="submit"
                                                class="w-full bg-orange-500 hover:bg-orange-600 text-white font-semibold py-2 rounded-xl shadow-md transition">
                                                Apply Filters
                                            </button>
                                        </div>

                                    </form>
                                </div>

                                <script>
                                    function applyFilters() {
                                        const filter = document.getElementById('filters');
                                        filter.classList.toggle('hidden');
                                    }
                                    document.querySelectorAll('.cat-btn').forEach(btn => {
                                        btn.addEventListener('click', function () {
                                            this.classList.toggle('bg-orange-500');
                                            this.classList.toggle('text-white');
                                            this.classList.toggle('border-orange-500');
                                            const hidden = document.getElementById('categoryInput');
                                            let selected = hidden.value ? hidden.value.split(',') : [];

                                            if (selected.includes(this.value)) {
                                                // remove it if already selected
                                                selected = selected.filter(c => c !== this.value);
                                            } else {
                                                // add if not selected
                                                selected.push(this.value);
                                            }

                                            hidden.value = selected.join(',');
                                        })
                                    });

                                    const calories = document.getElementById('calories');
                                    const caloriesLabel = document.getElementById('caloriesLabel');
                                    calories.addEventListener('input', () => caloriesLabel.textContent = calories.value);
                                </script>
                            </section>
                            <section id="result" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">

                                <c:forEach var="recipe" items="${recipes}">



                                    <a href="/recipeDetails/${recipe.id}"
                                        class="bg-white relative shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                                        <div>

                                            <img src="${recipe.image}" alt="${recipe.image}" loading="lazy"
                                                class="w-full h-48 object-cover hover:scale-110 ease-in-out duration-300" />

                                        </div>
                                        <div class="p-4">
                                            <h3 class="font-semibold text-lg mb-1">${recipe.title}</h3>
                                            <h3 class="font-light text-xs mb-1 text-gray-500">${recipe.description}
                                            </h3>


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


                                            <div
                                                class="flex items-center justify-between text-yellow-500 text-sm font-semibold mb-2 gap-1 w-1/5">
                                                <span>&#9733; <span
                                                        class="text-red-700">${recipe.averageRating}</span></span>
                                                <span
                                                    class="text-gray-500 font-normal">(${recipe.comments.size()})</span>
                                            </div>


                                            <div class="flex gap-2 pt-1">
                                                <c:forEach var="cate"
                                                    items="${fn:split(fn:replace(fn:replace(recipe.category, '[', ''), ']', ''), ',')}">
                                                    <span
                                                        class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">
                                                        ${fn:trim(fn:replace(cate, '"', ''))}
                                                    </span>
                                                </c:forEach>

                                            </div>
                                        </div>
                                    </a>
                                    </div>
                                </c:forEach>
                            </section>

                            <div class="flex justify-center mt-6 w-full mx-auto">
                                <nav aria-label="Page navigation ">
                                    <ul class="flex items-center gap-2">
                                        <li <c:if test="${currentPage == 0}">class="hidden"</c:if>>
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
                                        <li <c:if test="${currentPage == totalPages - 1 }">class="hidden"</c:if>>
                                            <a href="/?page=${currentPage+1}"
                                                class="flex items-center justify-center px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition duration-150">Next</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </main>
                        <footer class="bg-gray-100  py-6 text-center fixed bottom-0 w-full">
                            <p class="text-gray-600">&copy; 2025 coockly. All rights reserved.</p>
                        </footer>
                    </body>

                    </html>