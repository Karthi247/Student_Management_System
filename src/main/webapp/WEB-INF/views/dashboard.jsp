<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f2f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 85%;
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

        .cards {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .card {
            flex: 1;
            min-width: 200px;
            background-color: #7338A0;
            color: white;
            border-radius: 12px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 16px;
            font-weight: bold;
        }

        .actions {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 40px;
        }

        .actions a {
            flex: 1;
            min-width: 180px;
            padding: 15px;
            text-align: center;
            background-color: #F7F0FB;
            border: 2px solid #7338A0;
            color: #7338A0;
            text-decoration: none;
            font-weight: bold;
            border-radius: 8px;
            transition: background-color 0.3s;
        }

        .actions a:hover {
            background-color: #E9DDF4;
        }

        canvas {
            margin: 30px auto;
            display: block;
            max-width: 700px;
        }

        .chart-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 30px;
            margin-top: 40px;
        }

        .chart-box {
            flex: 1;
            min-width: 300px;
            max-width: 600px;
            margin: 0 auto;
        }

    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <h2> Student Management Dashboard</h2>

    <!-- 🧩 Metric Cards -->
    <div class="cards">
        <div class="card">
            <h3>${totalStudents}</h3>
            <p>Total Students</p>
        </div>
        <div class="card">
            <h3>${totalCourses}</h3>
            <p>Total Courses</p>
        </div>
    </div>

    <!-- 🗂️ Quick Action Buttons -->
    <div class="actions">
        <a href="/admin/add">➕ Add Student</a>
        <a href="/admin/students">📄 View Students</a>
        <a href="/courses">🗂 View Courses</a>
    </div>

    <!-- 📈 Charts -->
    <div class="chart-container">
        <div class="chart-box">
            <canvas id="deptChart"></canvas>
        </div>
        <div class="chart-box">
            <canvas id="yearChart"></canvas>
        </div>
    </div>
    
</div>

<script>
    // Pie Chart - Department-wise Distribution
    const deptLabels = [<c:forEach var="entry" items="${deptData}">"${entry.key}",</c:forEach>];
    const deptValues = [<c:forEach var="entry" items="${deptData}">${entry.value},</c:forEach>];

    new Chart(document.getElementById('deptChart'), {
        type: 'pie',
        data: {
            labels: deptLabels,
            datasets: [{
                data: deptValues,
                backgroundColor: ['#4A2574', '#7338A0', '#A36AE5', '#E9DDF4', '#F7F0FB']
            }]
        },
        options: {
            plugins: {
                title: {
                    display: true,
                    text: 'Department-wise Distribution',
                    font: { size: 18 }
                }
            }
        }
    });

    // Bar Chart - Year-wise Enrollment
    const yearLabels = [<c:forEach var="entry" items="${yearData}">"${entry.key}",</c:forEach>];
    const yearValues = [<c:forEach var="entry" items="${yearData}">${entry.value},</c:forEach>];

    new Chart(document.getElementById('yearChart'), {
        type: 'bar',
        data: {
            labels: yearLabels,
            datasets: [{
                label: 'Students',
                data: yearValues,
                backgroundColor: '#A36AE5'
            }]
        },
        options: {
            plugins: {
                title: {
                    display: true,
                    text: 'Year-wise Enrollment',
                    font: { size: 18 }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        stepSize: 1
                    }
                }
            }
        }
    });
</script>

</body>
</html>
