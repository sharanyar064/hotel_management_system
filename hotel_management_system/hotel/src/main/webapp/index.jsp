<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hotel Management System</title>

    <!-- Bootstrap + Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Inter:wght@400;500&display=swap" rel="stylesheet">

    <style>
       html, body {
    height: 100%;
    margin: 0;
    padding: 0;
}

body {
    background: url('https://images.unsplash.com/photo-1611892440504-42a792e24d32?auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed;
    background-size: cover;
    font-family: 'Inter', sans-serif;
    color: #333;
}

        .overlay {
            background: rgba(255, 240, 245, 0.85); /* White-pink frosted overlay */
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .container-box {
            backdrop-filter: blur(12px);
            background: rgba(255, 255, 255, 0.5);
            border-radius: 20px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.2);
            padding: 50px 40px;
            max-width: 720px;
            margin: 120px auto;
        }

        h1 {
            font-family: 'Playfair Display', serif;
            text-align: center;
            font-size: 32px;
            color: #c2185b;
            margin-bottom: 40px;
        }

        .menu-btn {
            display: block;
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 16px;
            font-weight: 500;
            border-radius: 12px;
            text-decoration: none;
            background: linear-gradient(135deg, #f9c5d1, #fddde6);
            color: #87003c;
            box-shadow: 0 4px 15px rgba(255, 105, 135, 0.3);
            transition: all 0.3s ease;
        }

        .menu-btn:hover {
            background: linear-gradient(135deg, #ff8aab, #ffc1cc);
            box-shadow: 0 6px 20px rgba(255, 105, 135, 0.6);
            transform: translateY(-3px);
        }

        footer {
            text-align: center;
            margin-top: 60px;
            font-size: 14px;
            color: #555;
        }

        @media (max-width: 768px) {
            .container-box {
                margin: 80px 20px;
                padding: 30px;
            }

            h1 {
                font-size: 26px;
            }

            .menu-btn {
                font-size: 15px;
                padding: 12px;
            }
        }
    </style>
</head>
<body>
<div class="overlay"></div>

<div class="container-box">
    <h1>Welcome to Hotel Management System</h1>
    <a href="reservationadd.jsp" class="menu-btn"> Add Reservation</a>
    <a href="reservationupdate.jsp" class="menu-btn">Update Reservation</a>
    <a href="reservationdelete.jsp" class="menu-btn"> Delete Reservation</a>
    <a href="DisplayReservationsServlet" class="menu-btn"> View Reservations</a>
    <a href="reports.jsp" class="menu-btn">Generate Reports</a>
</div>

<footer>
    © 2025 Hotel Manager 
</footer>
</body>
</html>
