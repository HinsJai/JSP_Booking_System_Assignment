package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.db.ReserveCartDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/30 - 03 - 30 - 下午 11:01
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */
@WebServlet(name = "ReserveController", urlPatterns = {"/reserve"})
public class ReserveController extends HttpServlet {
    private ReserveCartDB db;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new ReserveCartDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "add":
                addToCart(request, response);
                break;
//            case "list":
//                fetchData(request, response);
//                break;
//            case "remove":
//                int equipmentId = Integer.parseInt(request.getParameter("equipmentId"));
//                removeFromCart(request, response, equipmentId);
//                break;
            default:
                response.sendRedirect("home?action=list");
        }
    }

    protected void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int equipmentId = Integer.parseInt(request.getParameter("equipmentId"));
        HttpSession session = request.getSession(false);
        int userID = (int) session.getAttribute("userID");
        boolean result = db.addToCart(userID, equipmentId);
        if (result) {
            response.sendRedirect("home?action=list&addCart=success");
        } else {
            response.sendRedirect("home?action=list&addCart=fail");
        }
    }
}
