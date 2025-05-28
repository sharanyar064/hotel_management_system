package servlet;

import dao.ReservationDAO;
import model.Reservation;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;

@WebServlet("/UpdateReservationServlet")
public class UpdateReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Retrieve parameters
            int id = Integer.parseInt(request.getParameter("reservationID"));
            String name = request.getParameter("customerName");
            String room = request.getParameter("roomNumber");
            String checkin = request.getParameter("checkIn");
            String checkout = request.getParameter("checkOut");
            double total = Double.parseDouble(request.getParameter("totalAmount"));


            // Parse dates
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date checkInDate = sdf.parse(checkin);
            java.util.Date checkOutDate = sdf.parse(checkout);

            // Create reservation object
            Reservation r = new Reservation();
            r.setReservationID(id);
            r.setCustomerName(name);
            r.setRoomNumber(room);
            r.setCheckIn(checkInDate);
            r.setCheckOut(checkOutDate);
            r.setTotalAmount(total);

            // Save to DB
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hotel?useSSL=false&serverTimezone=UTC", 
                "root", 
                ""
            );
            ReservationDAO dao = new ReservationDAO(conn);
            dao.updateReservation(r);
            conn.close();

            // Redirect to display
            response.sendRedirect("DisplayReservationsServlet");
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error updating reservation: " + e.getMessage(), e);
        }
    }
}
