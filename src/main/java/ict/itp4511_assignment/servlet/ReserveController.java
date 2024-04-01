package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.bean.EquipmentBean;
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
            case "showCart":
                showCart(request, response);
                break;
//            case "list":
//                fetchData(request, response);
//                break;
            case "removeCartItem":
                int equipmentID = Integer.parseInt(request.getParameter("id"));
                removeCartItem(request, response, equipmentID);
                break;
            case "checkout":
                HttpSession session = request.getSession(false);
                if (session == null) {
                    response.sendRedirect("login?success=false");
                    return;
                }
                session.setAttribute("page", "checkout");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/checkout.jsp");
                dispatcher.forward(request, response);
                break;
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
            ArrayList<EquipmentBean> cartList = db.showCart(userID);
            session.setAttribute("cartList", cartList);
            response.sendRedirect("home?action=list&addCart=success");
        } else {
            response.sendRedirect("home?action=list&addCart=fail");
        }
    }

    protected void removeCartItem(HttpServletRequest request, HttpServletResponse response, int equipmentID) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int userID = (int) session.getAttribute("userID");
        String page = (String) session.getAttribute("page");
        boolean result = db.removeFromCart(userID, equipmentID);
        String url = getCartPage(page);
        if (result) {
            ArrayList<EquipmentBean> cartList = db.showCart(userID);
            session.setAttribute("cartList", cartList);
            if (cartList.isEmpty()) {
                response.sendRedirect("home?action=list&removeCartItem=success");
                return;
            }
            response.sendRedirect(url + "&removeCartItem=success");
        } else {
            response.sendRedirect(url + "&removeCartItem=fail");
        }
    }

    protected void showCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int userID = (int) session.getAttribute("userID");
        ArrayList<EquipmentBean> cartList = db.showCart(userID);
        session.setAttribute("cartList", cartList);
//        RequestDispatcher rd = getServletContext().getRequestDispatcher("/home.jsp");
//        rd.forward(request, response);
        String page = (String) session.getAttribute("page");
        String url = getCartPage(page);
        response.sendRedirect(url);
    }

    protected String getCartPage(String page) {
        switch (page) {
            case "wish":
                return "wish?action=list&reserve=showCart";
            case "home":
                return "home?action=list&reserve=showCart";
            case "checkout":
                return "reserve?action=checkout";
            case "laptop":
                return "home?action=laptop&reserve=showCart";
            case "tablet":
                return "home?action=tablet&reserve=showCart";
            case "printer and scanner":
                return "home?action=printer_scanner&reserve=showCart";
            case "smartphone":
                return "home?action=phone&reserve=showCart";
            case "monitor":
                return "home?action=monitor&reserve=showCart";
            case "robot":
                return "home?action=robot&reserve=showCart";
            case "networking":
                return "home?action=networking&reserve=showCart";
            case "Audio-Visual":
                return "home?action=audio_visual&reserve=showCart";
            case "server":
                return "home?action=server&reserve=showCart";
            case "others":
                return "home?action=others&reserve=showCart";
            default:
                return "home?action=list&reserve=showCart";
        }
    }
}
