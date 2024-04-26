<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/2
  Time: 下午 03:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="layout/user_nav.jsp" %>
<html>
    <head>
        <title>Booking</title>
        <link rel="stylesheet" href="css/table.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <script src="./js/paging.js"></script>
        <script src="js/cart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10">
        </script>
        <script>
            $(document).ready(function () {
                $('#table').paging({limit: 5});
            });
        </script>
    </head>
    <body class="bg-gray-900">
        <sql:setDataSource var="booking" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/itp4511_db?useSSL=false"
                           user="root" password="root" />

        <div class="relative overflow-x-auto shadow-md ">
            <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400" id="table">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-3xl">
                            Booking ID
                        </th>
                        <th scope="col" class="px-6 py-3 text-3xl">
                            Booking Date
                        </th>
                        <th scope="col" class="px-6 py-3 text-3xl">
                            Pick-up Date
                        </th>
                        <th scope="col" class="px-6 py-3 text-3xl">
                            Return Date
                        </th>
                        <th scope="col" class="px-6 py-3 text-3xl">
                            Status
                        </th>
                        <th scope="col" class="px-6 py-3 text-3xl">
                            Action
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query dataSource="${booking}" var="result">
                        SELECT * FROM booking where userID = ${sessionScope.userID} ORDER BY CASE WHEN bookingStatus = 'Pending' THEN 0 ELSE 1 END, bookingStatus;
                    </sql:query>
                    <c:forEach var="row" items="${result.rows}">
                        <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                            <td class="px-6 py-4 text-2xl">
                                <c:out value="${row.bookingID}" />
                            </td>
                            <td class="px-6 py-4 text-2xl">
                                <c:out value="${row.bookingDate}" />
                            </td>
                            <td class="px-6 py-4 text-2xl">
                                <c:out value="${row.pickupDate}" />
                            </td>
                            <td class="px-6 py-4 text-2xl">
                                <c:out value="${row.returnDate}" />
                            </td>
                            <c:choose>
                                <c:when test="${row.bookingStatus == 'Pending'}">
                                    <td class="px-6 py-4">
                                        <span class="text-2xl text-black  bg-yellow-200  dark:bg-yellow-500  p-2 rounded-md">
                                                ${row.bookingStatus}
                                        </span>
                                    </td>
                                </c:when>
                                <c:when test="${row.bookingStatus == 'Approved'}">
                                    <td class="px-6 py-4 text-2xl">
                                        <span class="text-2xl text-black bg-green-200  dark:bg-green-500  p-2 rounded-md">
                                            <c:out value="${row.bookingStatus}" />
                                        </span>
                                    </td>
                                </c:when>
                                <c:when test="${row.bookingStatus == 'In delivery'}">
                                    <td class="px-6 py-4 text-2xl">
                                        <span class="text-2xl text-black bg-blue-200  dark:bg-blue-500  p-2 rounded-md">
                                            <c:out value="${row.bookingStatus}" />
                                        </span>
                                    </td>
                                </c:when>
                                <c:when test="${row.bookingStatus == 'Delivered'}">
                                    <td class="px-6 py-4 text-2xl">
                                        <span class="text-2xl text-black bg-gray-500  dark:bg-gray-500  p-2 rounded-md">
                                            <c:out value="${row.bookingStatus}" />
                                        </span>
                                    </td>
                                </c:when>

                                <c:when test="${row.bookingStatus == 'Declined'}">
                                    <td class="px-6 py-4 text-2xl">
                                        <span class="text-2xl text-black bg-red-500 dark:bg-red-500  p-2 rounded-md">
                                            <c:out value="${row.bookingStatus}" />
                                        </span>
                                    </td>
                                </c:when>

                                <c:when test="${ row.bookingStatus == 'UserReceived'}">
                                    <div class="flex w-40">
                                        <p class="text-black font-bold p-4 text-xl rounded rounded-lg bg-purple-500">
                                                ${ row.bookingStatus}
                                        </p>
                                    </div>
                                </c:when>

                                <c:when test="${row.bookingStatus == 'Completed'}">
                                    <td class="px-6 py-4 text-2xl">
                                        <span class="text-2xl  bg-blue-500 text-black  p-2 rounded-md">
                                            <c:out value="${row.bookingStatus}" />
                                        </span>
                                    </td>
                                </c:when>
                                <c:when test="${row.bookingStatus == 'Cancelled'}">
                                    <td class="px-6 py-4 ">
                                        <span class="text-2xl  bg-pink-500 text-black  p-2 rounded-md">
                                            <c:out value="${row.bookingStatus}" />
                                        </span>
                                    </td>
                                </c:when>
                            </c:choose>
                            <td class="px-6 py-4 text-2xl">
                                <a href="booking?action=details&bookID=${row.bookingID}"
                                   class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Details</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>
</html>
