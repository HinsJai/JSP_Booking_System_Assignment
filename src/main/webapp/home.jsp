<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/3/26
  Time: 上午 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ include file="layout/top_nav.jsp" %>

<%--<%@ include file="bootstrap/bootstrp_css.jsp" %>--%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%--<%@ include file="css/nav.css" %>--%>

<html>
    <head>
        <title>Home</title>
        <link rel="stylesheet" href="css/table.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <script src="./js/paging.js"></script>
        <script>
            $(document).ready(function () {
                $('#table').paging({limit: 5});
            });
        </script>

    </head>

    <body>

        <section class=" bg-slate-100 text-black w-screen  h-full">
            <div class="flex flex-wrap">
                <%@ include file="layout/equipement_menu.jsp" %>
                <main class="flex-1">

                    <div class="relative overflow-x-auto shadow-md ">
                        <table class="w-full text-sm text-left rtl:text-right text-white dark:text-gray-400" id="table">
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

                                        <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl ">
                                            <p class="${e.status=='CheckedOut'? 'text-red-500':'text-green-600'}"> ${e.status}</p>
                                        </td>

                                        <td class="px-6 py-4">
                                            <sql:setDataSource var="wishItems" driver="com.mysql.cj.jdbc.Driver"
                                                               url="jdbc:mysql://localhost:3306/ITP4511_DB?useSSL=false"
                                                               user="root" password="root" />

                                            <sql:query dataSource="${wishItems}" var="result">
                                                SELECT * from wishlist where userID = ${sessionScope.userID}
                                            </sql:query>

                                            <c:forEach var="w" items="${result.rows}" varStatus="status">
                                            <c:choose>
                                            <c:when test="${w.equipmentID==e.equipmentID && e.status=='CheckedOut'}">
                                            <button class=" p-4 text-xl rounded rounded-lg bg-red-500 hover:bg-orange-500"
                                                    disabled>
                                                    <c:set var="break" value="true"/>
                                                </c:when>
                                                <c:when test="${w.equipmentID!=e.equipmentID && e.status=='Available'}">
                                                <button class=" p-4 text-xl rounded rounded-lg bg-green-500 hover:bg-orange-500">
                                                    </c:when>
                                                    <c:otherwise>
                                                    <button class=" p-4 text-xl rounded rounded-lg bg-blue-500 hover:bg-orange-500">
                                                        </c:otherwise>
                                                        </c:choose>
                                                        <c:if test="${break == true}">
                                                            <!-- Skip the rest of the loop by setting the loop index to its last value -->
                                                            <c:set var="status.index" value="${status.last ? 1 : 0}" />
                                                        </c:if>


                                                        <c:choose>
                                                            <c:when test="${w.equipmentID==e.equipmentID && e.status=='CheckedOut'}">
                                                                <%--                                                                <a href="wish?equipmentId=${e.equipmentID}">--%>
                                                                <span class=" font-bold  text-white">In Wish</span>
                                                                <%--                                                                </a>--%>
                                                            </c:when>
                                                            <c:when test="${w.equipmentID!=e.equipmentID && e.status=='CheckedOut'}">
                                                                <a href="wish?equipmentId=${e.equipmentID}">
                                                                    <span class=" font-bold  text-white">Add Wish</span>
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="">
                                                                    <span class=" font-bold  text-white">Reserve</span>
                                                                </a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </button>
                                                    </c:forEach>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </main>
            </div>
        </section>
    </body>
</html>
