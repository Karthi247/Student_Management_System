<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>My Department Courses</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(120deg, #9E72C3, #924DBF);
        }

        .container {
            max-width: 1250px;
            margin: 60px auto;
            background: white;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
        }

        h2, h3 {
            text-align: center;
            color: #4A2574;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 40px;
            border-radius: 12px;
            overflow: hidden;
        }

        th {
            background-color: #7338A0;
            color: white;
            padding: 14px 16px;
            text-align: left;
            font-weight: bold;
        }

        td {
            padding: 14px 16px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f1e7f8;
        }

        tr:nth-child(odd) {
            background-color: #f9f4fc;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .header .btn {
            background-color: #7338A0;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            border: none;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
        }

        .header .btn:hover {
            background-color: #4A2574;
        }
    </style>
</head>
<body>

<%@ include file="student-header.jsp" %>

<div class="container">
    <div class="header">
        <h2>Courses for Department: ${department}</h2>
        <a href="/student/home" class="btn">Back</a>
    </div>

    <c:forEach var="semester" items="${groupedCourses.keySet()}">
        <h3>${semester}</h3>
        <table>
            <tr>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>Credits</th>
            </tr>
            <c:forEach var="course" items="${groupedCourses[semester]}">
                <tr>
                    <td>${course.code}</td>
                    <td>${course.name}</td>
                    <td>${course.credits}</td>
                </tr>
            </c:forEach>
        </table>
    </c:forEach>
</div>

</body>
</html>
