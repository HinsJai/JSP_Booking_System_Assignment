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
import java.util.ArrayList;
import java.util.Objects;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/4/10 - 04 - 10 - 下午 08:17
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */
@WebServlet(name = "UserManagementController", urlPatterns = {"/userManagement"})
public class UserManagementController extends HttpServlet {
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
        boolean result = false;
        String json;
        int userID;

        if (session == null) {
            response.sendRedirect("login?success=false");
        } else {
            if (!Objects.equals((String) session.getAttribute("userType"), "Technician_admin")) {
                response.sendRedirect("login?success=false");
            }
            switch (action) {

                case "update":
                    userID = Integer.parseInt(request.getParameter("userID"));
                    String userRoot = request.getParameter("root");
                    String campus = request.getParameter("campus");
                    result = userDB.updateUser(userID, userRoot, campus);
                    if (result) {
                        json = "{\"update\":\"success\"}";
                    } else {
                        json = "{\"update\":\"fail\"}";
                    }
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                    break;

                case "userList":
                    session.setAttribute("page", "userList");
                    rd = getServletContext().getRequestDispatcher("/userManagement.jsp");
                    rd.forward(request, response);
                    break;

                case "search":
                    rd = getServletContext().getRequestDispatcher("/userManagement.jsp");
                    rd.forward(request, response);
                    break;
                case "delete":
                    userID = Integer.parseInt(request.getParameter("userID"));
                    result = userDB.deleteUser(userID);
                    if (result) {
                        json = "{\"delete\":\"success\"}";
                    } else {
                        json = "{\"delete\":\"fail\"}";
                    }
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                    break;
                case "createUser":
                    rd = getServletContext().getRequestDispatcher("/createUser.jsp");
                    rd.forward(request, response);
                    break;
                case "getMaxID":
                    int maxID = userDB.getMaxID();
                    json = "{\"maxID\":" + maxID + "}";
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                    break;

                case "addUserToTempList":
                    addToTempList(request, response, session);
                    json = "{\"addUserToTempList\":\"success\"}";
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                    break;

                case "removeTempUser":
                    int removeUserID = Integer.parseInt(request.getParameter("userID"));
                    ArrayList<UserInfoBean> userTempList = (ArrayList<UserInfoBean>) session.getAttribute("UserTempList");
                    for (UserInfoBean user : userTempList) {
                        if (user.getUserID() == removeUserID) {
                            userTempList.remove(user);
                            break;
                        }
                    }
                    session.setAttribute("UserTempList", userTempList);
                    json = "{\"removeTempUser\":\"success\"}";
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                    break;

                case "addUserTempToDB":
                    ArrayList<UserInfoBean> userTempLists = (ArrayList<UserInfoBean>) session.getAttribute("UserTempList");
                    for (UserInfoBean user : userTempLists) {
                        result = userDB.insertBatchUsers(user);
                        if (!result) {
                            json = "{\"addUserTempToDB\":\"fail\"}";
                            response.setContentType("application/json");
                            response.setCharacterEncoding("UTF-8");
                            response.getWriter().write(json);
                            return;
                        }
                    }
                    session.removeAttribute("UserTempList");
                    json = "{\"addUserTempToDB\":\"success\"}";
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                    break;
            }
        }
    }

    public void addToTempList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("userID"));
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");
        String root = request.getParameter("root");
        String campus = request.getParameter("campus");

        ArrayList<UserInfoBean> userTempList = (ArrayList<UserInfoBean>) session.getAttribute("UserTempList");
        if (userTempList == null) {
            userTempList = new ArrayList<>();
            UserInfoBean user = new UserInfoBean();
            user.setUserID(id);
            user.setEmail(email);
            user.setPassword(password);
            user.setlName(lName);
            user.setfName(fName);
            user.setGender(gender);
            user.setContact(Integer.parseInt(contact));
            user.setRoot(root);
            user.setCampus(campus);
            userTempList.add(user);
            session.setAttribute("UserTempList", userTempList);
        } else {
            UserInfoBean user = new UserInfoBean();
            user.setUserID(id);
            user.setEmail(email);
            user.setPassword(password);
            user.setlName(lName);
            user.setfName(fName);
            user.setGender(gender);
            user.setContact(Integer.parseInt(contact));
            user.setRoot(root);
            user.setCampus(campus);
            userTempList.add(user);
            session.setAttribute("UserTempList", userTempList);
        }
    }
}
