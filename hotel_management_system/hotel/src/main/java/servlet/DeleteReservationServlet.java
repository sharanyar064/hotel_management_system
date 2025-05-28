package servlet;

import dao.ReservationDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

@WebServlet("/DeleteReservationServlet")
public class DeleteReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("reservationID");
        System.out.println("Received reservationID: " + idStr);

        if (idStr == null || idStr.trim().isEmpty()) {
            throw new ServletException("Missing reservationID parameter.");
        }

        try {
            int id = Integer.parseInt(idStr);

            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel?useSSL=false&serverTimezone=UTC", "root", "")) {
                ReservationDAO dao = new ReservationDAO(conn);
                dao.deleteReservation(id);
            }

            response.sendRedirect("DisplayReservationsServlet");
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid reservationID format: " + idStr);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error deleting reservation: " + e.getMessage(), e);
        }
    }
}
