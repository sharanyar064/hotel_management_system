package servlet;

import dao.ReservationDAO;
import model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fromStr = request.getParameter("from");
        String toStr = request.getParameter("to");

        try {
            Date fromDate = null;
            Date toDate = null;

            if (fromStr != null && !fromStr.isEmpty()) {
                fromDate = sdf.parse(fromStr);
            }
            if (toStr != null && !toStr.isEmpty()) {
                toDate = sdf.parse(toStr);
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel?useSSL=false&serverTimezone=UTC", "root", "")) {

                ReservationDAO dao = new ReservationDAO(conn);
                List<Reservation> list;

                if (fromDate != null && toDate != null) {
                    list = dao.getReservationsByDateRange(fromDate, toDate);
                } else {
                    list = dao.getAllReservations();
                }

                double totalRevenue = 0;
                if (fromDate != null && toDate != null) {
                    totalRevenue = dao.getTotalRevenue(fromDate, toDate);
                }

                request.setAttribute("reportList", list);
                request.setAttribute("totalRevenue", totalRevenue);

                RequestDispatcher rd = request.getRequestDispatcher("report_result.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error generating report: " + e.getMessage(), e);
        }
    }
}
