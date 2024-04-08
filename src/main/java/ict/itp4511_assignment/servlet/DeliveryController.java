package ict.itp4511_assignment.servlet;

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

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        deliveryDB = new DeliveryDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        RequestDispatcher rd;
        if (session == null) {
            response.sendRedirect("login?success=false");
            return;
        }

        switch (action) {
            case "arrange":
                session.setAttribute("page", "delivery");
                rd = request.getRequestDispatcher("/deliveryArrange.jsp");
                rd.forward(request, response);
                break;
        }

    }
}
