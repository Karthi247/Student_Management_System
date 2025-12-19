<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>My Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #9E72C3, #924DBF);
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            color: #4A2574;
            margin-bottom: 30px;
        }

        .profile-section {
            margin-bottom: 20px;
        }

        .label {
            font-weight: bold;
            color: #7338A0;
            display: inline-block;
            width: 150px;
        }

        .value {
            color: #333;
        }

        .back-btn {
            display: block;
            margin-top: 30px;
            text-align: center;
        }

        .back-btn a {
            text-decoration: none;
            background-color: #7338A0;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: bold;
        }

        .back-btn a:hover {
            background-color: #4A2574;
        }
    </style>
</head>
<body>

<%@ include file="student-header.jsp" %>

<div class="container">
    <h2>My Profile</h2>

    <div class="profile-section">
        <span class="label">Full Name:</span>
        <span class="value">${student.fullName}</span>
    </div>
    <div class="profile-section">
        <span class="label">Email:</span>
        <span class="value">${student.email}</span>
    </div>
    <div class="profile-section">
        <span class="label">Mobile:</span>
        <span class="value">${student.mobile}</span>
    </div>
    <div class="profile-section">
        <span class="label">Address:</span>
        <span class="value">${student.address}</span>
    </div>
    <div class="profile-section">
        <span class="label">DOB:</span>
        <span class="value">${student.dob}</span>
    </div>
    <div class="profile-section">
        <span class="label">Gender:</span>
        <span class="value">${student.gender}</span>
    </div>
    <div class="profile-section">
        <span class="label">Register No:</span>
        <span class="value">${student.enrollmentNumber}</span>
    </div>
    <div class="profile-section">
        <span class="label">Department:</span>
        <span class="value">${student.department}</span>
    </div>
    <div class="profile-section">
        <span class="label">Year:</span>
        <span class="value">${student.year}</span>
    </div>

    <div class="back-btn">
        <a href="/student/home">← Back to Home</a>
    </div>
</div>

</body>
</html>
