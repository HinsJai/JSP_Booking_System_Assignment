package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.db.WishListDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/4/3 - 04 - 03 - 下午 05:19
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */
@WebServlet(name = "NotificationController", urlPatterns = "/notification")
public class NotificationController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private WishListDB db;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new WishListDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login?success=false");
            return;
        }
        int userID = (int) request.getSession().getAttribute("userID");

        switch (action) {
            case "wishNotification":
                session.setAttribute("wishNotification", db.getAvailableWishList(userID));
                break;
        }
    }


}
