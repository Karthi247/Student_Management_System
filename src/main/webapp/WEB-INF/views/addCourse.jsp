<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Add/Edit Course</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f2f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 60%;
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

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            color: #4A2574;
            font-weight: bold;
        }

        input, select {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        button {
            background-color: #7338A0;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #4A2574;
        }

        a.back-btn {
            display: inline-block;
            margin-top: 15px;
            color: #7338A0;
            font-weight: bold;
            text-decoration: none;
        }

        a.back-btn:hover {
            color: #4A2574;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <h2>${course.id == null ? "Add New Course" : "Edit Course"}</h2>

    <form action="/courses/save" method="post">
        <input type="hidden" name="id" value="${course.id}" />

        <label for="code">Course Code</label>
        <input type="text" name="code" id="code" value="${course.code}" required />

        <label for="name">Course Name</label>
        <input type="text" name="name" id="name" value="${course.name}" required />

        <label for="department">Department</label>
        <input type="text" name="department" id="department" value="${course.department}" required />

        <label for="semester">Semester</label>
        <select name="semester" id="semester" required>
            <option value="">--Select Semester--</option>
            <c:forEach var="i" begin="1" end="8">
                <c:set var="semVal" value="Semester ${i}" />
                <option value="${semVal}" <c:if test="${course.semester == semVal}">selected</c:if>>
                    Semester ${i}
                </option>
            </c:forEach>
            
        </select>

        <label for="credits">Credits</label>
        <input type="number" name="credits" id="credits" min="1" max="10" value="${course.credits}" required />

        <button type="submit">Save Course</button>
    </form>

    <a href="/courses" class="back-btn">← Back to Course List</a>
</div>

</body>
</html>
