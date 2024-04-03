package ict.itp4511_assignment.utils;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/26 - 03 - 26 - 上午 01:25
 * @Description: ict.itp4511_assignment.utils
 * @version: 1.0
 */

import ict.itp4511_assignment.db.WishListDB;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/home.jsp", "/userProfile.jsp", "/wishList.jsp", "/checkout.jsp", "/bookingList.jsp"})
public class AuthenticationFilter implements Filter {

    public FilterConfig config;
    private WishListDB wishListDB;

    @Override
    public void init(FilterConfig config) throws ServletException {
        this.config = config;
        DBConnection conn = new DBConnection();
        wishListDB = new WishListDB(conn.getDbUrl(), conn.getDbUser(), conn.getDbPassword());
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

//        String loginURI = req.getContextPath() + "/login";

        boolean loggedIn = session != null && session.getAttribute("userInfo") != null;
//        boolean loginRequest = req.getRequestURI().equals(loginURI);

        if (loggedIn) {
            session.setAttribute("wishNotification", wishListDB.getAvailableWishList((int) session.getAttribute("userID")));
            chain.doFilter(request, response);
        } else {
            res.sendRedirect("login?success=false");
        }
    }

    @Override
    public void destroy() {
        this.config = null;
    }

}