package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.db.DamageReportDB;
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
 * @Date: 2024/4/9 - 04 - 09 - 下午 10:31
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */
@WebServlet(name = "DamageReportController", urlPatterns = "/damageReport")
public class DamageReportController extends HttpServlet {
    private DamageReportDB damageReportDB;
    private EquipmentDB equipmentDB;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        damageReportDB = new DamageReportDB(dbUrl, dbUser, dbPassword);
        equipmentDB = new EquipmentDB(dbUrl, dbUser, dbPassword);
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
        int equipmentID;
        String json = "";
        if (session == null) {
            response.sendRedirect("login?success=false");
            return;
        }

        switch (action) {
            case "reportDamage":
                equipmentID = Integer.parseInt(request.getParameter("equipmentID"));
                int reportedBy = Integer.parseInt(session.getAttribute("userID").toString());
                String damageDescription = request.getParameter("damageDescription");
                int imageLength = Integer.parseInt(request.getParameter("imageLength"));
                result = damageReportDB.createDamageReport(equipmentID, reportedBy, damageDescription, imageLength);
                if (result) {
                    json = "{\"createDamageReport\":\"success\"}";
                } else {
                    json = "{\"createDamageReport\":\"fail\"}";
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;

            case "list":
                session.setAttribute("page", "damageReportList");
                rd = request.getRequestDispatcher("/damageReportList.jsp");
                rd.forward(request, response);
                break;
            case "details":
                session.setAttribute("page", "damageReportDetails");
                rd = request.getRequestDispatcher("/damageReportDetails.jsp");
                rd.forward(request, response);
                break;
            case "resolve":
                int damageReportID = Integer.parseInt(request.getParameter("damageReportID"));
                equipmentID = Integer.parseInt(request.getParameter("equipmentID"));
                result = damageReportDB.resolveDamageReport(damageReportID);
                if (result) {
                    result = equipmentDB.updateStatus("Available", equipmentID);
                    if (result) {
                        json = "{\"resolveDamageReport\":\"success\"}";
                    } else {
                        json = "{\"resolveDamageReport\":\"fail\"}";
                    }
                } else {
                    json = "{\"resolveDamageReport\":\"fail\"}";
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
        }
    }
}
