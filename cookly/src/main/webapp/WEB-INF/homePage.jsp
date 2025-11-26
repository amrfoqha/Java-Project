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
                            <div class="flex items-center" >

                                <div class="bg-red-700 mr-2 rounded">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                     fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                     class="lucide lucide-chef-hat w-10 h-10 text-white" aria-hidden="true">
                                    <path d="M17 21a1 1 0 0 0 1-1v-5.35c0-.457.316-.844.727-1.041a4 4 0 0 0-2.134-7.589 5 5 0 0 0-9.186 0 4 4 0 0 0-2.134 7.588c.411.198.727.585.727 1.041V20a1 1 0 0 0 1 1Z"></path>
                                    <path d="M6 17h12"></path></svg>
                                </div>
                                    <h1 class="text-2xl font-bold text-gray-800">Smart Recipe Platform</h1>
                            </div>
                            <span class="text-xs text-gray-500 bg-gray-200 px-2 py-0.5 rounded ">AI-Powered Recipe Discovery</span>
                        </div>
                        <button class="bg-orange-600 text-white text-sm font-medium py-2 px-4 rounded-lg shadow-md hover:bg-orange-700">Login / Register</button>
                    </div>


                    <nav class="hidden md:flex ml-6 mt-2 space-x-8 text-sm font-medium pb-3">
                        <div class="flex items-center">
                            <div class="mr-2 mb-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                     stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-house w-5 h-5" aria-hidden="true"><path d="M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8"></path>
                                    <path d="M3 10a2 2 0 0 1 .709-1.528l7-6a2 2 0 0 1 2.582 0l7 6A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                </svg>
                            </div>
                            <a href="#" class="text-orange-600 border-b-2 border-orange-600 pb-1">Recipes</a>
                        </div>
                        <div class="flex items-center">
                            <div class="mr-2 mb-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-house w-5 h-5" aria-hidden="true">
                                    <path d="M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8"></path>
                                    <path d="M3 10a2 2 0 0 1 .709-1.528l7-6a2 2 0 0 1 2.582 0l7 6A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                </svg>

                            </div>
                            <a href="#" class="text-gray-600 hover:text-orange-600 transition">Meal Planner</a>
                        </div>
                        <div class="flex items-center">
                            <div class="mr-2 mb-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search w-5 h-5" aria-hidden="true">
                                    <path d="m21 21-4.34-4.34"></path><circle cx="11" cy="11" r="8"></circle>
                                </svg>
                            </div>
                            <a href="#" class="text-gray-600 hover:text-orange-600 transition">Ingredient Matcher</a>
                        </div>



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
                                    <div class="flex items-center">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                 stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clock w-5 h-5" aria-hidden="true">
                                                <path d="M12 6v6l4 2"></path><circle cx="12" cy="12" r="10"></circle>
                                            </svg>
                                        </div>
                                        <span class="flex items-center gap-1"><span></span> 20m</span>
                                    </div>
                                    <div class="flex items-center">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                 stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trending-up w-5 h-5" aria-hidden="true">
                                                <path d="M16 7h6v6"></path><path d="m22 7-8.5 8.5-5-5L2 17"></path>
                                            </svg>
                                        </div>
                                        <span class="flex items-center gap-1"><span></span> 340 cal</span>
                                    </div>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    <div class="flex items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                             stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star w-5 h-5 fill-yellow-400 text-yellow-400" aria-hidden="true">
                                            <path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z"></path>
                                        </svg>
                                    </div>
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
                                <span class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Easy</span>
                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Fluffy Blueberry Pancakes</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <div class="flex items-center">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                 stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clock w-5 h-5" aria-hidden="true">
                                                <path d="M12 6v6l4 2"></path><circle cx="12" cy="12" r="10"></circle>
                                            </svg>
                                        </div>
                                        <span class="flex items-center gap-1"><span></span> 20m</span>
                                    </div>
                                    <div class="flex items-center">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                 stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trending-up w-5 h-5" aria-hidden="true">
                                                <path d="M16 7h6v6"></path><path d="m22 7-8.5 8.5-5-5L2 17"></path>
                                            </svg>
                                        </div>
                                        <span class="flex items-center gap-1"><span></span> 340 cal</span>
                                    </div>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    <div class="flex items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                             stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star w-5 h-5 fill-yellow-400 text-yellow-400" aria-hidden="true">
                                            <path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z"></path>
                                        </svg>
                                    </div>
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
                                <span class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Easy</span>
                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Fluffy Blueberry Pancakes</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <div class="flex items-center">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                 stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clock w-5 h-5" aria-hidden="true">
                                                <path d="M12 6v6l4 2"></path><circle cx="12" cy="12" r="10"></circle>
                                            </svg>
                                        </div>
                                        <span class="flex items-center gap-1"><span></span> 20m</span>
                                    </div>
                                    <div class="flex items-center">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                 stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trending-up w-5 h-5" aria-hidden="true">
                                                <path d="M16 7h6v6"></path><path d="m22 7-8.5 8.5-5-5L2 17"></path>
                                            </svg>
                                        </div>
                                        <span class="flex items-center gap-1"><span></span> 340 cal</span>
                                    </div>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    <div class="flex items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                             stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star w-5 h-5 fill-yellow-400 text-yellow-400" aria-hidden="true">
                                            <path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z"></path>
                                        </svg>
                                    </div>
                                    4.9 <span class="text-gray-500 font-normal">(56)</span>
                                </div>


                                <div class="flex gap-2 mt-3">
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Breakfast</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Sweet</span>
                                </div>
                            </div>
                        </div>





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
                                    <div class="flex items-center">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                 stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clock w-5 h-5" aria-hidden="true">
                                                <path d="M12 6v6l4 2"></path><circle cx="12" cy="12" r="10"></circle>
                                            </svg>
                                        </div>
                                        <span class="flex items-center gap-1"><span></span> 20m</span>
                                    </div>
                                    <div class="flex items-center">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                 stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trending-up w-5 h-5" aria-hidden="true">
                                                <path d="M16 7h6v6"></path><path d="m22 7-8.5 8.5-5-5L2 17"></path>
                                            </svg>
                                        </div>
                                        <span class="flex items-center gap-1"><span></span> 340 cal</span>
                                    </div>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    <div class="flex items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                             stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star w-5 h-5 fill-yellow-400 text-yellow-400" aria-hidden="true">
                                            <path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z"></path>
                                        </svg>
                                    </div>
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
                                <span class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Easy</span>
                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Fluffy Blueberry Pancakes</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <div class="flex items-center">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                 stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clock w-5 h-5" aria-hidden="true">
                                                <path d="M12 6v6l4 2"></path><circle cx="12" cy="12" r="10"></circle>
                                            </svg>
                                        </div>
                                        <span class="flex items-center gap-1"><span></span> 20m</span>
                                    </div>
                                    <div class="flex items-center">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                 stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trending-up w-5 h-5" aria-hidden="true">
                                                <path d="M16 7h6v6"></path><path d="m22 7-8.5 8.5-5-5L2 17"></path>
                                            </svg>
                                        </div>
                                        <span class="flex items-center gap-1"><span></span> 340 cal</span>
                                    </div>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    <div class="flex items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                             stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star w-5 h-5 fill-yellow-400 text-yellow-400" aria-hidden="true">
                                            <path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z"></path>
                                        </svg>
                                    </div>
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
                                <span class="absolute top-2 right-2 bg-white text-gray-700 text-xs px-2 py-1 rounded shadow">Easy</span>
                            </div>
                            <div class="p-4">
                                <h3 class="font-semibold text-lg mb-1">Fluffy Blueberry Pancakes</h3>


                                <div class="flex items-center text-sm text-gray-500 gap-4 mb-2">
                                    <div class="flex items-center">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                 stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clock w-5 h-5" aria-hidden="true">
                                                <path d="M12 6v6l4 2"></path><circle cx="12" cy="12" r="10"></circle>
                                            </svg>
                                        </div>
                                        <span class="flex items-center gap-1"><span></span> 20m</span>
                                    </div>
                                    <div class="flex items-center">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                 stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trending-up w-5 h-5" aria-hidden="true">
                                                <path d="M16 7h6v6"></path><path d="m22 7-8.5 8.5-5-5L2 17"></path>
                                            </svg>
                                        </div>
                                        <span class="flex items-center gap-1"><span></span> 340 cal</span>
                                    </div>
                                </div>


                                <div class="flex items-center text-yellow-500 text-sm font-semibold mb-2 gap-1">
                                    <div class="flex items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                             stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star w-5 h-5 fill-yellow-400 text-yellow-400" aria-hidden="true">
                                            <path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z"></path>
                                        </svg>
                                    </div>
                                    4.9 <span class="text-gray-500 font-normal">(56)</span>
                                </div>


                                <div class="flex gap-2 mt-3">
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Breakfast</span>
                                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">Sweet</span>
                                </div>
                            </div>
                        </div>

                    </section>
                </main>
                </body>

                </html>