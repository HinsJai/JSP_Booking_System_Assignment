package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.bean.WishEquipmentBean;
import ict.itp4511_assignment.db.EquipmentDB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/28 - 03 - 28 - 下午 08:07
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */

@WebServlet(name = "EquipmentListController", urlPatterns = {"/home"})
public class EquipmentListController extends HttpServlet {
    private EquipmentDB db;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new EquipmentDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
//        String id = null;
        HttpSession session = request.getSession(false);
        int userID = (int) session.getAttribute("userID");
        int userType = (int) session.getAttribute("userType");
        String campus = (String) session.getAttribute("campus");
        RequestDispatcher rd;
        switch (action) {
            case "list":
                ArrayList<WishEquipmentBean> equipments = db.getEquipmentList(userID, userType, campus);
                request.setAttribute("equipments", equipments);
                rd = getServletContext().getRequestDispatcher("/home.jsp");
                rd.forward(request, response);
                break;
            case "laptop":
                fetchData(request, response, "laptop", userID, userType, campus);
                break;
            case "tablet":
                fetchData(request, response, "tablet", userID, userType, campus);
                break;
            case "printer_scanner":
                fetchData(request, response, "printer and scanner", userID, userType, campus);
                break;
            case "phone":
                fetchData(request, response, "smartphone", userID, userType, campus);
                break;
            case "monitor":
                fetchData(request, response, "monitor", userID, userType, campus);
                break;
            case "robot":
                fetchData(request, response, "robot", userID, userType, campus);
                break;
            case "networking":
                fetchData(request, response, "networking", userID, userType, campus);
                break;
            case "audio_visual":
                fetchData(request, response, "Audio-Visual", userID, userType, campus);
                break;
            case "server":
                fetchData(request, response, "server", userID, userType, campus);
                break;
            case "others":
                fetchData(request, response, "others", userID, userType, campus);
                break;
        }
    }

    public void fetchData(HttpServletRequest request, HttpServletResponse response, String type, int userID, int userType, String campus) throws ServletException, IOException {
        RequestDispatcher rd;
        ArrayList<WishEquipmentBean> data = db.getEquipmentListByType(type, userID, userType, campus);
        request.setAttribute("equipments", data);
        rd = getServletContext().getRequestDispatcher("/home.jsp");
        rd.forward(request, response);
    }
}
