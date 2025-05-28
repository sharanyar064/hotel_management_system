package servlet;

import dao.ReservationDAO;
import model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

@WebServlet("/DisplayReservationsServlet")
public class DisplayReservationsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("JDBC Driver loaded successfully.");

            // Connect to database
            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel?useSSL=false&serverTimezone=UTC", "root", "")) {
                System.out.println("Database connection established.");

                // Fetch all reservations
                ReservationDAO dao = new ReservationDAO(conn);
                List<Reservation> list = dao.getAllReservations();
                System.out.println("Fetched " + list.size() + " reservations.");

                // Set as attribute
                request.setAttribute("reservations", list);

                // Forward to JSP
                RequestDispatcher rd = request.getRequestDispatcher("reservationdisplay.jsp");
                rd.forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "JDBC Driver not found.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error displaying reservations: " + e.getMessage());
        }
    }
}
