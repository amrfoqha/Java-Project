<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<title>Login & Register</title>
</head>
<body class="bg-gray-100 flex justify-center items-center min-h-screen">

<div class="bg-white shadow-xl rounded-xl p-10 w-full max-w-4xl grid grid-cols-1 md:grid-cols-2 gap-10">

    <div>
        <h2 class="text-2xl font-bold mb-4 text-blue-600">Create Account</h2>

        <form:form action="/register" method="post" modelAttribute="newUser" class="space-y-4">

            <div>
                <form:label path="name" class="block font-semibold">Name</form:label>
                <form:errors path="name" cssClass="text-red-500 text-sm"/>
                <form:input path="name" cssClass="w-full px-3 py-2 border rounded-lg"/>
            </div>

            <div>
                <form:label path="email" class="block font-semibold">Email</form:label>
                <form:errors path="email" cssClass="text-red-500 text-sm"/>
                <form:input path="email" cssClass="w-full px-3 py-2 border rounded-lg"/>
            </div>

            <div>
                <form:label path="password" class="block font-semibold">Password</form:label>
                <form:errors path="password" cssClass="text-red-500 text-sm"/>
                <form:password path="password" cssClass="w-full px-3 py-2 border rounded-lg"/>
            </div>

            <div>
                <form:label path="confirmPassword" class="block font-semibold">Confirm Password</form:label>
                <form:errors path="confirmPassword" cssClass="text-red-500 text-sm"/>
                <form:password path="confirmPassword" cssClass="w-full px-3 py-2 border rounded-lg"/>
            </div>

            <input type="submit"
                   value="Register"
                   class="w-full bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700">
        </form:form>
    </div>


    <div>
        <h2 class="text-2xl font-bold mb-4 text-green-600">Login</h2>

        <form:form action="/login" method="post" modelAttribute="loginUser" class="space-y-4">

            <div>
                <form:label path="loginEmail" class="block font-semibold">Email</form:label>
                <form:errors path="loginEmail" cssClass="text-red-500 text-sm"/>
                <form:input path="loginEmail" cssClass="w-full px-3 py-2 border rounded-lg"/>
            </div>

            <div>
                <form:label path="loginPassword" class="block font-semibold">Password</form:label>
                <form:errors path="loginPassword" cssClass="text-red-500 text-sm"/>
                <form:password path="loginPassword" cssClass="w-full px-3 py-2 border rounded-lg"/>
            </div>

            <input type="submit"
                   value="Login"
                   class="w-full bg-green-600 text-white py-2 rounded-lg hover:bg-green-700">
        </form:form>
    </div>

</div>

</body>
</html>
