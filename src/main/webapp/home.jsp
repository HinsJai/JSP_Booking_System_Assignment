<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/3/26
  Time: 上午 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="layout/top_nav.jsp" %>
<%--<%@ include file="bootstrap/bootstrp_css.jsp" %>--%>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--<%@ include file="css/nav.css" %>--%>

<html>
    <head>
        <title>Home</title>
    </head>

    <body>


        <section class=" bg-slate-100 text-black w-screen  h-full">
            <div class="flex flex-wrap">
                <%@ include file="layout/equipement_menu.jsp" %>

                <main class="flex-1">


                    <div class="relative overflow-x-auto shadow-md ">
                        <table class="w-full text-sm text-left rtl:text-right text-white dark:text-gray-400">
                            <thead class="text-xl text-white uppercase bg-gray-50 dark:bg-gray-700 dark:text-white">
                                <tr>
                                    <th scope="col" class="px-16 py-3">
                                        <span class="sr-only">Image</span>
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Equipment
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Type
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Status
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Action
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="e" items="${requestScope.equipments}">

                                    <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                                        <td class="p-4">
                                            <img src="#"
                                                 class="w-16 md:w-32 max-w-full max-h-full" alt="">
                                        </td>
                                        <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                                ${e.equipmentName}
                                        </td>
                                        <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                                ${e.equipmentType}
                                        </td>
                                        <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                                ${e.status}
                                        </td>
                                        <td class="px-6 py-4">
                                            <button class="bg-blue-400 p-4 text-xl rounded rounded-lg">
                                                <a href="#">
                                                    <span class="text-white font-bold">Reserve</span>
                                                </a>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </main>
            </div>
        </section>

        <%--        <jsp:useBean id="userInfo" class="ict.itp4511_assignment.bean.UserInfoBean" scope="session" />--%>
        <%--        <b>Hello,--%>
        <%--            <jsp:getProperty name="userInfo" property="userID" />--%>
        <%--        </b>--%>
        <%--        <p>Welcome to the ICT</p>--%>
        <%--        <form method="post" action="verify_login">--%>
        <%--            <button name="loginAction" value="logout">Logout</button>--%>
        <%--        </form>--%>
        <%--        <hr>--%>
        <!-- component -->
        <!-- follow me on twitter @asad_codes -->

        <%--        <%@ include file="bootstrap/bootstrap_js.jsp" %>--%>
    </body>
</html>
