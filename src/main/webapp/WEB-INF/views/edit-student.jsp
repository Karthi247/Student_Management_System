<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.student_management_system.Entity.StudentEntity" %>
<%
    StudentEntity student = (StudentEntity) request.getAttribute("student");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Student | Student Management System</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #9E72C3, #924DBF);
        }

        .form-container {
            max-width: 700px;
            margin: 80px auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            color: #4A2574;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        form label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
        }

        form input,
        form select {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
        }

        .form-actions {
            text-align: center;
        }

        .form-actions button {
            padding: 12px 24px;
            background-color: #7338A0;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .form-actions button:hover {
            background-color: #4A2574;
        }

        a.back-link {
            display: inline-block;
            margin-top: 20px;
            color: #7338A0;
            text-decoration: none;
            font-weight: 500;
        }

        a.back-link:hover {
            color: #4A2574;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Edit Student</h2>
    <form action="/admin/edit/${student.id}" method="post">
        <label for="fullName">Full Name</label>
        <input type="text" name="fullName" id="fullName" value="${student.fullName}" required>

        <label for="email">Email</label>
        <input type="email" name="email" id="email" value="${student.email}" required>

        <label for="mobile">Mobile</label>
        <input type="text" name="mobile" id="mobile" value="${student.mobile}" required>

        <label for="dob">Date of Birth</label>
        <input type="date" name="dob" id="dob" value="${student.dob}" required>

        <label for="gender">Gender</label>
        <select name="gender" id="gender" required>
            <option value="Male" ${student.gender == 'Male' ? 'selected' : ''}>Male</option>
            <option value="Female" ${student.gender == 'Female' ? 'selected' : ''}>Female</option>
            <option value="Other" ${student.gender == 'Other' ? 'selected' : ''}>Other</option>
        </select>

        <label for="address">Place</label>
        <input type="text" name="address" id="address" value="${student.address}" required>

        <label for="department">Department</label>
        <input type="text" name="department" id="department" value="${student.department}" required>

        <label for="year">Year</label>
        <input type="text" name="year" id="year" value="${student.year}" required>

        <label for="enrollmentNumber">Register Number</label>
        <input type="text" name="enrollmentNumber" id="enrollmentNumber" value="${student.enrollmentNumber}" required>

        <div class="form-actions">
            <button type="submit">Update Student</button>
        </div>
    </form>
    <div style="text-align:center;">
        <a href="/admin/students" class="back-link">← Back to Student List</a>
    </div>
</div>

</body>
</html>
