<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/11
  Time: 下午 09:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="layout/courier_nav.jsp" %>
<%@ include file="deliveryRequestNotification.jsp" %>

<html>
    <head>
        <title>Delivery List</title>
        <link rel="stylesheet" href="css/table.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <script src="./js/paging.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script>
            $(document).ready(function () {
                $('#table').paging({limit: 5});
            });
        </script>
    </head>
    <body>
        <sql:setDataSource var="delivery" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/itp4511_db?useSSL=false"
                           user="root" password="root" />
        <section class=" bg-slate-900 text-black w-screen h-full">

            <div class="flex flex-wrap">

                <main class="flex-1 bg-gray-900">

                    <div class="relative overflow-x-auto shadow-md ">
                        <table class="w-full text-sm text-left rtl:text-right text-white dark:text-gray-400" id="table">
                            <thead class="text-xl text-white uppercase bg-gray-50 dark:bg-gray-700 dark:text-white">
                                <tr>

                                    <th scope="col" class="px-6 py-3 text-2xl">
                                        Delivery No.
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Create Date
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Courier ID
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Booking ID
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        User Pickup Date
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Delivery Address
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Status
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Action
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                <sql:query dataSource="${delivery}" var="result">
                                    SELECT * FROM delivery ORDER BY CASE WHEN status = 'Pending' THEN 0 ELSE 1 END, status;
                                </sql:query>

                                <c:forEach var="d" items="${result.rows}">

                                <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">

                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                        <p>${d.deliveryID}</p>
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                            ${d.createDate}
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl ">
                                            ${d.courierID}
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl ">
                                            ${d.bookingID}
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl ">
                                            ${d.userPickupDate}
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl ">
                                            ${d.deliveryAddress}
                                    </td>


                                    <td class="px-6 py-4">
                                        <c:choose>
                                            <c:when test="${ d.status == 'Pending'}">
                                                <div class="flex w-40">
                                                    <p class="text-black font-bold p-4 text-xl rounded rounded-lg bg-yellow-500">
                                                            ${ d.status}
                                                    </p>
                                                </div>
                                            </c:when>

                                            <c:when test="${ d.status == 'InTransit'}">
                                                <div class="flex w-40">
                                                    <p class="text-black font-bold p-4 text-xl rounded rounded-lg bg-green-500">
                                                            ${ d.status}
                                                    </p>
                                                </div>
                                            </c:when>

                                            <c:when test="${ d.status == 'Delivered'}">
                                                <div class="flex w-40">
                                                    <p class="text-black font-bold p-4 text-xl rounded rounded-lg bg-blue-500">
                                                            ${d.status}
                                                    </p>
                                                </div>
                                            </c:when>

                                            <c:when test="${ d.status == 'Cancelled'}">
                                                <div class="flex w-40">
                                                    <p class="text-black font-bold p-4 text-xl rounded rounded-lg bg-red-500">
                                                            ${ d.status}
                                                    </p>
                                                </div>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td class="px-6 py-4 text-2xl">
                                        <a href="delivery?action=deliveryNote&deliveryID=${d.deliveryID}"
                                           class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Details</a>
                                    </td>
                                </tr>
                            </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </main>
            </div>
        </section>

    </body>
</html>
