package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.db.BookingDB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/4/2 - 04 - 02 - 下午 04:45
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */

@WebServlet(name = "BookingController", urlPatterns = {"/booking"})
public class BookingController extends HttpServlet {
    private BookingDB bookingDB;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        RequestDispatcher rd;
        boolean result = false;
        if (session == null) {
            response.sendRedirect("login?success=false");
            return;
        }
        int userID = (int) session.getAttribute("userID");
        session.setAttribute("page", "booking");
        switch (action) {
            case "list":
                rd = request.getRequestDispatcher("/bookingList.jsp");
                rd.forward(request, response);
                break;
            case "details":
                rd = request.getRequestDispatcher("/bookingDetails.jsp");
                rd.forward(request, response);
                break;
            case "cancel":
                int bookingID = Integer.parseInt(request.getParameter("id"));
                result = bookingDB.cancelBooking(bookingID);
                if (result) {
                    response.sendRedirect("booking?action=details&bookID=" + bookingID + "&cancel=success");
                } else {
                    response.sendRedirect("booking?action=details&id=" + request.getParameter("id"));
                }
                break;
        }
    }
}
