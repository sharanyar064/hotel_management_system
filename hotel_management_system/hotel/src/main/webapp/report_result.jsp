<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Reservation"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
    <title>📋 Reservation Report</title>

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
            background: rgba(255, 240, 245, 0.85); /* White-pink frosted overlay */
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .container-box {
            backdrop-filter: blur(12px);
            background: rgba(255, 255, 255, 0.85);
            border-radius: 20px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.2);
            padding: 40px 30px;
            max-width: 900px;
            margin: 80px auto 60px auto;
        }

        h1 {
            font-family: 'Playfair Display', serif;
            text-align: center;
            font-size: 32px;
            color: #c2185b;
            margin-bottom: 30px;
        }

        .revenue {
            font-weight: 600;
            font-size: 20px;
            color: #198754; /* bootstrap green */
            margin-bottom: 30px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 8px;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background: #f9c5d1;
            color: #87003c;
            font-weight: 600;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        tbody tr {
            background: #fff0f5;
            box-shadow: 0 3px 8px rgb(200 180 200 / 0.2);
            border-radius: 12px;
        }

        tbody tr td:first-child {
            border-top-left-radius: 12px;
            border-bottom-left-radius: 12px;
        }
        tbody tr td:last-child {
            border-top-right-radius: 12px;
            border-bottom-right-radius: 12px;
        }

        p.message {
            font-weight: 500;
            font-size: 18px;
            color: #d6336c;
            text-align: center;
            margin: 40px 0;
        }

        @media (max-width: 768px) {
            .container-box {
                margin: 40px 20px 40px 20px;
                padding: 20px 15px;
            }

            h1 {
                font-size: 26px;
            }

            .revenue {
                font-size: 18px;
                margin-bottom: 20px;
            }

            th, td {
                padding: 10px 8px;
            }
        }
    </style>
</head>
<body>

<div class="overlay"></div>

<div class="container-box">

    <h1>📋 Reservation Report</h1>

    <%
        List<Reservation> list = (List<Reservation>) request.getAttribute("reportList");
        Double totalRevenue = (Double) request.getAttribute("totalRevenue");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if (list == null) {
    %>
        <p class="message">No data found. Please generate the report again.</p>
    <%
        } else if (list.isEmpty()) {
    %>
        <p class="message">No reservations found for the selected date range.</p>
    <%
        } else {
    %>

    <div class="revenue">
        Total Revenue: ₹ <%= String.format("%.2f", totalRevenue != null ? totalRevenue : 0) %>
    </div>

    <table class="table">
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

    <%
        }
    %>

</div>

</body>
</html>
