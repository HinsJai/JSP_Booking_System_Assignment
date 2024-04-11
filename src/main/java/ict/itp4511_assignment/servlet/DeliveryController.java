package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.db.BookingDB;
import ict.itp4511_assignment.db.CampusDB;
import ict.itp4511_assignment.db.DeliveryDB;

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
 * @Date: 2024/4/8 - 04 - 08 - 下午 04:44
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */
@WebServlet(name = "DeliveryController", value = "/delivery")
public class DeliveryController extends HttpServlet {
    private DeliveryDB deliveryDB;
    private CampusDB campusDB;
    private BookingDB bookingDB;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        deliveryDB = new DeliveryDB(dbUrl, dbUser, dbPassword);
        campusDB = new CampusDB(dbUrl, dbUser, dbPassword);
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
        String json = "";
        if (session == null) {
            response.sendRedirect("login?success=false");
            return;
        }

        switch (action) {
            case "list":
                session.setAttribute("page", "deliveryList");
                rd = request.getRequestDispatcher("/deliveryList.jsp");
                rd.forward(request, response);
                break;
            case "courier_deliveryList":
                session.setAttribute("page", "courier_deliveryList");
                rd = request.getRequestDispatcher("/courier_deliveryList.jsp");
                rd.forward(request, response);
                break;
            case "arrange":
                session.setAttribute("page", "deliveryArrangement");
                rd = request.getRequestDispatcher("/deliveryArrange.jsp");
                rd.forward(request, response);
                break;
            case "generateDeliveryNote":
                session.setAttribute("page", "generateDeliveryNote");
                result = generateDeliveryNote(request, response);
                if (result) {
                    json = "{\"generateDeliveryNote\":\"success\"}";
                } else {
                    json = "{\"generateDeliveryNote\":\"fail\"}";
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
            case "deliveryNote":
                session.setAttribute("page", "deliveryNote");
                rd = request.getRequestDispatcher("/deliveryNote.jsp");
                rd.forward(request, response);
                break;

            case "acceptDeliveryNote":
                result = acceptDeliveryNote(request, response);
                if (result) {
                    json = "{\"acceptDeliveryNote\":\"success\"}";
                } else {
                    json = "{\"acceptDeliveryNote\":\"fail\"}";
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;

            case "completeDeliveryNote":
                result = completeDeliveryNote(request, response);
                if (result) {
                    json = "{\"completeDeliveryNote\":\"success\"}";
                } else {
                    json = "{\"completeDeliveryNote\":\"fail\"}";
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
        }
    }

    public boolean generateDeliveryNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int deliveryID = Integer.parseInt(request.getParameter("deliveryID"));
        int bookingID = Integer.parseInt(request.getParameter("bookingID"));
        String userPickupDate = request.getParameter("pickupDate");
        String pickupPlace = request.getParameter("pickupPlace");
        String deliveryAddress = campusDB.getCampusAddress(pickupPlace);
        boolean result = deliveryDB.generateDeliveryNote(deliveryID, bookingID, userPickupDate, deliveryAddress);
        if (result) {
            return bookingDB.updateStatus(bookingID, "In delivery");
        } else {
            return false;
        }
    }

    public boolean acceptDeliveryNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int deliveryID = Integer.parseInt(request.getParameter("deliveryID"));
        int courierID = Integer.parseInt(request.getParameter("userID"));
        return deliveryDB.acceptDeliveryNote(deliveryID, courierID);
    }

    public boolean completeDeliveryNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int deliveryID = Integer.parseInt(request.getParameter("deliveryID"));
        int bookingID = Integer.parseInt(request.getParameter("bookingID"));
        if (!bookingDB.updateStatus(bookingID, "Delivered")) {
            return false;
        }
        return deliveryDB.completeDeliveryNote(deliveryID);
    }
}
