package servlet;

import dao.ReservationDAO;
import model.Reservation;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Date;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        Connection conn = null;

        try {
            // 1. Get and validate request parameters
            int id = Integer.parseInt(request.getParameter("reservationId"));
            String name = request.getParameter("customerName");
            String room = request.getParameter("roomNumber");
            Date checkIn = Date.valueOf(request.getParameter("checkIn"));  // yyyy-MM-dd format
            Date checkOut = Date.valueOf(request.getParameter("checkOut"));
            double total = Double.parseDouble(request.getParameter("totalAmount"));

            // 2. Populate Reservation object
            Reservation res = new Reservation();
            res.setReservationID(id);
            res.setCustomerName(name);
            res.setRoomNumber(room);
            res.setCheckIn(checkIn);
            res.setCheckOut(checkOut);
            res.setTotalAmount(total);

            // 3. Connect to DB and call DAO
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "");
            ReservationDAO dao = new ReservationDAO(conn);
            dao.addReservation(res);

            // 4. Redirect on success
            response.sendRedirect("DisplayReservationsServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error adding reservation: " + e.getMessage());
        } finally {
            // 5. Close connection
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
