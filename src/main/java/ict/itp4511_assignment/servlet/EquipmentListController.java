package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.bean.EquipmentBean;
import ict.itp4511_assignment.bean.WishCartEquipmentBean;
import ict.itp4511_assignment.db.EquipmentDB;
import ict.itp4511_assignment.db.ReserveCartDB;

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

        HttpSession session = request.getSession(false);

        int userID = (int) session.getAttribute("userID");
        String userType = (String) session.getAttribute("userType");
        String campus = (String) session.getAttribute("campus");
        RequestDispatcher rd;


        switch (action) {
            case "list":
                ArrayList<WishCartEquipmentBean> equipments = db.getEquipmentList(userID, userType, campus);
                request.setAttribute("equipments", equipments);
                session.setAttribute("page", "home");

                ReserveCartDB cartDB = new ReserveCartDB("jdbc:mysql://localhost:3306/itp4511_db?useSSL=false", "root", "root");
                ArrayList<EquipmentBean> cartList = cartDB.showCart(userID);
                session.setAttribute("cartList", cartList);

                rd = getServletContext().getRequestDispatcher("/home.jsp");
                rd.forward(request, response);
                break;
            case "laptop":
                session.setAttribute("page", "laptop");
                fetchData(request, response, "laptop", userID, userType, campus);
                break;
            case "tablet":
                session.setAttribute("page", "tablet");
                fetchData(request, response, "tablet", userID, userType, campus);
                break;
            case "printer_scanner":
                session.setAttribute("page", "printer and scanner");
                fetchData(request, response, "printer and scanner", userID, userType, campus);
                break;
            case "phone":
                session.setAttribute("page", "smartphone");
                fetchData(request, response, "smartphone", userID, userType, campus);
                break;
            case "projector":
                session.setAttribute("page", "projector");
                fetchData(request, response, "Projector", userID, userType, campus);
                break;
            case "monitor":
                session.setAttribute("page", "monitor");
                fetchData(request, response, "monitor", userID, userType, campus);
                break;
            case "robot":
                session.setAttribute("page", "robot");
                fetchData(request, response, "robot", userID, userType, campus);
                break;
            case "networking":
                session.setAttribute("page", "networking");
                fetchData(request, response, "networking", userID, userType, campus);
                break;
            case "audio_visual":
                session.setAttribute("page", "Audio-Visual");
                fetchData(request, response, "Audio-Visual", userID, userType, campus);
                break;
            case "server":
                session.setAttribute("page", "server");
                fetchData(request, response, "server", userID, userType, campus);
                break;
            case "others":
                session.setAttribute("page", "others");
                fetchData(request, response, "others", userID, userType, campus);
                break;


        }
    }

    public void fetchData(HttpServletRequest request, HttpServletResponse response, String type, int userID, String userType, String campus) throws ServletException, IOException {
        RequestDispatcher rd;
        ArrayList<WishCartEquipmentBean> data = db.getEquipmentListByType(type, userID, userType, campus);
        request.setAttribute("equipments", data);
        rd = getServletContext().getRequestDispatcher("/home.jsp");
        rd.forward(request, response);
    }
}
