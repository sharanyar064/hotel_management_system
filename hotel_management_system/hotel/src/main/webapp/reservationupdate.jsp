<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Reservation</title>

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

        .form-container {
            backdrop-filter: blur(12px);
            background: rgba(255, 255, 255, 0.5);
            border-radius: 20px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.2);
            padding: 50px 40px;
            max-width: 720px;
            margin: 120px auto;
        }

        h2 {
            font-family: 'Playfair Display', serif;
            text-align: center;
            font-size: 28px;
            color: #c2185b;
            margin-bottom: 30px;
        }

        .form-label {
            font-weight: 500;
            color: #87003c;
        }

        .form-control {
            border-radius: 10px;
        }

        .btn-submit {
            background: linear-gradient(135deg, #c8e6c9, #a5d6a7);
            color: #1b5e20;
            font-weight: 500;
            border: none;
            border-radius: 12px;
            padding: 12px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(76, 175, 80, 0.3);
        }

        .btn-submit:hover {
            background: linear-gradient(135deg, #81c784, #66bb6a);
            box-shadow: 0 6px 20px rgba(76, 175, 80, 0.6);
            transform: translateY(-2px);
        }

        footer {
            text-align: center;
            margin-top: 60px;
            font-size: 14px;
            color: #555;
        }

        @media (max-width: 768px) {
            .form-container {
                margin: 80px 20px;
                padding: 30px;
            }

            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
<div class="overlay"></div>

<div class="form-container">
    <h2>Update Reservation</h2>
    <form action="UpdateReservationServlet" method="post">
        <div class="mb-3">
            <label for="reservationID" class="form-label">Reservation ID</label>
            <input type="text" class="form-control" id="reservationID" name="reservationID" required>
        </div>
        <div class="mb-3">
            <label for="customerName" class="form-label">Customer Name</label>
            <input type="text" class="form-control" id="customerName" name="customerName" required>
        </div>
        <div class="mb-3">
            <label for="roomNumber" class="form-label">Room Number</label>
            <input type="text" class="form-control" id="roomNumber" name="roomNumber" required>
        </div>
        <div class="mb-3">
            <label for="checkIn" class="form-label">Check-In Date</label>
            <input type="date" class="form-control" id="checkIn" name="checkIn" required>
        </div>
        <div class="mb-3">
            <label for="checkOut" class="form-label">Check-Out Date</label>
            <input type="date" class="form-control" id="checkOut" name="checkOut" required>
        </div>
        <div class="mb-3">
            <label for="totalAmount" class="form-label">Total Amount</label>
            <input type="text" class="form-control" id="totalAmount" name="totalAmount" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-submit">✅ Update Reservation</button>
        </div>
    </form>
</div>

<footer>
    © 2025 Hotel Manager 
</footer>
</body>
</html>
