<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/8
  Time: 下午 05:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ include file="layout/technician_nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>Arrange Delivery</title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/delivery.js"></script>
    </head>
    <body>
        <sql:setDataSource var="bookRequest" driver="com.mysql.cj.jdbc.Driver"
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

                                    <sql:query dataSource="${bookRequest}" var="result">
                                        select * from booking right join
                                        bookingequipment on booking.bookingID = bookingequipment.bookingID
                                        LEFT JOIN equipment on bookingequipment.equipmentID = equipment.equipmentID
                                        where booking.bookingID=${param.bookingID};
                                    </sql:query>

                                    <cr:forEach var="b" items="${result.rows}">
                                        <div hidden>
                                            <input type="text" id="bookingID" value="${b.bookingID}">
                                        </div>
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
                                            <div class="flex justify-end mt-6">
                                                <a href="technicianEquipment?action=details&equipmentID=${b.equipmentID}"
                                                   class="text-black bg-yellow-500 p-4 rounded-md hover:bg-blue-500 font-bold">
                                                    Details
                                                </a>
                                            </div>
                                        </div>
                                    </cr:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="xl:col-span-2 h-max rounded-md p-8 sticky top-0">
                    <sql:query dataSource="${bookRequest}" var="result">
                        select * from userinfo right join
                        booking on booking.userID = userinfo.userID
                        where booking.bookingID=${param.bookingID};
                    </sql:query>

                    <h2 class="text-4xl font-bold text-[#333]">Delivery arrangement</h2>
                    <div class="mt-10">
                        <cr:forEach var="bd" items="${result.rows}">
                        <div>
                            <h3 class="text-2xl font-bold text-[#333] mb-6">Consignee Details</h3>
                            <div class="grid sm:grid-cols-2 gap-6">
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold">First Name</span>
                                    <input type="text" value="${bd.fName}" disabled
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
                                <div hidden>
                                    <input type="text" value="${bd.userID}" id="userID">
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold">Last Name</span>
                                    <input type="text" value="${bd.lName}" disabled
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
                                    <input type="email" value="${bd.email}" disabled
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
                                    <input type="number" value="${bd.contact}" disabled
                                           class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />
                                    <svg fill="#bbb" class="w-[18px] h-[18px] absolute right-4" viewBox="0 0 64 64">
                                        <path
                                                d="m52.148 42.678-6.479-4.527a5 5 0 0 0-6.963 1.238l-1.504 2.156c-2.52-1.69-5.333-4.05-8.014-6.732-2.68-2.68-5.04-5.493-6.73-8.013l2.154-1.504a4.96 4.96 0 0 0 2.064-3.225 4.98 4.98 0 0 0-.826-3.739l-4.525-6.478C20.378 10.5 18.85 9.69 17.24 9.69a4.69 4.69 0 0 0-1.628.291 8.97 8.97 0 0 0-1.685.828l-.895.63a6.782 6.782 0 0 0-.63.563c-1.092 1.09-1.866 2.472-2.303 4.104-1.865 6.99 2.754 17.561 11.495 26.301 7.34 7.34 16.157 11.9 23.011 11.9 1.175 0 2.281-.136 3.29-.406 1.633-.436 3.014-1.21 4.105-2.302.199-.199.388-.407.591-.67l.63-.899a9.007 9.007 0 0 0 .798-1.64c.763-2.06-.007-4.41-1.871-5.713z"
                                                data-original="#000000"></path>
                                    </svg>
                                </div>

                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold">Campus</span>
                                    <input type="text" value="${bd.campusID}" disabled
                                           class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="#bbb" stroke="#bbb"
                                         class="w-[18px] h-[18px] absolute right-4"
                                         viewBox="0 0 213.195 213.195" xml:space="preserve">
                                        <circle cx="10" cy="7" r="6" data-original="#000000"></circle>
                                        <path d="M210.856,203.383l-25.689-79.277c-1.002-3.093-3.884-5.188-7.135-5.188h-18.135c8.12-14.714,13.953-32.089,13.953-51.658 C173.85,30.173,143.68,0,106.596,0c-37.081,0-67.25,30.173-67.25,67.26c0,19.569,5.833,36.944,13.952,51.658H35.164 c-3.252,0-6.132,2.095-7.135,5.188L2.34,203.383c-0.74,2.283-0.342,4.782,1.069,6.723c1.411,1.941,3.666,3.089,6.066,3.089h194.246 c2.4,0,4.654-1.148,6.066-3.089C211.198,208.165,211.595,205.666,210.856,203.383z M106.596,15c28.813,0,52.254,23.444,52.254,52.26 c0,46.04-39.284,79.696-52.262,89.557C93.6,146.983,54.346,113.433,54.346,67.26C54.346,38.444,77.785,15,106.596,15z M19.789,198.195l20.829-64.277h22.295c17.32,23.623,38.092,37.444,39.58,38.417c1.247,0.815,2.675,1.222,4.104,1.222 c1.429,0,2.857-0.407,4.104-1.222c1.486-0.972,22.261-14.794,39.582-38.417h22.297l20.828,64.277H19.789z"></path>

                                    </svg>

                                </div>
                            </div>
                        </div>

                        <div class="mt-6">

                            <sql:query dataSource="${bookRequest}" var="r">
                                SELECT COALESCE(MAX(deliveryID) + 1, 1) AS next_id FROM delivery;
                            </sql:query>

                            <cr:forEach var="d" items="${r.rows}">


                                <h3 class="text-2xl font-bold text-[#333] mb-6">Delivery Details</h3>
                                <div class="grid sm:grid-cols-2 gap-6">
                                    <div class="relative flex items-center">
                                        <span class=" w-40 font-bold">Delivery No.</span>
                                        <input type="number" value="${d.next_id}" disabled id="deliveryID"
                                               class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />
                                    </div>

                                    <div class="relative flex items-center">
                                        <span class=" w-40 font-bold">Pick-up date</span>
                                        <input type="date" name="pickupDate" value="<fmt:formatDate pattern="yyyy-MM-dd"
                                                                                                                            value="${bd.pickupDate}" />"
                                               id="pickupDate" disabled
                                               class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />

                                    </div>

                                    <div class="relative flex items-center">
                                        <span class=" w-40 font-bold">Pick-up Place</span>
                                        <input type="text" value="${bd.pickupPlace}" disabled id="pickupPlace"
                                               class="px-4 py-3.5 bg-white text-[#333] w-full text-sm border-b-2 focus:border-[#333] outline-none" />
                                    </div>

                                </div>
                            </cr:forEach>

                            <div class="flex gap-6 max-sm:flex-col mt-10">
                                <button type="button" onclick="generateDeliveryNote()"
                                        class="rounded-md px-6 py-3 w-full text-xl font-semibold bg-blue-500 hover:bg-orange-500 border-2 text-[#333]">
                                    Generate Delivery Note
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </cr:forEach>
    </body>
</html>
