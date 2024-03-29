package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.bean.UserInfoBean;
import ict.itp4511_assignment.db.WishListDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/30 - 03 - 30 - 上午 02:55
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */
@WebServlet(name = "WishController", urlPatterns = {"/wish"})
public class WishController extends HttpServlet {
    private WishListDB db;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new WishListDB(dbUrl, dbUser, dbPassword);
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
}
