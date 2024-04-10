package ict.itp4511_assignment.servlet;

import ict.itp4511_assignment.bean.UserInfoBean;
import ict.itp4511_assignment.db.UserDB;

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
 * @Date: 2024/3/29 - 03 - 29 - 上午 01:43
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */
@WebServlet(name = "UserProfileController", urlPatterns = {"/userProfile"})
public class UserProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDB userDB;

    public void init() {
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        userDB = new UserDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        RequestDispatcher rd;
        HttpSession session = request.getSession(false);
        if (session != null) {
            UserInfoBean userBean = (UserInfoBean) session.getAttribute("userInfo");
            if (session.getAttribute("userInfo") != null) {
                switch (action) {
                    case "profile":
                        if (userBean != null) {
                            request.setAttribute("user", userBean);
                            session.setAttribute("page", "profile");
                            rd = getServletContext().getRequestDispatcher("/userProfile.jsp");
                            rd.forward(request, response);
                        }
                        break;
                    case "updatePassword":
                        String password = request.getParameter("password");
                        int userId = userBean.getUserID();
                        boolean updatePasswordResult = userDB.updateUserPassword(userId, password);
                        if (updatePasswordResult) {
                            response.sendRedirect("userProfile?action=profile&updatePassword=success");
                        } else {
                            response.sendRedirect("userProfile?action=profile&updatePassword=fail");
                        }
                        break;

                    case "updatePasswordPage":
                        response.sendRedirect("userProfile?action=profile&page=updatePassword");
                        break;

                    case "save":
                        String email = request.getParameter("email");
                        int phone = Integer.parseInt(request.getParameter("phone"));
                        String userID = request.getParameter("userID");
                        if (email == null || phone == 0) {
                            response.sendRedirect("userProfile?updateUser=fail");
                            return;
                        }
                        boolean updateResult = userDB.updateUserProfile(userID, email, phone);
                        if (updateResult) {
                            userBean.setEmail(email);
                            userBean.setContact(phone);
                            session.setAttribute("userInfo", userBean);
                            response.sendRedirect("userProfile?action=profile&updateUser=success");
                        } else {
                            response.sendRedirect("userProfile?action=profile&updateUser=fail");
                        }
                        break;
                }
            }
        } else {
            response.sendRedirect("login?success=false");
        }
    }
}

