<%@ page import="java.sql.*, java.util.*, model.Reservation, dao.ReservationDAO" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Reservation reservation = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "");
        ReservationDAO dao = new ReservationDAO(conn);
        List<Reservation> all = dao.getAllReservations(); // This line works if all imports and DAO are correct

        for (Reservation r : all) {
            if (r.getReservationID() == id) {
                reservation = r;
                break;
            }
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }

    if (reservation == null) {
        out.println("<h3>Reservation not found.</h3>");
        return;
    }
%>