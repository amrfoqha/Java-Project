
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Smart Chef • Login & Register</title>

    <style>
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1470&q=80') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Overlay to make form readable */
        .overlay {
            background-color: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(10px);
        }
    </style>
</head>

<body class="px-4">

<!-- Main wrapper -->
<div class="flex justify-center items-center flex-grow py-10">

    <div class="w-full max-w-3xl overlay shadow-2xl rounded-3xl overflow-hidden border border-gray-100">

        <!-- Header -->
        <div class="bg-gradient-to-r from-blue-600 to-green-500 text-white p-10 text-center shadow-md">
            <h1 class="text-4xl font-extrabold tracking-wide drop-shadow-sm">
                Smart Recipe Platform
            </h1>
            <p class="text-white/90 text-lg mt-2">
                Your AI-powered kitchen assistant
            </p>
        </div>

        <!-- CENTERED CONTENT -->
        <div class="p-10">

            <!-- REGISTER FORM (hidden at first) -->
            <div id="registerSection" class="max-w-md mx-auto hidden text-center">

                <h2 class="text-3xl font-bold mb-6 text-blue-700">
                    👩‍🍳 Create Account
                </h2>

                <form:form action="/register" method="post" modelAttribute="newUser" class="space-y-5 text-left">

                    <div>
                        <form:label path="name" class="font-semibold">Name</form:label>
                        <form:errors path="name" cssClass="text-red-500 text-sm"/>
                        <form:input path="name" cssClass="w-full px-4 py-3 border rounded-xl shadow-sm"/>
                    </div>

                    <div>
                        <form:label path="email" class="font-semibold">Email</form:label>
                        <form:errors path="email" cssClass="text-red-500 text-sm"/>
                        <form:input path="email" cssClass="w-full px-4 py-3 border rounded-xl shadow-sm"/>
                    </div>

                    <div>
                        <form:label path="password" class="font-semibold">Password</form:label>
                        <form:errors path="password" cssClass="text-red-500 text-sm"/>
                        <form:password path="password" cssClass="w-full px-4 py-3 border rounded-xl shadow-sm"/>
                    </div>

                    <div>
                        <form:label path="confirmPassword" class="font-semibold">Confirm Password</form:label>
                        <form:errors path="confirmPassword" cssClass="text-red-500 text-sm"/>
                        <form:password path="confirmPassword" cssClass="w-full px-4 py-3 border rounded-xl shadow-sm"/>
                    </div>

                    <input type="submit"
                           value="Register"
                           class="w-full bg-blue-600 text-white py-3 rounded-xl font-bold hover:bg-blue-700 transition shadow-md"/>
                </form:form>

                <p class="mt-4">
                    <button onclick="showLogin()" class="text-green-600 hover:underline font-semibold">
                        Already have an account? Login
                    </button>
                </p>
            </div>

            <!-- LOGIN FORM (default visible) -->
            <div id="loginSection" class="max-w-md mx-auto text-center">

                <h2 class="text-3xl font-bold mb-6 text-green-700">
                    🍽️ Login
                </h2>

                <form:form action="/login" method="post" modelAttribute="loginUser" class="space-y-5 text-left">

                    <div>
                        <form:label path="loginEmail" class="font-semibold">Email</form:label>
                        <form:errors path="loginEmail" cssClass="text-red-500 text-sm"/>
                        <form:input path="loginEmail" cssClass="w-full px-4 py-3 border rounded-xl shadow-sm"/>
                    </div>

                    <div>
                        <form:label path="loginPassword" class="font-semibold">Password</form:label>
                        <form:errors path="loginPassword" cssClass="text-red-500 text-sm"/>
                        <form:password path="loginPassword" cssClass="w-full px-4 py-3 border rounded-xl shadow-sm"/>
                    </div>

                    <input type="submit"
                           value="Login"
                           class="w-full bg-green-600 text-white py-3 rounded-xl font-bold hover:bg-green-700 transition shadow-md"/>
                </form:form>

                <p class="mt-4">
                    <button onclick="showRegister()" class="text-blue-600 hover:underline font-semibold">
                        Don't have an account? Create one
                    </button>
                </p>
            </div>

        </div>
    </div>

</div>

<!-- Footer -->
<footer class="mt-auto py-6 text-center bg-gray-100 shadow-inner">
    <p class="text-gray-600">&copy; 2025 Smart Recipe Platform. All rights reserved.</p>
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
