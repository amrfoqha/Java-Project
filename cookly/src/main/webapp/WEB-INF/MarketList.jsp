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
                            <a href="/marketList" class="text-orange-600 border-b-2 border-orange-600 pb-1">Market
                                List</a>
                            <a href="/addRecipe" class="text-gray-600 hover:text-orange-600 transition">Add
                                Recipe</a>
                            <a href="/profile" class="text-gray-600 hover:text-orange-600 transition">Profile</a>
                            <a href="/ingredientMatcher"
                                class="text-gray-600 hover:text-orange-600 transition">Ingredient
                                Matcher</a>
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

                </body>

                </html>