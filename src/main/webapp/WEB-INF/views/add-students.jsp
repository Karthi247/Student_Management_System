<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Add Student | Student Management System</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #9E72C3, #924DBF);
            color: #4A2574;
        }

        .form-container {
            max-width: 700px;
            margin: 60px auto;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 14px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            color: #4A2574;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-top: 15px;
            color: #4A2574;
        }

        input, select {
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            margin-top: 5px;
        }

        .form-actions {
            margin-top: 30px;
            text-align: center;
        }

        .btn {
            background-color: #7338A0;
            color: white;
            padding: 12px 24px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #4A2574;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #7338A0;
            font-weight: bold;
            text-decoration: none;
        }

        .back-link:hover {
            color: #4A2574;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add New Student</h2>
    <form action="/admin/save" method="post">
        <label for="fullName">Full Name</label>
        <input type="text" id="fullName" name="fullName" required />

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required />

        <label for="mobile">Mobile Number</label>
        <input type="text" id="mobile" name="mobile" required />

        <label for="place">Place</label>
        <input type="text" id="plcae" name="place" required />

        <label for="dob">Date of Birth</label>
        <input type="date" id="dob" name="dob" required />

        <label for="gender">Gender</label>
        <select id="gender" name="gender" required>
            <option value="">Select</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select>

        <label for="enrollmentNumber">Register Number</label>
        <input type="text" id="enrollmentNumber" name="enrollmentNumber" required />

        <label for="department">Department</label>
        <input type="text" id="department" name="department" required />

        <label for="year">Year</label>
        <select id="year" name="year" required>
            <option value="">Select</option>
            <option value="1st Year">1st Year</option>
            <option value="2nd Year">2nd Year</option>
            <option value="3rd Year">3rd Year</option>
            <option value="4th Year">4th Year</option>
        </select>

        <div class="form-actions">
            <button type="submit" class="btn">Save Student</button>
        </div>
    </form>

    <a href="/admin/students" class="back-link">← Back to Student List</a>
</div>

</body>
</html>
