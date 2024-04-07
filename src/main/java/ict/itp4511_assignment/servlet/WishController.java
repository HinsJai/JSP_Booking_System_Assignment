package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.bean.EquipmentBean;
import ict.itp4511_assignment.bean.UserInfoBean;
import ict.itp4511_assignment.bean.WishCartEquipmentBean;
import ict.itp4511_assignment.db.ReserveCartDB;
import ict.itp4511_assignment.db.WishListDB;

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
 * @Date: 2024/3/30 - 03 - 30 - 上午 02:55
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */
@WebServlet(name = "WishController", urlPatterns = {"/wish"})
public class WishController extends HttpServlet {
    private WishListDB db;
    private ReserveCartDB reserveCartDB;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new WishListDB(dbUrl, dbUser, dbPassword);
        reserveCartDB = new ReserveCartDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        int userID = (int) session.getAttribute("userID");
        session.setAttribute("page", "wish");
        switch (action) {
            case "add":
                addToWish(request, response);
                break;
            case "list":
                fetchData(request, response, userID, session);
                break;
            case "remove":
                int equipmentId = Integer.parseInt(request.getParameter("equipmentId"));
                removeWish(request, response, userID, equipmentId);
                break;
            case "addToCart":
                addToCart(request, response, session, userID);
                break;
            default:
                response.sendRedirect("home?action=list");
        }

    }

    protected void addToWish(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int equipmentId = Integer.parseInt(request.getParameter("equipmentId"));
        HttpSession session = request.getSession(false);
        if (session != null) {
            UserInfoBean userBean = (UserInfoBean) session.getAttribute("userInfo");
            int userID = userBean.getUserID();
            boolean result = db.addWishList(userID, equipmentId);
            if (result) {
                response.sendRedirect("home?action=list&addWish=success");
            } else {
                response.sendRedirect("home?action=list&&addWish=failed");
            }
        } else {
            response.sendRedirect("login?success=false");
        }
    }

    protected void fetchData(HttpServletRequest request, HttpServletResponse response, int userID, HttpSession session) throws ServletException, IOException {
        RequestDispatcher rd;
        ArrayList<WishCartEquipmentBean> wishList = db.getWishList(userID);
        request.setAttribute("wishList", wishList);
        session.setAttribute("page", "wish");
        rd = getServletContext().getRequestDispatcher("/wishList.jsp");
        rd.forward(request, response);
    }

    protected void removeWish(HttpServletRequest request, HttpServletResponse response, int userID, int equipmentID) throws ServletException, IOException {
        boolean result = db.removeWish(userID, equipmentID);
        if (result) {
            response.sendRedirect("wish?action=list&removeWish=success");
        } else {
            response.sendRedirect("wish?action=list&removeWish=failed");
        }
    }

    protected void addToCart(HttpServletRequest request, HttpServletResponse response, HttpSession session, int userID) throws ServletException, IOException {
        int equipmentId = Integer.parseInt(request.getParameter("equipmentId"));
        boolean result = reserveCartDB.addToCart(userID, equipmentId);

        if (result) {
            ArrayList<EquipmentBean> cartList = reserveCartDB.showCart(userID);
            session.setAttribute("cartList", cartList);
            result = db.removeWish(userID, equipmentId);
            if (result) {
                response.sendRedirect("wish?action=list&addCart=success");
            } else {
                response.sendRedirect("wish?action=list&addCart=fail");
            }
        } else {
            response.sendRedirect("wish?action=list&addCart=fail");
        }
    }
}
