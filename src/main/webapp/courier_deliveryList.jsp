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
        <script src="js/delivery.js"></script>
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

        <div class="flex">
            <select id="search-type"
                    class="font-bold text-xl flex-shrink-0 z-10 inline-flex items-center py-2  text-center text-gray-900 bg-gray-100 border border-gray-300  hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-100 dark:bg-gray-700 dark:hover:bg-gray-600 dark:focus:ring-gray-700 dark:text-white dark:border-gray-600"
            >
                <option value="all">All</option>
                <option value="deliveryID">Delivery ID</option>
                <option value="createDate">Create Date</option>
                <option value="userPickupDate">User Pick-up Date</option>
                <option value="status">Status</option>
            </select>

            <div class="relative w-full">
                <input type="search" id="keyword"
                       class="h-14 block p-2.5 w-full z-20 text-white bg-gray-600    focus:ring-blue-500 focus:border-blue-500 "
                       placeholder="Search by ID, status, create date, pick-up date" required />
                <button id="search" onclick="searchCourierDelivery()"
                        class="absolute top-0 end-0 p-4 text-base font-medium h-full text-white bg-blue-700  border border-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 0 ">
                    <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                         viewBox="0 0 20 20">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                    </svg>
                    <span class="sr-only">Search</span>
                </button>
            </div>
        </div>


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
                                    <c:choose>
                                        <c:when
                                                test="${param.action.equals('courierSearch')}">
                                            SELECT * FROM delivery WHERE ${param.type} LIKE "%${param.keyword}%";
                                        </c:when>
                                        <c:otherwise>
                                            SELECT * FROM delivery ORDER BY CASE WHEN status = 'Pending' THEN 0 ELSE 1 END, status;
                                        </c:otherwise>
                                    </c:choose>
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
