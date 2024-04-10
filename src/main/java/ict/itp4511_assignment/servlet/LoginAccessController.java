package ict.itp4511_assignment.servlet;

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
 * @Date: 2024/3/26 - 03 - 26 - 下午 10:55
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */
@WebServlet(name = "LoginAccessController", urlPatterns = {"/login"})
public class LoginAccessController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean loginPass = "true".equals(request.getParameter("success"));
        HttpSession session = request.getSession(false);
        boolean sessionCheck = session != null && session.getAttribute("userInfo") != null;
        if (loginPass && sessionCheck) {
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
//            dispatcher.forward(request, response);
            getAccessPage(request, response, (String) session.getAttribute("userType"));
//            response.sendRedirect("home?action=list");
        } else if (!loginPass && !sessionCheck) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
            dispatcher.forward(request, response);
        } else {
//            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
            dispatcher.forward(request, response);
        }
//
//        String action = request.getParameter("action");
//        if ("logout".equals(action)) {
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
//            dispatcher.forward(request, response);
//        }
    }

    protected void getAccessPage(HttpServletRequest request, HttpServletResponse response, String userType) throws ServletException, IOException {
//        RequestDispatcher dispatcher;
        switch (userType) {
            case "User":
            case "Staff":
                response.sendRedirect("home?action=list");
                break;
            case "Technician":
                response.sendRedirect("booking?action=requestList");
//                dispatcher = request.getRequestDispatcher("/staff.jsp");
//                dispatcher.forward(request, response);
                break;
            case "Technician_admin":
                response.sendRedirect("booking?action=requestList");
                break;
            case "Courier":
                break;
            default:
                response.sendRedirect("login?success=false");
        }
    }
}
