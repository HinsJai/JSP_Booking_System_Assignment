package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.db.EquipmentDB;

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
 * @Date: 2024/4/7 - 04 - 07 - 下午 04:56
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */

@WebServlet(name = "TechnicianEquipmentController", urlPatterns = {"/technicianEquipment"})
public class TechnicianEquipmentController extends HttpServlet {
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
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login?success=false");
            return;
        }

        RequestDispatcher rd;
        String action = request.getParameter("action");
        String json;
        switch (action) {
            case "list":
                rd = getServletContext().getRequestDispatcher("/technician_e_list.jsp");
                rd.forward(request, response);
                break;
            case "details":
                String equipmentID = request.getParameter("equipmentID");
                request.setAttribute("equipmentID", equipmentID);
                rd = getServletContext().getRequestDispatcher("/equipmentDetails.jsp");
                rd.forward(request, response);
                break;
            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String type = request.getParameter("type");
                String status = request.getParameter("status");
                String campus = request.getParameter("campus");
                String pDate = request.getParameter("pDate");
                String wPeriod = request.getParameter("wPeriod");
                int isPrivate = Integer.parseInt(request.getParameter("isPrivate"));
                boolean result = db.updateEquipment(id, name, type, status, campus, pDate, wPeriod, isPrivate);
//                if (result) {
//                    json = "{\"url\":\"technicianEquipment?action=list&equipmentID" + id + "&update=success\"}";
//                } else {
//                    json = "{\"url\":\"technicianEquipment?action=list&equipmentID" + id + "&update=failed\"}";
//                }
//                response.setContentType("application/json");
//                response.setCharacterEncoding("UTF-8");
//                response.getWriter().write(json);
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                result = db.deleteEquipment(id);
                if (result) {
                    json = "{\"delete\":\"success\"}";
                } else {
                    json = "{\"delete\":\"failed\"}";
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
            default:
                rd = getServletContext().getRequestDispatcher("/technician_e_list.jsp");
                rd.forward(request, response);
                break;

        }

    }

}
