<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/3/26
  Time: 上午 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Welcome</title>
    </head>
    <body>
        <jsp:useBean id="userInfo" class="ict.itp4511_assignment.bean.UserInfoBean" scope="session" />
        <b>Hello,
            <jsp:getProperty name="userInfo" property="userID" />
        </b>
        <p>Welcome to the ICT</p>
        <form method="post" action="login">
            <input type="hidden" name="action" value="logout">
            <input type="submit" value="Logout" name="logoutButton">
        </form>
        <hr>
<%--        <a href="${pageContext.request.contextPath}/list?action=list">Brand</a>--%>


    </body>
</html>
