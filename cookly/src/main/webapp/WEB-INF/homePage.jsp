<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ page isErrorPage="true" %>
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
                            color: #ffc107; /* Yellow */
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
                <header class="bg-white shadow-sm sticky top-0 z-50 px-8">
                    <div class="flex justify-between px-6 py-4 items-center">
                        <div>
                            <h1 class="text-2xl font-bold text-gray-800">Smart Recipe Platform</h1>
                            <span class="text-xs text-gray-500 bg-gray-200 px-2 py-0.5 rounded">AI-Powered Recipe Discovery</span>
                        </div>
                        <button class="bg-orange-600 text-white text-sm font-medium py-2 px-4 rounded-lg shadow-md hover:bg-orange-700">Login / Register</button>
                    </div>


                    <nav class="hidden md:flex ml-6 mt-2 space-x-8 text-sm font-medium pb-3">
                        <a href="#" class="text-orange-600 border-b-2 border-orange-600 pb-1">Recipes</a>
                        <a href="#" class="text-gray-600 hover:text-orange-600 transition">Meal Planner</a>
                        <a href="#" class="text-gray-600 hover:text-orange-600 transition">Ingredient Matcher</a>
                    </nav>
                </header>

                <!-- Main Content Area -->
                <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">

                    <!-- 2. Section Header & Search/Filter -->
                    <section class="mb-8">
                        <h1 class="text-3xl font-extrabold text-gray-900 mb-2">Discover Recipes</h1>
                        <p class="text-gray-500 mb-6">Explore our collection of delicious recipes</p>

                        <div class="flex flex-col sm:flex-row space-y-4 sm:space-y-0 sm:space-x-4">
                            <!-- Search Input - REMOVED SVG and adjusted padding from pl-10 to pl-4 -->
                            <div class="relative flex-grow">
                                <input type="text" placeholder="Search recipe..." class="w-full pl-4 pr-4 py-3 border border-gray-300 rounded-xl focus:ring-primary-orange focus:border-primary-orange transition" aria-label="Search recipes">
                            </div>

                            <!-- Filters Button - REPLACED SVG with Emoji -->
                            <button class="flex items-center justify-center bg-white border border-gray-300 text-gray-700 py-3 px-6 rounded-xl shadow-sm hover:bg-gray-50 transition duration-150">
                                <span class="mr-2 text-lg">??</span>
                                Filters
                            </button>
                        </div>
                    </section>


                    <section class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">


                        <div class="bg-white shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                            <div class="relative">
                                <img src="https://via.placeholder.com/400x250" class="w-full h-48 object-cover" />
                                <span class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Easy</span>
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
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Breakfast</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Sweet</span>
                                </div>
                            </div>
                        </div>



                        <div class="bg-white shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                            <div class="relative">
                                <img src="https://via.placeholder.com/400x250" class="w-full h-48 object-cover" />
                                <span class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Medium</span>
                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Classic Italian Pasta Carbonara</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <span class="flex items-center gap-1"><span></span> 30m</span>
                                    <span class="flex items-center gap-1"><span></span> 650 cal</span>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                     4.8 <span class="text-gray-500 font-normal">(42)</span>
                                </div>


                                <div class="flex gap-2 mt-3">
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Italian</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Comfort Food</span>
                                </div>
                            </div>
                        </div>



                        <div class="bg-white shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                            <div class="relative">
                                <img src="https://via.placeholder.com/400x250" class="w-full h-48 object-cover" />
                                <span class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Easy</span>
                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Grilled Lemon Herb Chicken</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <span class="flex items-center gap-1"><span></span> 20m</span>
                                    <span class="flex items-center gap-1"><span></span> 280 cal</span>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                     4.7 <span class="text-gray-500 font-normal">(31)</span>
                                </div>


                                <div class="flex gap-2 mt-3">
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Healthy</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">High Protein</span>
                    </section>
                    <section class="mt-8 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">



                        <div class="bg-white shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                            <div class="relative">
                                <img src="https://via.placeholder.com/400x250" class="w-full h-48 object-cover" />
                                <span class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Easy</span>
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
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Breakfast</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Sweet</span>
                                </div>
                            </div>
                        </div>



                        <div class="bg-white shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                            <div class="relative">
                                <img src="https://via.placeholder.com/400x250" class="w-full h-48 object-cover" />
                                <span class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Medium</span>
                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Classic Italian Pasta Carbonara</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <span class="flex items-center gap-1"><span></span> 30m</span>
                                    <span class="flex items-center gap-1"><span></span> 650 cal</span>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    4.8 <span class="text-gray-500 font-normal">(42)</span>
                                </div>


                                <div class="flex gap-2 mt-3">
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Italian</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Comfort Food</span>
                                </div>
                            </div>
                        </div>



                        <div class="bg-white shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]">
                            <div class="relative">
                                <img src="https://via.placeholder.com/400x250" class="w-full h-48 object-cover" />
                                <span class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Easy</span>
                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Grilled Lemon Herb Chicken</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <span class="flex items-center gap-1"><span></span> 20m</span>
                                    <span class="flex items-center gap-1"><span></span> 280 cal</span>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    4.7 <span class="text-gray-500 font-normal">(31)</span>
                                </div>


                                <div class="flex gap-2 mt-3">
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Healthy</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">High Protein</span>
                    </section>



                </main>















                </body>

                </html>