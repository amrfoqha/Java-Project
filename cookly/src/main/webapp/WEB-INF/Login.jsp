<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <%@ page isErrorPage="true" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <script src="https://cdn.tailwindcss.com"></script>
                        <title>Smart Chef • Login & Register</title>
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">

                        <style>
                            body {
                                min-height: 100vh;
                                display: flex;
                                flex-direction: column;
                                background: url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1470&q=80') no-repeat center center fixed;
                                background-size: cover;
                                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                            }

                            .overlay {
                                backdrop-filter: blur(1px);
                            }
                        </style>
                    </head>

                    <body class="relative">

                        <!-- Back Button -->
                        <div class="absolute top-6 left-6 md:top-12 md:left-12">
                            <a href="/"
                                class="bg-gradient-to-r from-blue-600 to-green-500 text-white px-4 py-2 md:px-5 md:py-3 rounded-xl font-bold hover:bg-green-800 transition">
                                Back to Home
                            </a>
                        </div>

                        <!-- Main Center Box -->
                        <div class="flex justify-center items-center flex-grow px-4 py-10">

                            <div
                                class="w-full max-w-lg md:max-w-3xl backdrop-blur-md  shadow-2xl rounded-3xl overflow-hidden border border-gray-200">

                                <!-- Header -->
                                <div
                                    class="bg-gradient-to-r from-blue-600 to-green-500 text-white p-6 md:p-10 text-center shadow-md">
                                    <h1 class="text-3xl md:text-4xl font-extrabold tracking-wide drop-shadow-sm">
                                        Smart Recipe Platform
                                    </h1>
                                    <p class="text-white/90 text-md md:text-lg mt-2">
                                        Your AI-powered kitchen assistant
                                    </p>
                                </div>

                                <!-- Form Container -->
                                <div class="p-6 md:p-10 pt-5">

                                    <!-- Register Section -->
                                    <div id="registerSection" class="max-w-md mx-auto hidden text-center">
                                        <h2 class="text-2xl md:text-3xl font-semibold mb-6 text-white">
                                            👩‍🍳 Create Account
                                        </h2>

                                        <form:form action="/register" method="post" modelAttribute="newUser"
                                            class="space-y-5 text-left">

                                            <div>
                                                <form:label path="name" class="font-semibold text-white text-lg">Name
                                                </form:label>
                                                <form:input path="name"
                                                    cssClass="w-full px-4 py-3 border rounded-xl shadow-sm" />
                                                <form:errors path="name" cssClass="text-sm bg-red-200 pl-2 rounded" />
                                            </div>

                                            <div>
                                                <form:label path="email" class="font-semibold text-white text-lg">
                                                    Email</form:label>
                                                <form:input path="email"
                                                    cssClass="w-full px-4 py-3 border rounded-xl shadow-sm" />
                                                <form:errors path="email" cssClass="text-sm bg-red-200 pl-2 rounded" />
                                            </div>

                                            <div>
                                                <form:label path="password" class="font-semibold text-white text-lg">
                                                    Password</form:label>
                                                <form:password path="password"
                                                    cssClass="w-full px-4 py-3 border rounded-xl shadow-sm" />
                                                <form:errors path="password"
                                                    cssClass="text-sm bg-red-200 pl-2 rounded" />
                                            </div>

                                            <div>
                                                <form:label path="confirmPassword"
                                                    class="font-semibold text-white text-lg">Confirm Password
                                                </form:label>
                                                <form:password path="confirmPassword"
                                                    cssClass="w-full px-4 py-3 border rounded-xl shadow-sm" />
                                                <form:errors path="confirmPassword"
                                                    cssClass="text-sm bg-red-200 pl-2 rounded" />
                                            </div>

                                            <input type="submit" value="Register"
                                                class="w-full bg-blue-600 text-white py-3 rounded-xl font-bold hover:bg-blue-700 transition shadow-md" />
                                        </form:form>

                                        <p class="mt-4">
                                            <button onclick="showLogin()"
                                                class="text-white hover:underline font-semibold">
                                                Already have an account? Login
                                            </button>
                                        </p>
                                    </div>

                                    <!-- Login Section -->
                                    <div id="loginSection" class="max-w-md mx-auto text-center ">
                                        <h2 class="text-2xl md:text-3xl font-semibold mb-3 text-white">🍽️ Login</h2>

                                        <form:form action="/login" method="post" modelAttribute="loginUser"
                                            class="space-y-5 text-left">

                                            <div>
                                                <form:label path="loginEmail" class="font-semibold text-white text-lg">

                                                    Email</form:label>
                                                <form:input path="loginEmail"
                                                    cssClass="w-full px-4 py-3 border rounded-xl shadow-sm" />
                                                <form:errors path="loginEmail"
                                                    cssClass="text-sm bg-red-200 pl-2 rounded" />
                                            </div>

                                            <div>
                                                <form:label path="loginPassword"
                                                    class="font-semibold text-white text-lg">Password</form:label>
                                                <form:password path="loginPassword"
                                                    cssClass="w-full px-4 py-3 border rounded-xl shadow-sm" />
                                                <form:errors path="loginPassword"
                                                    cssClass="text-sm bg-red-200 pl-2 rounded" />
                                            </div>

                                            <input type="submit" value="Login"
                                                class="w-full bg-green-600 text-white py-3 rounded-xl font-bold hover:bg-green-700 transition shadow-md" />
                                        </form:form>

                                        <p class="mt-4">
                                            <button onclick="showRegister()"
                                                class="text-white hover:underline font-semibold">
                                                Don't have an account? Create one
                                            </button>
                                        </p>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Footer -->
                        <footer class="py-4 text-center  backdrop-blur-md mt-6">
                            <p class="text-gray-800">&copy; 2025 Smart Recipe Platform. All rights reserved.</p>
                        </footer>

                        <script>
                            function showRegister() {
                                document.getElementById("loginSection").classList.add("hidden");
                                document.getElementById("registerSection").classList.remove("hidden");
                            }
                            function showLogin() {
                                document.getElementById("registerSection").classList.add("hidden");
                                document.getElementById("loginSection").classList.remove("hidden");
                            }
                        </script>

                    </body>

                    </html>