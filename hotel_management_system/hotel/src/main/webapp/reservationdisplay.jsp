<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Reservation" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🏨 Reservation List</title>

    <!-- Bootstrap + Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Inter:wght@400;500&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('https://images.unsplash.com/photo-1611892440504-42a792e24d32?auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Inter', sans-serif;
            color: #333;
        }

        .overlay {
            background: rgba(255, 240, 245, 0.85);
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .container-custom {
            backdrop-filter: blur(12px);
            background: rgba(255, 255, 255, 0.5);
            border-radius: 20px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.2);
            padding: 40px 30px;
            max-width: 1000px;
            margin: 100px auto;
        }

        h2 {
            font-family: 'Playfair Display', serif;
            text-align: center;
            font-size: 28px;
            color: #c2185b;
            margin-bottom: 30px;
        }

        .table {
            background-color: white;
            border-radius: 12px;
            overflow: hidden;
        }

        .table thead {
            background: linear-gradient(to right, #f9c5d1, #fddde6);
            color: #87003c;
        }

        .error, .no-data {
            text-align: center;
            font-weight: bold;
            font-style: italic;
            color: #b00020;
            margin-top: 20px;
        }

        footer {
            text-align: center;
            margin-top: 60px;
            font-size: 14px;
            color: #555;
        }

        @media (max-width: 768px) {
            .container-custom {
                margin: 60px 20px;
                padding: 20px;
            }

            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
<div class="overlay"></div>

<div class="container-custom">
    <h2>🏨 Reservation List</h2>

    <%
        List<Reservation> list = (List<Reservation>) request.getAttribute("reservations");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if (list == null) {
    %>
        <p class="error">⚠️ No reservation data found. Please access via <code>/DisplayReservationsServlet</code>.</p>
    <%
        } else if (list.isEmpty()) {
    %>
        <p class="no-data">No reservations available at the moment.</p>
    <%
        } else {
    %>
        <div class="table-responsive">
            <table class="table table-bordered text-center">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Room</th>
                        <th>Check-In</th>
                        <th>Check-Out</th>
                        <th>Total (₹)</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for (Reservation r : list) {
                %>
                    <tr>
                        <td><%= r.getReservationID() %></td>
                        <td><%= r.getCustomerName() %></td>
                        <td><%= r.getRoomNumber() %></td>
                        <td><%= sdf.format(r.getCheckIn()) %></td>
                        <td><%= sdf.format(r.getCheckOut()) %></td>
                        <td><%= String.format("%.2f", r.getTotalAmount()) %></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    <%
        }
    %>
</div>

<footer>
    © 2025 Hotel Manager 
</footer>
</body>
</html>
