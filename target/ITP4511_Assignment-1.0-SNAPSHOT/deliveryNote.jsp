<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/8
  Time: 下午 09:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cd" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="deliveryRequestNotification.jsp" %>
<cd:if test="${ sessionScope.userType == 'Technician_admin' || sessionScope.userType == 'Technician'}">
    <%@ include file="layout/technician_nav.jsp" %>
</cd:if>
<cd:if test="${ sessionScope.userType == 'Courier' }">
    <%@ include file="layout/courier_nav.jsp" %>
</cd:if>

<html>
    <head>
        <title>Delivery Note</title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/delivery.js"></script>

    </head>
    <body class="bg-gray-900">
        <sql:setDataSource var="deliveryNote" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/itp4511_db?useSSL=false"
                           user="root" password="root" />

        <sql:query dataSource="${deliveryNote}" var="result">
            select * from delivery right join
            booking on delivery.bookingID = booking.bookingID
            LEFT JOIN userinfo on userinfo.userID = booking.userID
            where delivery.deliveryID=${param.deliveryID};
        </sql:query>

        <cd:forEach var="d" items="${result.rows}">

            <div class="bg-white rounded-lg shadow-lg px-8 py-10 max-w-xl mx-auto mt-4">
                <div class="flex items-center justify-between mb-8">
                    <div class="flex items-center">
                        <img class="h-16 w-50 mr-2" src="images/HKIIT_logo.png"
                             alt="Logo" />
                        <div class="text-gray-700 font-semibold text-4xl">HKITI</div>
                    </div>
                    <div class="text-gray-700">
                        <div class="font-bold text-xl mb-2">Delivery Note</div>
                        <div class="text-sm">Date: ${d.createDate}</div>
                        <div class="text-sm">Delivery No. #: ${d.deliveryID}</div>
                    </div>
                </div>
                <div class=" pb-4 mb-4">
                    <h2 class="text-2xl font-bold mb-4">Bill To:</h2>
                    <div class="text-gray-700 mb-2"><span
                            class="font-semibold">Consignee Name:</span> ${d.fName} ${d.lName}
                    </div>
                    <div class="text-gray-700 mb-2"><span
                            class="font-semibold">Delivery Address: </span>${d.deliveryAddress}</div>
                    <div class="text-gray-700 mb-2"><span class="font-semibold">Contact: </span>${d.contact}</div>
                    <div class="text-gray-700"><span class="font-semibold">Email: </span>${d.email}</div>
                </div>
                <div class="border-b-2 border-gray-300 pb-8 mb-8">
                    <h2 class="text-2xl font-bold mb-4">Ship From</h2>
                    <div class="text-gray-700 mb-2"><span
                            class="font-semibold">Courier ID:</span> ${d.courierID}
                    </div>
                    <cd:if test="${d.courierID != null}">
                        <sql:query dataSource="${deliveryNote}" var="result">
                            select * from userInfo where userID=${d.courierID};
                        </sql:query>
                        <cd:forEach var="c" items="${result.rows}">
                            <div class="text-gray-700 mb-2"><span
                                    class="font-semibold">Courier Name:</span> ${c.fName} ${c.lName}
                            </div>
                            <div class="text-gray-700 mb-2"><span
                                    class="font-semibold">Contact:</span> ${c.contact}
                            </div>
                        </cd:forEach>
                    </cd:if>
                </div>
                <div class="border-b-2 border-gray-300 pb-8 mb-8">
                    <h2 class="text-2xl font-bold mb-4">Request Details</h2>
                    <div class="text-gray-700 mb-2"><span
                            class="font-semibold">Consignee pickup Date: </span><span
                            class="text-red-500">${d.userPickupDate}</span>
                    </div>
                    <div class="text-gray-700 mb-2"><span
                            class="font-semibold">Status: </span>
                        <span class="text-red-500">${d.status}</span>
                    </div>
                </div>
                <table class="w-full text-left mb-8">
                    <thead>
                        <tr>
                            <th class="text-gray-700 font-bold uppercase py-2">Equipment ID</th>
                            <th class="text-gray-700 font-bold uppercase py-2">Equipment</th>
                            <th class="text-gray-700 font-bold uppercase py-2">Type</th>
                            <th class="text-gray-700 font-bold uppercase py-2">Location</th>
                        </tr>
                    </thead>
                    <sql:query dataSource="${deliveryNote}" var="result">
                        select * from booking right join
                        bookingequipment on booking.bookingID = bookingequipment.bookingID
                        LEFT JOIN equipment on bookingequipment.equipmentID = equipment.equipmentID
                        where booking.bookingID=${d.bookingID};
                    </sql:query>
                    <tbody>
                        <cd:forEach var="e" items="${result.rows}">
                            <tr>
                                <td class="py-4 text-gray-700">${e.equipmentID}</td>
                                <td class="py-4 text-gray-700">${e.equipmentName}</td>
                                <td class="py-4 text-gray-700">${e.equipmentType}</td>
                                <td class="py-4 text-gray-700">${e.campusID}</td>
                            </tr>
                        </cd:forEach>
                    </tbody>
                </table>
                <cd:if test="${sessionScope.userType == 'Courier' && d.status =='Pending'}">
                    <div>
                        <button class="bg-green-500 w-full p-2 rounded-md font-bold hover:bg-orange-500"
                                onclick="acceptDeliveryRequest(${d.deliveryID},${sessionScope.userID})">
                            Accept
                        </button>
                    </div>
                </cd:if>
                <cd:if test="${sessionScope.userType == 'Courier' && d.status =='InTransit'}">
                    <div>
                        <button class="bg-blue-500 w-full p-2 rounded-md font-bold hover:bg-orange-500"
                                onclick="completeDelivery(${d.deliveryID},${d.bookingID})">
                            Complete
                        </button>
                    </div>
                </cd:if>
            </div>
            <cd:if test="${param.accept.equals('success')}">
                <script>
                    Swal.fire({
                        title: 'Accepted',
                        text: 'Delivery Request Accepted!',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    });
                </script>
            </cd:if>
            <cd:if test="${param.complete.equals('success')}">
                <script>
                    Swal.fire({
                        title: 'Completed',
                        text: 'Delivery Request has been completed!',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    });
                </script>
            </cd:if>
        </cd:forEach>

    </body>
</html>
