<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/3/26
  Time: 下午 05:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <ul>
            <c:if test="${1==1}" var="item">
                <li>test success!</li>
            </c:if>

        </ul>
    </body>
</html>
