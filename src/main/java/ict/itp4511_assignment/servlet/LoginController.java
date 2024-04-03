package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.bean.EquipmentBean;
import ict.itp4511_assignment.bean.UserInfoBean;
import ict.itp4511_assignment.db.ReserveCartDB;
import ict.itp4511_assignment.db.UserDB;
import ict.itp4511_assignment.db.WishListDB;

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
 * @Date: 2024/3/25 - 03 - 25 - 下午 11:04
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */
@WebServlet(name = "LoginController", urlPatterns = {"/verify_login"})
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDB userDB;

    public void init() {
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        userDB = new UserDB(dbUrl, dbUser, dbPassword);
        WishListDB wishListDB = new WishListDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("loginAction");
        if (!isAuthenticated(request) && !("authenticate".equals(action))) {
            doLogin(request, response);
            return;
        }
        if ("authenticate".equals(action)) {
            doAuthenticate(request, response);
        } else if ("logout".equals(action)) {
            doLogout(request, response);
        } else {
            response.sendRedirect("login?success=false");
//            response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
        }

    }

    private void doAuthenticate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("email");
        String password = request.getParameter("password");
//        String targetURL;
        UserInfoBean userBean = userDB.isValidUser(username, password);

        if (userBean.getIsValidUser()) {
            HttpSession session = request.getSession(true);
            session.setAttribute("userInfo", userBean);
            session.setAttribute("userID", userBean.getUserID());
            session.setAttribute("campus", userBean.getCampus());
//            int userType = getIdentity(userBean.getRoot());
            session.setAttribute("userType", userBean.getRoot());

            ReserveCartDB db = new ReserveCartDB("jdbc:mysql://localhost:3306/itp4511_db?useSSL=false", "root", "root");
            ArrayList<EquipmentBean> cartList = db.showCart(userBean.getUserID());
            session.setAttribute("cartList", cartList);
            session.setAttribute("notificationDismiss", false);
            response.sendRedirect("login?success=true");
        } else {
            response.sendRedirect("login?success=false");
        }

    }

    private boolean isAuthenticated(HttpServletRequest request) {
        boolean result = false;
        HttpSession session = request.getSession();
        if (session.getAttribute("userInfo") != null) {
            result = true;
        }
        return result;
    }

    private void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.sendRedirect("login?logout=true");

    }

    private void doLogout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("userInfo");
            session.invalidate();
        }
        doLogin(request, response);
    }
}
