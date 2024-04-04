<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/3
  Time: 下午 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="layout/technician_nav.jsp" %>
<html>
    <head>
        <title>Booking Request</title>
        <link rel="stylesheet" href="css/table.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <script src="./js/paging.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10">
        </script>
        <script>
            $(document).ready(function () {
                $('#table').paging({limit: 5});
            });
        </script>
    </head>
    <body>
        <sql:setDataSource var="booking" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/itp4511_db?useSSL=false"
                           user="root" password="root" />

        <section class=" bg-slate-100 text-black w-screen h-full">

            <div class="flex flex-wrap">

                <main class="flex-1 bg-gray-900">

                    <div class="relative overflow-x-auto shadow-md ">
                        <table class="w-full text-sm text-left rtl:text-right text-white dark:text-gray-400" id="table">
                            <thead class="text-xl text-white uppercase bg-gray-50 dark:bg-gray-700 dark:text-white">
                                <tr>

                                    <th scope="col" class="px-6 py-3 text-2xl">
                                        Booking ID
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Booking Date
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Pick-up Date
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Return Date
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Booking Status
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Details
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                <sql:query dataSource="${booking}" var="result">
                                    SELECT * FROM booking ORDER BY CASE WHEN booking.bookingStatus = 'Pending' THEN 0 ELSE 1 END, bookingStatus;
                                </sql:query>

                                <c:forEach var="b" items="${result.rows}">

                                <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">

                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                        <p>${b.bookingID}</p>
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                            ${b.bookingDate}
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl ">
                                            ${b.pickupDate}
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl ">
                                            ${b.returnDate}
                                    </td>

                                    <td class="px-6 py-4">
                                        <c:choose>
                                            <c:when test="${ b.bookingStatus == 'Pending'}">
                                                <div class="flex w-40">
                                                    <p class="text-black font-bold p-4 text-xl rounded rounded-lg bg-yellow-500">
                                                            ${ b.bookingStatus}
                                                    </p>
                                                </div>
                                            </c:when>

                                            <c:when test="${ b.bookingStatus == 'Approved'}">
                                                <div class="flex w-40">
                                                    <p class="text-black font-bold p-4 text-xl rounded rounded-lg bg-green-500">
                                                            ${ b.bookingStatus}
                                                    </p>
                                                </div>
                                            </c:when>

                                            <c:when test="${ b.bookingStatus == 'Declined'}">
                                                <div class="flex w-40">
                                                    <p class="text-black font-bold p-4 text-xl rounded rounded-lg bg-red-500">
                                                            ${ b.bookingStatus}
                                                    </p>
                                                </div>
                                            </c:when>

                                            <c:when test="${ b.bookingStatus == 'Cancelled'}">
                                                <div class="flex w-40">
                                                    <p class="text-black font-bold p-4 text-xl rounded rounded-lg bg-pink-500">
                                                            ${ b.bookingStatus}
                                                    </p>
                                                </div>
                                            </c:when>
                                        </c:choose>
                                    </td>

                                    <td class="px-6 py-4 text-2xl">
                                        <a href="booking?action=requestDetails&bookingID=${b.bookingID}"
                                           class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Details</a>
                                    </td>
                                </tr>
                            </tbody>
                                <%--                            <c:if test="${param.addWish.equals('success')}">--%>
                                <%--                                <script>--%>
                                <%--                                    Swal.fire({--%>
                                <%--                                        title: 'Added',--%>
                                <%--                                        text: 'Equipment has been added to your wishlist',--%>
                                <%--                                        icon: 'success',--%>
                                <%--                                        confirmButtonText: 'OK'--%>
                                <%--                                    });--%>
                                <%--                                </script>--%>
                                <%--                            </c:if>--%>

                            </c:forEach>

                        </table>
                    </div>

                </main>
            </div>
        </section>
    </body>
</html>
