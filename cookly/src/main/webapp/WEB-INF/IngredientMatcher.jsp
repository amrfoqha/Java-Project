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

                <body class="mx-auto w-screen mx-auto mt-10">
                    <div
                        class="w-3/4 h-42 rounded-2xl bg-gradient-to-r from-[#FF6900] to-[#F73698] py-12 mx-auto pl-16">
                        <div class="flex items-center">

                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"
                                fill="none" stroke="white" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="lucide lucide-sparkles w-12 h-12" aria-hidden="true">
                                <path
                                    d="M11.017 2.814a1 1 0 0 1 1.966 0l1.051 5.558a2 2 0 0 0 1.594 1.594l5.558 1.051a1 1 0 0 1 0 1.966l-5.558 1.051a2 2 0 0 0-1.594 1.594l-1.051 5.558a1 1 0 0 1-1.966 0l-1.051-5.558a2 2 0 0 0-1.594-1.594l-5.558-1.051a1 1 0 0 1 0-1.966l5.558-1.051a2 2 0 0 0 1.594-1.594z">
                                </path>
                                <path d="M20 2v4"></path>
                                <path d="M22 4h-4"></path>
                                <circle cx="4" cy="20" r="2"></circle>
                            </svg>
                            <h1 class="text-white text-2xl font-light ml-4">What's in Your Kitchen?</h1>
                        </div>
                        <div class="ml-4 mt-2">
                            <h1 class="text-white text-2xl font-light">Add the ingredients you have, and we'll
                                find recipes you can make!</h1>
                        </div>
                    </div>
                    <div class="w-3/4 h-48 rounded-2xl p-6 mx-auto pl-8 bg-gray-200 mt-10">
                        <h1 class="text-xl font-light">Your Ingredients</h1>
                        <div>
                            <form action="/ingredientMatcher" method="post"
                                class="flex items-center justify-between mt-2 ">
                                <input type="text" name="ingredient" placeholder="e.g., chicken, tomatoes, pasta..."
                                    class="w-4/5 p-2 rounded-lg h-12 pl-4 mt-4">
                                <button type="submit"
                                    class="bg-[#FF6900] text-white p-2 rounded-lg  w-1/6 h-12 hover:bg-[#FF695f]">Add</button>
                            </form>
                        </div>
                    </div>
                    <div>
                        <h1>Found 1 Recipe</h1>
                    </div>
                </body>

                </html>