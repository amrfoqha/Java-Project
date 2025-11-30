<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Smart Shopping List</title>
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
        </head>

        <body class="min-h-screen">

            <!-- Header -->
            <header class="bg-white shadow-lg sticky top-0 z-50 px-10 smooth-hover">
                <div class="flex justify-between px-6 py-5 items-center">
                    <div class="flex items-center space-x-4 smooth-hover">
                        <span
                            class="inline-flex items-center justify-center w-12 h-12 bg-gradient-to-br from-orange-300 to-pink-300 text-orange-700 rounded-2xl shadow-md">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-7 h-7" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor">
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
                        <button id="hamburgerBtn" class="text-gray-700 focus:outline-none" onclick="toggleMobileMenu()">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor">
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

                    <a href="/" class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor" fill="none">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M4 6h16M4 12h16M4 18h7" />
                        </svg>
                        <span>Recipes</span>
                    </a>
                    <c:if test="${not empty sessionScope.loggedInUser}">
                        <a href="/marketList"
                            class="text-orange-600 border-b-2 border-orange-600 pb-1 flex items-center space-x-2 smooth-hover">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor" fill="none">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M4 9h16l-1.5 9h-13L4 9zM7 9l3-6m4 6l3-6" />
                            </svg>
                            <span>Market List</span>
                        </a>



                        <a href="/addRecipe"
                            class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor" fill="none">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 4v16m8-8H4" />
                            </svg>
                            <span>Add Recipe</span>
                        </a>

                        <a href="/profile/${loggedInUser.id}"
                            class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover mt-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor" fill="none">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M5.121 17.804A9 9 0 1118.88 17.804M12 7a4 4 0 100-8 4 4 0 000 8z" />
                            </svg>
                            <span>Profile</span>
                        </a>

                        <a href="/ingredientMatcher"
                            class="text-gray-700 hover:text-orange-600 flex items-center space-x-2 smooth-hover">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" stroke="currentColor" fill="none">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M21 21l-4.35-4.35M11 18a7 7 0 100-14 7 7 0 000 14z" />
                            </svg>
                            <span>Ingredient Matcher</span>
                        </a>
                    </c:if>

                    <a href="/about" class="flex items-center space-x-1 text-gray-600 hover:text-orange-600 transition">
                        <svg class="w-8 h-8 text-gray-500 hover:text-orange-500" fill="none" stroke="currentColor"
                            viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M13 16h-1v-4h-1m1-4h.01M12 20a8 8 0 100-16 8 8 0 000 16z" />
                        </svg>
                        <span>About Us</span>
                    </a>

                </nav>
                <div id="mobileMenu" class="hidden md:hidden px-4 pb-4 space-y-3 border-t border-gray-200">
                    <a href="/" class="block text-gray-700">Recipes</a>
                    <c:if test="${not empty sessionScope.loggedInUser}">
                        <a href="/marketList" class="block text-orange-600 font-semibold">Market List</a>
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

            <!-- Main Card -->
            <div
                class="w-11/12 sm:w-4/5 lg:w-3/4 mx-auto mt-10 bg-gradient-to-br from-[#2485FF] via-[#00A4EC] to-[#2485FF] rounded-2xl p-6 text-white flex flex-col sm:flex-row justify-between items-center gap-4">
                <div>
                    <div class="flex items-center gap-3 mb-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                            class="lucide lucide-shopping-cart" aria-hidden="true">
                            <circle cx="8" cy="21" r="1"></circle>
                            <circle cx="19" cy="21" r="1"></circle>
                            <path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12">
                            </path>
                        </svg>
                        <h1 class="text-3xl sm:text-4xl font-bold">Smart Shopping List</h1>
                    </div>
                    <p class="text-lg sm:text-xl text-white/90">Organize your purchases and calculate quantities
                        automatically</p>
                </div>
                <div>
                    <a href="/downloadText"
                        class="flex items-center gap-2 bg-white text-blue-600 px-6 py-3 rounded-xl hover:bg-gray-100 transition-all">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                            class="lucide lucide-download" aria-hidden="true">
                            <path d="M12 15V3"></path>
                            <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                            <path d="m7 10 5 5 5-5"></path>
                        </svg>
                        <span>Export</span>
                    </a>
                </div>
            </div>

            <!-- Stats Cards -->
            <div class="flex flex-col sm:flex-row justify-between gap-4 w-11/12 sm:w-4/5 lg:w-3/4 mx-auto mt-10">
                <div class="flex-1 flex flex-col p-4 border border-gray-200 rounded-3xl shadow-xl">
                    <h2 class="font-light">Total Items</h2>
                    <span class="text-4xl mt-4">${empty marketList ? 0 : marketList.size()}</span>
                </div>
                <div class="flex-1 flex flex-col p-4 border border-gray-200 rounded-3xl shadow-xl">
                    <h2 class="font-light">Purchased</h2>
                    <span class="text-4xl mt-4" id="purchasedCount">0</span>
                </div>
                <div class="flex-1 flex flex-col p-4 border border-gray-200 rounded-3xl shadow-xl">
                    <h2 class="font-light">Remaining</h2>
                    <span class="text-4xl mt-4" id="remainingCount">0</span>
                </div>
            </div>

            <!-- Add Item Form -->
            <div class="w-11/12 sm:w-4/5 lg:w-3/4 mx-auto mt-10 bg-white p-6 rounded-2xl shadow-xl">
                <form action="/addIngredient" method="get" class="flex flex-col sm:flex-row gap-4">
                    <input type="text" name="ingredient" placeholder="Add new item..."
                        class="flex-1 px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none">
                    <button type="submit"
                        class="flex items-center gap-2 bg-blue-500 text-white px-6 py-3 rounded-xl hover:bg-blue-600 transition-all">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                            class="lucide lucide-plus" aria-hidden="true">
                            <path d="M5 12h14"></path>
                            <path d="M12 5v14"></path>
                        </svg>
                        <span>Add</span>
                    </button>
                </form>
            </div>

            <!-- Ingredients List -->
            <div class="w-11/12 sm:w-4/5 lg:w-3/4 mx-auto mt-10 bg-white p-6 rounded-2xl shadow-lg">
                <h3 class="text-xl mb-4 text-gray-700">Ingredients</h3>
                <div class="space-y-2">
                    <c:forEach items="${marketList}" var="ingredient">
                        <div class="flex items-center gap-3 p-3 rounded-xl bg-gray-50 hover:bg-gray-100 transition-all">
                            <button onclick="checkItem(this)"
                                class="w-6 h-6 rounded-lg border-2 flex items-center justify-center border-gray-300 hover:border-green-500"></button>
                            <span class="flex-1">${ingredient}</span>
                            <button onclick="deleteItem(this, '${ingredient}')"
                                class="p-2 text-red-500 hover:bg-red-50 rounded-lg transition-all">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="lucide lucide-trash-2" aria-hidden="true">
                                    <path d="M10 11v6"></path>
                                    <path d="M14 11v6"></path>
                                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>
                                    <path d="M3 6h18"></path>
                                    <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                </svg>
                            </button>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <script>
                function checkItem(button) {
                    button.classList.toggle("bg-green-500");
                    button.classList.toggle("border-green-500");
                    if (button.classList.contains("bg-green-500")) {
                        button.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7" /></svg>`;
                    } else {
                        button.innerHTML = "";
                    }
                    updatePurchasedRemaining();
                }

                function deleteItem(button, ingredient) {
                    button.parentElement.remove();
                    fetch("/deleteIngredient?ingredient=" + encodeURIComponent(ingredient), { method: "DELETE" })
                        .then(response => response.ok && updatePurchasedRemaining())
                        .catch(error => console.error('Error deleting ingredient:', error));
                }

                function updatePurchasedRemaining() {
                    const totalItems = document.querySelectorAll('.space-y-2 > div').length;
                    const purchasedItems = document.querySelectorAll('.space-y-2 .bg-green-500').length;
                    document.getElementById('purchasedCount').textContent = purchasedItems;
                    document.getElementById('remainingCount').textContent = totalItems - purchasedItems;
                }

                updatePurchasedRemaining();
            </script>

            <!-- Footer -->
            <footer class="bg-gray-100 mt-12 py-6 text-center">
                <p class="text-gray-600">&copy; 2025 coockly. All rights reserved.</p>
            </footer>
        </body>

        </html>