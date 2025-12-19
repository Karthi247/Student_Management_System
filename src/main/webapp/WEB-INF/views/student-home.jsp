<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="student-header.jsp" %>
<%@ page import="com.example.student_management_system.Entity.UserEntity" %>
<%
    UserEntity user1 = (UserEntity) session.getAttribute("loggedUser");
    if (user1 == null) {
        response.sendRedirect("/login");
        return;
    }
%>
<html>
<head>
    <title>Home | Student Management System</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #9E72C3, #924DBF);
            color: white;
        }

        .home-container {
            max-width: 1000px;
            margin: 80px auto;
            text-align: center;
            background-color: #ffffff;
            color: #4A2574;
            padding: 60px 40px;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
        }

        .home-container h1 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .home-container p {
            font-size: 18px;
            margin-bottom: 40px;
        }

        .nav-buttons {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
        }

        .nav-buttons a {
            padding: 14px 28px;
            background-color: #7338A0;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.3s;
        }

        .nav-buttons a:hover {
            background-color: #4A2574;
        }
    </style>
</head>
<body>

<div class="home-container">
    <h1>
        Welcome<% if (user1 != null) { %>, <%= user1.getUsername() %><% } %> to Student Management System
    </h1>
    
    <p>Manage your students, academic records, and more — all in one place!</p>

    <div class="nav-buttons">
        <a href="/student/students"> Profile</a>
    </div>
</div>

</body>
</html>
