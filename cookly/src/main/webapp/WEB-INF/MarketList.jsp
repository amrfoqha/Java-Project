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

                <body class="w-[100%] h-screen mx-auto">
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

                        <a href="/" class="text-gray-700 hover:text-orange-600 transition flex items-center space-x-2">
                            <!-- Recipe Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M4 6h16M4 12h16M4 18h7" />
                            </svg>
                            <span>Recipes</span>
                        </a>

                        <a href="/marketList" class="text-orange-600 border-b-2 border-orange-600 pb-1 flex items-center space-x-2">
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
                    <div
                        class=" w-[80%] h-36 bg-gradient-to-br from-[#2485FF] via-[#00A4EC] to-[#2485FF] mx-auto mt-10 rounded-2xl p-8 text-white">
                        <div class="flex items-center justify-between">
                            <div>
                                <div class="flex items-center gap-3 mb-2"><svg xmlns="http://www.w3.org/2000/svg"
                                        width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        class="lucide lucide-shopping-cart" aria-hidden="true">
                                        <circle cx="8" cy="21" r="1"></circle>
                                        <circle cx="19" cy="21" r="1"></circle>
                                        <path
                                            d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12">
                                        </path>
                                    </svg>
                                    <h1 class="text-4xl">Smart Shopping List</h1>
                                </div>
                                <p class="text-xl text-white/90">Organize your purchases and calculate quantities
                                    automatically</p>
                            </div>
                            <div>
                                <button
                                    class="flex items-center gap-2 bg-white text-blue-600 px-6 py-3 rounded-xl hover:bg-gray-100 transition-all"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="lucide lucide-download" aria-hidden="true">
                                        <path d="M12 15V3"></path>
                                        <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                                        <path d="m7 10 5 5 5-5"></path>
                                    </svg><span>Export</span></button>
                            </div>
                        </div>
                    </div>
                    <div class="flex items-center justify-between w-[80%] mx-auto mt-10 text-3xl">
                        <div
                            class="flex flex-col items-start justify-start w-1/4 h-36 border border-gray-200 rounded-3xl p-4 shadow-xl">
                            <h1 class="font-light">Total Items</h1>
                            <h1 class="p-4 text-4xl ml-4">3</h1>
                        </div>
                        <div
                            class="flex flex-col items-start justify-start w-1/4 h-36 border border-gray-200 rounded-3xl p-4 shadow-xl">
                            <h1 class="font-light">Purchased</h1>
                            <h1 class="p-4 text-4xl ml-4">2</h1>
                        </div>
                        <div
                            class="flex flex-col items-start justify-start w-1/4 h-36 border border-gray-200 rounded-3xl p-4 shadow-xl">
                            <h1 class="font-light">Remaining</h1>
                            <h1 class="p-4 text-4xl ml-4">1</h1>
                        </div>
                    </div>
                    <div class="bg-white rounded-2xl p-6 shadow-xl w-[80%] mx-auto mt-10">
                        <div class="flex gap-4"><input type="text" placeholder="Add new item..."
                                class="flex-1 px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none"
                                value=""><button
                                class="flex items-center gap-2 bg-blue-500 text-white px-6 py-3 rounded-xl hover:bg-blue-600 transition-all"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="lucide lucide-plus" aria-hidden="true">
                                    <path d="M5 12h14"></path>
                                    <path d="M12 5v14"></path>
                                </svg><span>Add</span></button></div>
                    </div>
                    <div class="bg-white rounded-2xl p-6 shadow-lg w-[80%] mx-auto mt-10">
                        <h3 class="text-xl mb-4 text-gray-700">Ingredients</h3>
                        <div class="space-y-2">
                            <div
                                class="flex items-center gap-3 p-3 rounded-xl transition-all bg-gray-50 hover:bg-gray-100">
                                <button onclick="checkItem(this)"
                                    class="w-6 h-6 rounded-lg border-2 flex items-center justify-center transition-all border-gray-300 hover:border-green-500"></button><span
                                    class="flex-1 ">Eggs - 2 pieces</span><button onclick="deleteItem(this)"
                                    class="p-2 text-red-500 hover:bg-red-50 rounded-lg transition-all"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="lucide lucide-trash2 lucide-trash-2"
                                        aria-hidden="true">
                                        <path d="M10 11v6"></path>
                                        <path d="M14 11v6"></path>
                                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>
                                        <path d="M3 6h18"></path>
                                        <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                    </svg></button>
                            </div>
                            <div
                                class="flex items-center gap-3 p-3 rounded-xl transition-all bg-gray-50 hover:bg-gray-100">
                                <button onclick="checkItem(this)"
                                    class="w-6 h-6 rounded-lg border-2 flex items-center justify-center transition-all border-gray-300 hover:border-green-500"></button><span
                                    class="flex-1 ">tomatoes - 1</span><button onclick="deleteItem(this)"
                                    class="p-2 text-red-500 hover:bg-red-50 rounded-lg transition-all"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="lucide lucide-trash2 lucide-trash-2"
                                        aria-hidden="true">
                                        <path d="M10 11v6"></path>
                                        <path d="M14 11v6"></path>
                                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>
                                        <path d="M3 6h18"></path>
                                        <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                    </svg></button>
                            </div>
                            <div
                                class="flex items-center gap-3 p-3 rounded-xl transition-all bg-gray-50 hover:bg-gray-100">
                                <button onclick="checkItem(this)"
                                    class="w-6 h-6 rounded-lg border-2 flex items-center justify-center transition-all border-gray-300 hover:border-green-500">
                                </button><span class="flex-1 ">carrots - 1</span><button onclick="deleteItem(this)"
                                    class="p-2 text-red-500 hover:bg-red-50 rounded-lg transition-all"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="lucide lucide-trash2 lucide-trash-2"
                                        aria-hidden="true">
                                        <path d="M10 11v6"></path>
                                        <path d="M14 11v6"></path>
                                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>
                                        <path d="M3 6h18"></path>
                                        <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                    </svg></button>
                            </div>
                            <div
                                class="flex items-center gap-3 p-3 rounded-xl transition-all bg-gray-50 hover:bg-gray-100">
                                <button onclick="checkItem(this)"
                                    class="w-6 h-6 rounded-lg border-2 flex items-center justify-center transition-all border-gray-300 hover:border-green-500"></button><span
                                    class="flex-1 ">onions - 1</span><button onclick="deleteItem(this)"
                                    class="p-2 text-red-500 hover:bg-red-50 rounded-lg transition-all"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="lucide lucide-trash2 lucide-trash-2"
                                        aria-hidden="true">
                                        <path d="M10 11v6"></path>
                                        <path d="M14 11v6"></path>
                                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>
                                        <path d="M3 6h18"></path>
                                        <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                    </svg></button>
                            </div>
                            <div
                                class="flex items-center gap-3 p-3 rounded-xl transition-all bg-gray-50 hover:bg-gray-100">
                                <button onclick="checkItem(this)"
                                    class="w-6 h-6 rounded-lg border-2 flex items-center justify-center transition-all border-gray-300 hover:border-green-500"></button><span
                                    class="flex-1 ">garlic - 2 cloves</span><button
                                    class="p-2 text-red-500 hover:bg-red-50 rounded-lg transition-all"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="lucide lucide-trash2 lucide-trash-2"
                                        aria-hidden="true">
                                        <path d="M10 11v6"></path>
                                        <path d="M14 11v6"></path>
                                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path>
                                        <path d="M3 6h18"></path>
                                        <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                    </svg></button>
                            </div>
                        </div>
                    </div>

                    <script>
                        function checkItem(button) {
                            button.classList.toggle("bg-green-500");
                            button.classList.toggle("border-green-500");

                            if (button.classList.contains("bg-green-500")) {
                                button.innerHTML = `
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    class="h-4 w-4 text-white"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7" />
                                </svg>
                            `;
                            } else {
                                button.innerHTML = "";
                            }
                        }

                        function deleteItem(button) {
                            button.parentElement.remove();
                        }
                    </script>
                    <footer class="bg-gray-100 mt-12 py-6 text-center">
                        <p class="text-gray-600">&copy; 2025 coockly. All rights reserved.</p>
                    </footer>

                </body>

                </html>