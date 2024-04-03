<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/2
  Time: 下午 05:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ include file="layout/top_nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cb" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>Booking Details</title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="js/cart.js"></script>
        <script src="js/checkout.js"></script>
        <script src="js/booking.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    </head>
    <body>

        <sql:setDataSource var="bookDetails" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/itp4511_db?useSSL=false"
                           user="root" password="root" />

        <div class="font-[sans-serif] bg-gray-50">
            <div class="grid lg:grid-cols-2 xl:grid-cols-3 gap-4 h-full">
                <div class="bg-[#3f3f3f] lg:h-screen lg:sticky lg:top-0">
                    <div class="relative h-full bg-slate-900">

                        <div class="p-8 lg:overflow-auto lg:h-[calc(100vh-60px)] ">
                            <h2 class="text-2xl font-bold text-white">Equipment Summary</h2>
                            <div class="space-y-6 mt-10">
                                <div class="grid sm:grid-cols-2 items-start gap-6">

                                    <sql:query dataSource="${bookDetails}" var="result">
                                        select * from booking right join
                                        bookingequipment on booking.bookingID = bookingequipment.bookingID
                                        LEFT JOIN equipment on bookingequipment.equipmentID = equipment.equipmentID
                                        where userID = ${sessionScope.userID} and booking.bookingID=${param.bookID};
                                    </sql:query>

                                    <cb:forEach var="b" items="${result.rows}">
                                        <div class="px-4 py-6 shrink-0 bg-gray-50 rounded-md">
                                            <img src="images/equipment/${b.equipmentID}.jpg"
                                                 class="w-full object-contain" />
                                        </div>
                                        <div class="p-2">
                                            <h3 class="text-3xl text-white">${b.equipmentName}</h3>

                                            <ul class="text-xs text-white space-y-3 mt-4">
                                                <li class="flex flex-wrap gap-4 text-2xl text-slate-400">${b.equipmentType}
                                                </li>
                                                <li class="flex flex-wrap gap-4 text-2xl text-red-500">${b.status}
                                                </li>
                                            </ul>
                                        </div>
                                    </cb:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xl:col-span-2 h-max rounded-md p-8 sticky top-0">
                    <h2 class="text-4xl font-bold text-[#333]">Booking Details</h2>
                    <div class="mt-10">
                        <div>
                            <h3 class="text-2xl font-bold text-[#333] mb-6">Personal Details</h3>
                            <div class="grid sm:grid-cols-2 gap-6">
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold">First Name</span>
                                    <input type="text" value="${sessionScope.userInfo.getfName()}" disabled
                                           class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="#bbb" stroke="#bbb"
                                         class="w-[18px] h-[18px] absolute right-4"
                                         viewBox="0 0 24 24">
                                        <circle cx="10" cy="7" r="6" data-original="#000000"></circle>
                                        <path
                                                d="M14 15H6a5 5 0 0 0-5 5 3 3 0 0 0 3 3h12a3 3 0 0 0 3-3 5 5 0 0 0-5-5zm8-4h-2.59l.3-.29a1 1 0 0 0-1.42-1.42l-2 2a1 1 0 0 0 0 1.42l2 2a1 1 0 0 0 1.42 0 1 1 0 0 0 0-1.42l-.3-.29H22a1 1 0 0 0 0-2z"
                                                data-original="#000000"></path>
                                    </svg>
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold">Last Name</span>
                                    <input type="text" value="${sessionScope.userInfo.getlName()}" disabled
                                           class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="#bbb" stroke="#bbb"
                                         class="w-[18px] h-[18px] absolute right-4"
                                         viewBox="0 0 24 24">
                                        <circle cx="10" cy="7" r="6" data-original="#000000"></circle>
                                        <path
                                                d="M14 15H6a5 5 0 0 0-5 5 3 3 0 0 0 3 3h12a3 3 0 0 0 3-3 5 5 0 0 0-5-5zm8-4h-2.59l.3-.29a1 1 0 0 0-1.42-1.42l-2 2a1 1 0 0 0 0 1.42l2 2a1 1 0 0 0 1.42 0 1 1 0 0 0 0-1.42l-.3-.29H22a1 1 0 0 0 0-2z"
                                                data-original="#000000"></path>
                                    </svg>
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold">Email</span>
                                    <input type="email" value="${sessionScope.userInfo.getEmail()}" disabled
                                           class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="#bbb" stroke="#bbb"
                                         class="w-[18px] h-[18px] absolute right-4"
                                         viewBox="0 0 682.667 682.667">
                                        <defs>
                                            <clipPath id="a" clipPathUnits="userSpaceOnUse">
                                                <path d="M0 512h512V0H0Z" data-original="#000000"></path>
                                            </clipPath>
                                        </defs>
                                        <g clip-path="url(#a)" transform="matrix(1.33 0 0 -1.33 0 682.667)">
                                            <path fill="none" stroke-miterlimit="10" stroke-width="40"
                                                  d="M452 444H60c-22.091 0-40-17.909-40-40v-39.446l212.127-157.782c14.17-10.54 33.576-10.54 47.746 0L492 364.554V404c0 22.091-17.909 40-40 40Z"
                                                  data-original="#000000"></path>
                                            <path
                                                    d="M472 274.9V107.999c0-11.027-8.972-20-20-20H60c-11.028 0-20 8.973-20 20V274.9L0 304.652V107.999c0-33.084 26.916-60 60-60h392c33.084 0 60 26.916 60 60v196.653Z"
                                                    data-original="#000000"></path>
                                        </g>
                                    </svg>
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold">Contact</span>
                                    <input type="number" value="${sessionScope.userInfo.getContact()}" disabled
                                           class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />
                                    <svg fill="#bbb" class="w-[18px] h-[18px] absolute right-4" viewBox="0 0 64 64">
                                        <path
                                                d="m52.148 42.678-6.479-4.527a5 5 0 0 0-6.963 1.238l-1.504 2.156c-2.52-1.69-5.333-4.05-8.014-6.732-2.68-2.68-5.04-5.493-6.73-8.013l2.154-1.504a4.96 4.96 0 0 0 2.064-3.225 4.98 4.98 0 0 0-.826-3.739l-4.525-6.478C20.378 10.5 18.85 9.69 17.24 9.69a4.69 4.69 0 0 0-1.628.291 8.97 8.97 0 0 0-1.685.828l-.895.63a6.782 6.782 0 0 0-.63.563c-1.092 1.09-1.866 2.472-2.303 4.104-1.865 6.99 2.754 17.561 11.495 26.301 7.34 7.34 16.157 11.9 23.011 11.9 1.175 0 2.281-.136 3.29-.406 1.633-.436 3.014-1.21 4.105-2.302.199-.199.388-.407.591-.67l.63-.899a9.007 9.007 0 0 0 .798-1.64c.763-2.06-.007-4.41-1.871-5.713z"
                                                data-original="#000000"></path>
                                    </svg>
                                </div>
                            </div>
                        </div>
                        <div class="mt-6">
                            <h3 class="text-2xl font-bold text-[#333] mb-6">Booking Details</h3>
                            <div class="grid sm:grid-cols-2 gap-6">
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold">Booking ID</span>
                                    <%--                                    <cc:set var="now" value="<%=new java.util.Date()%>" />--%>
                                    <%--                                    <sql:query dataSource="${booking}" var="result">--%>
                                    <%--                                        SELECT IFNULL(MAX(bookingID), 0) + 1 AS nextBookingID FROM booking;--%>
                                    <%--                                    </sql:query>--%>
                                    <%--                                    <input type="number" value="" disabled--%>
                                    <%--                                           class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />--%>
                                    <%--                                    <cc:forEach var="row" items="${result.rows}">--%>
                                    <input type="number" value="${param.bookID}" disabled id="bookID"
                                           class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />
                                    <%--                                    </cc:forEach>--%>
                                </div>
                                <sql:query dataSource="${bookDetails}" var="result">
                                    select * from booking where bookingID = ${param.bookID};
                                </sql:query>
                                <cb:forEach var="bd" items="${result.rows}">

                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold">Booking Date</span>
                                    <input type="date" name="bookDate" value="<fmt:formatDate pattern="yyyy-MM-dd"
                                                                                                                            value="${bd.bookingDate}" />"
                                           disabled
                                           id="bookDate"
                                           class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />

                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold">Pick-up date</span>
                                    <input type="date" name="pickUpDate" value="<fmt:formatDate pattern="yyyy-MM-dd"
                                                                                                                            value="${bd.pickupDate}" />"
                                           id="pickUpDate" disabled
                                           class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />

                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold">Return date</span>
                                    <input type="date" name="returnDate" value="<fmt:formatDate pattern="yyyy-MM-dd"
                                                                                                                            value="${bd.returnDate}" />"
                                           id="returnDate" disabled
                                           class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold">Booking Status</span>
                                        ${bd.bookingStatus}
                                </div>
                                <div class="relative flex items-center">
                                        <%--                                        <span class=" w-40 font-bold"></span>--%>
                                    <label for="reason" class="w-40 font-bold">Reject Reason</label>
                                    <textarea id="reason" name="reason" disabled
                                              class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none"
                                              rows="4" cols="50">${bd.rejectReason}</textarea>
                                </div>

                            </div>
                            <div class="flex gap-6 max-sm:flex-col mt-10">
                                <cb:if test="${bd.bookingStatus == 'Pending'}">
                                    <button type="button" id="cancel" onclick="cancelBooking()"
                                            class="rounded-md px-6 py-3 w-full text-xl font-semibold bg-red-500 hover:bg-orange-500 border-2 text-[#333]">
                                        Cancel Booking
                                    </button>
                                </cb:if>
                                    <%--                                <button type="button" id="bookingBtn"--%>
                                    <%--                                        class="rounded-md px-6 py-3 w-full text-sm font-semibold bg-[#333] text-white hover:bg-[#222]">--%>
                                    <%--                                    Complete Booking--%>
                                    <%--                                </button>--%>
                            </div>
                            </cb:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
