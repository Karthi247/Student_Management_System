<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Signup | Student Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #9E72C3, #924DBF);
            margin: 0;
            padding: 0;
        }

        .auth-container {
            max-width: 400px;
            margin: 80px auto;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            color: #4A2574;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;  /* uniform space between fields */
            border: 1px solid #ccc;
            border-radius: 6px;
        }


        button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #7338A0;
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
        }

        button:hover {
            background-color: #4A2574;
        }

        .link {
            text-align: center;
            margin-top: 20px;
        }

        .link a {
            color: #7338A0;
            text-decoration: none;
            font-weight: bold;
        }

        .link a:hover {
            color: #4A2574;
        }

        .hidden {
            display: none;
        }

        select {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            background-color: #f7f0fb;
            color: #4A2574;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml;utf8,<svg fill='gray' height='18' viewBox='0 0 24 24' width='18' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/></svg>");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 16px 16px;
        }
    </style>
    <script>
        function toggleFields() {
            const role = document.getElementById("roleSelect").value;
            document.getElementById("usernameField").style.display = (role === "ADMIN" || role === "STAFF") ? "block" : "none";
            document.getElementById("enrollmentField").style.display = (role === "STUDENT") ? "block" : "none";
        }
    </script>
</head>
<body>

<div class="auth-container">
    <h2>Create Account</h2>

    <form action="/register" method="post">

        <select name="role" id="roleSelect" onchange="toggleFields()" required>
            <option value="">Select Role</option>
            <option value="ADMIN">Admin</option>
            <option value="STAFF">Staff</option>
            <option value="STUDENT">Student</option>
        </select>

        <div id="usernameField" class="hidden">
            <input type="text" name="username" placeholder="Username" />
        </div>

        <div id="enrollmentField" class="hidden">
            <input type="text" name="enrollmentNumber" placeholder="Register Number" />
        </div>

        <input type="email" name="email" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />

        <c:if test="${not empty error}">
            <div style="color: red; text-align: center; font-weight: bold; margin-bottom: 15px;">
                ${error}
            </div>
        </c:if>

        <button type="submit">Sign Up</button>
    </form>

    <div class="link">
        Already have an account? <a href="/login">Login here</a>
    </div>
</div>

<script>toggleFields();</script>
</body>
</html>
