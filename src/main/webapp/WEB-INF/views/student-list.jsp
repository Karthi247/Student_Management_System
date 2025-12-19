<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Student Records</title>
    <style>
        .container {
            max-width: 80%;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }

        h2 {
            color: #4A2574;
            text-align: center;
            margin-bottom: 30px;
        }

        a.button {
            background-color: #7338A0;
            color: white;
            padding: 10px 18px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            margin-bottom: 20px;
            transition: background-color 0.3s;
        }

        a.button:hover {
            background-color: #4A2574;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #F7F0FB;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #7338A0;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #E9DDF4;
        }

        a.action-link {
            margin: 0 5px;
            text-decoration: none;
            color: #7338A0;
            font-weight: bold;
        }

        a.action-link:hover {
            color: #4A2574;
        }

        a.edit-btn, a.delete-btn {
            padding: 6px 14px;
            border-radius: 6px;
            font-weight: bold;
            text-decoration: none;
            color: white;
            transition: 0.3s ease;
        }

        a.edit-btn {
            background-color: #7338A0;
        }

        a.edit-btn:hover {
            background-color: #4A2574;
        }

        a.delete-btn {
            background-color: #C0392B;
        }

        a.delete-btn:hover {
            background-color: #922B21;
        }

    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <h2>Student Records</h2>

    <a href="/admin/add" class="button">+ Add New Student</a>

    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Place</th>
            <th>DOB</th>
            <th>Gender</th>
            <th>Enrollment #</th>
            <th>Department</th>
            <th>Year</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${students}" var="student">
            <tr>
                <td>${student.fullName}</td>
                <td>${student.email}</td>
                <td>${student.mobile}</td>
                <td>${student.address}</td>
                <td>${student.dob}</td>
                <td>${student.gender}</td>
                <td>${student.enrollmentNumber}</td>
                <td>${student.department}</td>
                <td>${student.year}</td>
                <td>
                    <a class="edit-btn" href="/admin/edit/${student.id}">Edit</a><br></br>
                    <a class="delete-btn" href="/admin/delete/${student.id}" onclick="return confirm('Are you sure?')">Delete</a>
                </td>                
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
