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
        int bookID;
        boolean result = false;
        if (session == null) {
            response.sendRedirect("login?success=false");
            return;
        }
        int userID = (int) session.getAttribute("userID");
//        session.setAttribute("page", "booking");
        switch (action) {
            case "list":
                session.setAttribute("page", "booking");
                rd = request.getRequestDispatcher("/bookingList.jsp");
                rd.forward(request, response);
                break;
            case "requestList":
                session.setAttribute("page", "bookingRequest");
                rd = request.getRequestDispatcher("/bookingRequestList.jsp");
                rd.forward(request, response);
                break;

            case "details":
                session.setAttribute("page", "booking");
                rd = request.getRequestDispatcher("/bookingDetails.jsp");
                rd.forward(request, response);
                break;

            case "requestDetails":
                session.setAttribute("page", "bookingRequest");
                session.setAttribute("bookingID", request.getParameter("bookingID"));
                rd = request.getRequestDispatcher("/bookingRequestDetails.jsp");
                rd.forward(request, response);
                break;

            case "approveBooking":
                bookID = Integer.parseInt(request.getParameter("bookingID"));
                result = bookingDB.approveBooking(bookID);
                if (result) {
                    response.sendRedirect("booking?action=requestList&approve=success");
                } else {
                    response.sendRedirect("booking?action=requestList&approve=failed");
                }
                break;
            case "rejectBooking":
                bookID = Integer.parseInt(request.getParameter("bookingID"));
                String rejectReason = request.getParameter("rejectReason");
                result = bookingDB.rejectBooking(bookID, rejectReason);
                if (result) {
                    response.sendRedirect("booking?action=requestList&reject=success");
                } else {
                    response.sendRedirect("booking?action=requestList&reject=failed");
                }
                break;

            case "cancel":
                session.setAttribute("page", "booking");
                bookID = Integer.parseInt(request.getParameter("id"));
                result = bookingDB.cancelBooking(bookID);
                if (result) {
                    response.sendRedirect("booking?action=details&bookID=" + bookID + "&cancel=success");
                } else {
//                    response.sendRedirect("booking?action=details&id=" + request.getParameter("id"));
                    response.sendRedirect("booking?action=details&bookID=" + bookID + "&cancel=failed");
                }
                break;
        }
    }
}
