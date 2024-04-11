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
 * @Date: 2024/4/12 - 04 - 12 - 上午 02:19
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */
@WebServlet(name = "analyticController", value = "/analytic")
public class analyticController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        RequestDispatcher rd;
        String json = "";
        if (session == null) {
            response.sendRedirect("login?success=false");
            return;
        }

        switch (action) {
            case "list":
                session.setAttribute("page", "analytic");
                rd = request.getRequestDispatcher("/analytic.jsp");
                rd.forward(request, response);
                break;
            case "changeCampus":
                String campus = request.getParameter("campusID");
                json = "{\"campusID\":\"" + campus + "\"}";
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;

        }
    }

}
