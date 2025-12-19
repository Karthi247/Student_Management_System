<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.student_management_system.Entity.UserEntity" %>
<%
    UserEntity user = (UserEntity) session.getAttribute("loggedUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Management System</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(120deg, #9E72C3, #924DBF);
        }

        .navbar {
            background-color: #4A2574;
            padding: 16px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .navbar .logo {
            font-size: 22px;
            font-weight: bold;
            color: #FFFFFF;
        }

        .navbar ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .navbar ul li {
            display: flex;
            align-items: center;
        }

        .navbar ul li a, .navbar ul li span {
            text-decoration: none;
            color: #E0D7F8;
            font-weight: 500;
            transition: color 0.3s;
        }

        .navbar ul li a:hover {
            color: #FFFFFF;
        }

        .navbar .btn-link {
            background-color: #7338A0;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .navbar .btn-link:hover {
            background-color: #4A2574;
            color: white;
        }

        .navbar ul li span {
            color: #E0D7F8;
            font-weight: 500;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="logo">Student Management</div>
    <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/dashboard">Dashboard</a></li>
        <li><a href="/admin/students">Students</a></li>
        <li><a href="/courses">Courses</a></li>

        <% if (user == null) { %>
            <li><a class="btn-link" href="/login">Login</a></li>
            <li><a class="btn-link" href="/signup">Signup</a></li>
        <% } else { %>
            <li><a class="btn-link" href="/logout">Logout</a></li>
        <% } %>
    </ul>
</div>
