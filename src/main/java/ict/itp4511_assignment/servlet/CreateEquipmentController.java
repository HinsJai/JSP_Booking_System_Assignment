package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.bean.EquipmentBean;
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
 * @Date: 2024/4/5 - 04 - 05 - 下午 10:21
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */

@WebServlet(name = "CreateEquipmentController", urlPatterns = {"/createEquipment"})
public class CreateEquipmentController extends HttpServlet {
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
        RequestDispatcher rd;
        String json;
        if (session == null) {
            response.sendRedirect("login?success=false");
            return;
        }
        switch (request.getParameter("action")) {
            case "getMaxID":
                int maxID = db.getMaxID();
                json = "{\"maxID\":" + maxID + "}";
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;

            case "insertEquipment":
                session.setAttribute("page", "insertEquipment");
                rd = request.getRequestDispatcher("/InsertEquipment.jsp");
                rd.forward(request, response);
                break;

            case "addToTempList":
                addToTempList(request, response, session);
                json = "{\"url\":\"createEquipment?action=insertEquipment\"}";
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;

            case "removeEquipment":
                removeEquipment(request, response, session);
                json = "{\"url\":\"createEquipment?action=insertEquipment\"}";
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;

            case "addEquipmentToDB":
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                ArrayList<EquipmentBean> EquipmentTempList = (ArrayList<EquipmentBean>) session.getAttribute("EquipmentTempList");
                for (EquipmentBean equipment : EquipmentTempList) {
                    boolean result = db.insertNewEquipment(equipment);
                    if (!result) {
                        json = "{\"url\":\"createEquipment?action=insertEquipment&insertEquipment=failed\"}";
                        response.getWriter().write(json);
                        return;
                    }
                }
                session.removeAttribute("EquipmentTempList");
                json = "{\"url\":\"createEquipment?action=insertEquipment&insertEquipment=success\"}";
                response.getWriter().write(json);
                break;
        }
    }

    public void addToTempList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String sNo = request.getParameter("sNo");
        String pDate = request.getParameter("pDate");
        int wPeriod = Integer.parseInt(request.getParameter("wPeriod"));
        String status = request.getParameter("status");
        int isPrivate = Integer.parseInt(request.getParameter("isPrivate"));
        String campus = request.getParameter("campus");

        ArrayList<EquipmentBean> EquipmentTempList = (ArrayList<EquipmentBean>) session.getAttribute("EquipmentTempList");
        if (EquipmentTempList == null) {
            EquipmentTempList = new ArrayList<>();
            EquipmentBean equipment = new EquipmentBean();
            equipment.setEquipmentID(Integer.parseInt(id));
            equipment.setEquipmentName(name);
            equipment.setEquipmentType(type);
            equipment.setSerialNumber(sNo);
            equipment.setPurchaseDate(pDate);
            equipment.setWarrantyPeriod(wPeriod);
            equipment.setStatus(status);
            equipment.setIsPrivate(isPrivate);
            equipment.setCampusID(campus);
            EquipmentTempList.add(equipment);
            session.setAttribute("EquipmentTempList", EquipmentTempList);
        } else {
            EquipmentBean equipment = new EquipmentBean();
            equipment.setEquipmentID(Integer.parseInt(id));
            equipment.setEquipmentName(name);
            equipment.setEquipmentType(type);
            equipment.setSerialNumber(sNo);
            equipment.setPurchaseDate(pDate);
            equipment.setWarrantyPeriod(wPeriod);
            equipment.setStatus(status);
            equipment.setIsPrivate(isPrivate);
            equipment.setCampusID(campus);
            EquipmentTempList.add(equipment);
            session.setAttribute("EquipmentTempList", EquipmentTempList);
        }
    }

    public void removeEquipment(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        ArrayList<EquipmentBean> EquipmentTempList = (ArrayList<EquipmentBean>) session.getAttribute("EquipmentTempList");
        for (EquipmentBean equipment : EquipmentTempList) {
            if (equipment.getEquipmentID() == id) {
                EquipmentTempList.remove(equipment);
                break;
            }
        }
        session.setAttribute("EquipmentTempList", EquipmentTempList);
    }
}
