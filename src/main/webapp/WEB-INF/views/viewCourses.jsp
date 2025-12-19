<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Courses</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f2f9;
            margin: 0;
            padding: 0;
        }

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

        .button {
    background-color: #7338A0;
    color: white;
    padding: 10px 20px;
    border-radius: 6px;
    text-decoration: none;
    font-weight: bold;
    font-size: 15px;
    border: none;
    cursor: pointer;
    display: inline-flex;
    align-items: center;
    gap: 6px;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.button:hover {
    background-color: #4A2574;
    transform: scale(1.05);
}

.button:active {
    transform: scale(0.98);
}

.button.secondary {
    background-color: #ccc;
    color: #333;
}

.button.secondary:hover {
    background-color: #aaa;
}


    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <h2>Available Courses</h2>

    <div>
        <a href="/courses/add" class="button">+ Add New Course</a>
        <a href="/dashboard" class="button" >← Back</a>
    </div>
    
    <form method="get" action="/courses" style="margin-bottom: 30px; display: flex; align-items: flex-end; gap: 20px; flex-wrap: wrap;">

        <div style="flex: 1; min-width: 200px;">
            <label for="department" style="font-weight: bold; color: #4A2574; margin-bottom: 6px; display: block;">Department</label>
            <select name="department" id="department"
                    style="padding: 10px; width: 100%; border-radius: 8px; border: 1px solid #ccc; background-color: #F7F0FB; font-size: 14px;">
                <option value="">All</option>
                <c:forEach items="${departments}" var="dept">
                    <option value="${dept}" ${param.department == dept ? 'selected' : ''}>${dept}</option>
                </c:forEach>
            </select>
        </div>
    
        <div style="flex: 1; min-width: 200px;">
            <label for="semester" style="font-weight: bold; color: #4A2574; margin-bottom: 6px; display: block;">Semester</label>
            <select name="semester" id="semester"
                    style="padding: 10px; width: 100%; border-radius: 8px; border: 1px solid #ccc; background-color: #F7F0FB; font-size: 14px;">
                <option value="">All</option>
                <c:forEach items="${semesters}" var="sem">
                    <option value="${sem}" ${param.semester == sem ? 'selected' : ''}>${sem}</option>
                </c:forEach>
            </select>
        </div>
    
        <div style="display: flex; gap: 10px;">
            <button type="submit" class="button">
                <span></span>Filter
            </button>
            
            <a href="/courses" class="button secondary">
                <span>&#8635;</span> Reset
            </a>

        </div>
    
    </form>
    
    
    


    <table>
        <thead>
        <tr>
            <th>Course Code</th>
            <th>Course Name</th>
            <th>Department</th>
            <th>Semester</th>
            <th>Credits</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${courses}" var="course">
            <tr>
                <td>${course.code}</td>
                <td>${course.name}</td>
                <td>${course.department}</td>
                <td>${course.semester}</td>
                <td>${course.credits}</td>
                <td>
                    <a class="edit-btn" href="/courses/edit/${course.id}">Edit</a><br><br>
                    <a class="delete-btn" href="/courses/delete/${course.id}" onclick="return confirm('Are you sure you want to delete this course?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
