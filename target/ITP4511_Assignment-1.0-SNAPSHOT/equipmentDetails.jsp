<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/7
  Time: 下午 07:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ include file="layout/technician_nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="ce" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <head>
        <title>Equipment Details</title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/equipmentDetails.js"></script>
    </head>
    <body class="bg-gray-200">
        <sql:setDataSource var="equipmentDetails" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/itp4511_db?useSSL=false"
                           user="root" password="root" />

        <div class="font-[sans-serif] bg-gray-200">
            <div class="grid lg:grid-cols-2 xl:grid-cols-3 gap-4 h-full">
                <div class="bg-[#3f3f3f] lg:h-screen lg:sticky lg:top-0">
                    <div class="relative h-full bg-slate-900">

                        <div class="p-8 lg:overflow-auto lg:h-[calc(100vh-60px)] ">
                            <h2 class="text-2xl font-bold text-white">Image</h2>
                            <div class="space-y-6 mt-10">
                                <div class="grid sm:grid-cols-1 items-start gap-6">

                                    <sql:query dataSource="${equipmentDetails}" var="result">
                                        select * from equipment where equipmentID=${requestScope.equipmentID}
                                    </sql:query>

                                    <ce:forEach var="e" items="${result.rows}">
                                    <div class="px-4 py-6 shrink-0 bg-gray-50 rounded-md">
                                            <%--                                        <img src="images/equipment/${e.equipmentID}.jpg"--%>
                                            <%--                                             class="w-full object-contain" />--%>
                                        <img src="./images/equipment/${e.equipmentID}.jpg?time=<%=System.currentTimeMillis()%>"
                                             class="w-full object-contain" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xl:col-span-2 h-max rounded-md p-8 sticky top-0">

                    <h2 class="text-4xl font-bold text-[#333]">Equipment Details</h2>
                    <div class="mt-10">
                        <div>
                            <div class="grid sm:grid-cols-2 gap-6">
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold text-xl">ID</span>
                                    <input type="text" value="${e.equipmentID}" disabled id="id"
                                           class="px-4 py-3.5 bg-white text-base w-full  border-b-2 focus:border-[#333] outline-none" />
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold text-xl">Name</span>
                                    <input type="text" value="${e.equipmentName}" disabled id="name"
                                           class="px-4 py-3.5 bg-white text-base w-full  border-b-2 focus:border-[#333] outline-none" />
                                </div>
                                <div class="relative flex items-center">
                                    <label for="type" class="w-40 font-bold text-xl">Type</label>
                                    <select name="" id="type" disabled
                                            class="px-4 py-3.5 bg-white  w-full text-base border-b-2 focus:border-[#333] outline-none">
                                        <option value="Laptop" ${e.equipmentType == "Laptop" ? 'selected="selected"' : ''} >
                                            Laptop
                                        </option>
                                        <option value="Tablet"  ${e.equipmentType == "Tablet" ? 'selected="selected"' : ''}>
                                            Tablet
                                        </option>
                                        <option value="Printer and Scanner" ${e.equipmentType == "Printer and Scanner" ? 'selected="selected"' : ''} >
                                            Printer and Scanner
                                        </option>
                                        <option value="SmartPhone" ${e.equipmentType == "SmartPhone" ? 'selected="selected"' : ''}>
                                            SmartPhone
                                        </option>
                                        <option value="Projector" ${e.equipmentType == "Projector" ? 'selected="selected"' : ''}>
                                            Projector
                                        </option>
                                        <option value="Monitor" ${e.equipmentType == "Monitor" ? 'selected="selected"' : ''}>
                                            Monitor
                                        </option>
                                        <option value="robot" ${e.equipmentType == "robot" ? 'selected="selected"' : ''}>
                                            Robot
                                        </option>
                                        <option value="Server" ${e.equipmentType == "Server" ? 'selected="selected"' : ''}>
                                            Server
                                        </option>
                                        <option value="Networking" ${e.equipmentType == "Networking" ? 'selected="selected"' : ''}>
                                            Networking
                                        </option>
                                        <option value="Audio-Visual" ${e.equipmentType == "Audio-Visual" ? 'selected="selected"' : ''} >
                                            Audio-Visual
                                        </option>
                                        <option value="Others"  ${e.equipmentType == "Others" ? 'selected="selected"' : ''}>
                                            Others
                                        </option>
                                    </select>
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold text-xl">Serial Number</span>
                                    <input type="text" id="sNo" value="${e.serialNumber}" disabled
                                           class="px-4 py-3.5 bg-white text-base w-full  border-b-2 focus:border-[#333] outline-none" />
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold text-xl">Purchase Date</span>
                                    <input type="date" id="pDate" value="${e.purchaseDate}"
                                           disabled
                                           class="px-4 py-3.5 bg-white text-base w-full  border-b-2 focus:border-[#333] outline-none" />
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold text-xl">Warranty Period</span>
                                    <input type="number" value="${e.warrantyPeriod}" id="wPeriod" disabled
                                           class="px-4 py-3.5 bg-white text-base w-full  border-b-2 focus:border-[#333] outline-none" />
                                </div>
                                <div class="relative flex items-center">
                                    <label for="status" class="w-40 font-bold text-xl">Status</label>
                                    <select class="px-4 py-3.5 bg-white text-base w-full  border-b-2 focus:border-[#333] outline-none"
                                            disabled
                                            id="status">
                                        <option value="Available" ${e.status == "Available" ? 'selected="selected"' : ''}>
                                            Available
                                        </option>
                                        <option value="CheckedOut" ${e.status == "CheckedOut" ? 'selected="selected"' : ''}>
                                            CheckedOut
                                        </option>
                                        <option value="UnderMaintenance" ${e.status == "UnderMaintenance" ? 'selected="selected"' : ''}>
                                            UnderMaintenance
                                        </option>
                                        <option value="Damaged" ${e.status == "Damaged" ? 'selected="selected"' : ''}>
                                            Damaged
                                        </option>
                                        <option value="Unavailable" ${e.status == "Unavailable" ? 'selected="selected"' : ''}>
                                            Unavailable
                                        </option>
                                    </select>
                                </div>
                                <div class="relative flex items-center">
                                    <label for="campus" class="w-40 font-bold text-xl">Campus</label>
                                    <select class="px-4 py-3.5 bg-white text-base w-full border-b-2 focus:border-[#333] outline-none"
                                            id="campus" disabled>
                                        <option value="CW"  ${e.campusID == "CW" ? 'selected="selected"' : ''}>CW
                                        </option>
                                        <option value="LWL" ${e.campusID == "LWL" ? 'selected="selected"' : ''}>LWL
                                        </option>
                                        <option value="ST" ${e.campusID == "ST" ? 'selected="selected"' : ''}>ST
                                        </option>
                                        <option value="TM" ${e.campusID == "TM" ? 'selected="selected"' : ''}>TM
                                        </option>
                                        <option value="TY" ${e.campusID == "TY" ? 'selected="selected"' : ''}>TY
                                        </option>

                                            <%--                                        <option value="CW">CW</option>--%>
                                            <%--                                        <option value="LWL" selected>LWL</option>--%>
                                            <%--                                        <option value="ST">ST</option>--%>
                                            <%--                                        <option value="TM">TM</option>--%>
                                            <%--                                        <option value="TY">TY</option>--%>
                                    </select>
                                </div>
                                <div class="relative flex items-center">
                                    <label for="isPrivate" class="w-40 font-bold text-xl">Private</label>
                                    <select class="px-4 py-3.5 bg-white text-base w-full border-b-2 focus:border-[#333] outline-none"
                                            id="isPrivate" disabled>
                                        <option value="0"  ${e.isPrivate == '0' ? 'selected="selected"' : ''}>Public
                                        </option>
                                        <option value="1" ${e.isPrivate == '0' ? '' : 'selected="selected"'}>Private
                                        </option>
                                    </select>
                                </div>
                                <div id="upload-container" hidden>
                                    <div class="relative flex items-center">
                                        <label for="upload" class="w-40 font-bold text-xl">Upload</label>
                                        <input id="upload"
                                               class="px-4 py-3.5 bg-white text-base w-full  border-b-2 focus:border-[#333] outline-none"
                                               type="file">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mt-6">
                            <div id="edit-container">
                                <div class="flex gap-6 max-sm:flex-col mt-10">
                                    <button type="button" id="edit" onclick="edit()"
                                            class="ml-4 rounded-md px-6 py-3 w-full text-xl font-semibold bg-blue-500 hover:bg-orange-500 border-2">
                                        Edit
                                    </button>
                                </div>
                            </div>
                            <div id="confirm-container" hidden>
                                <div class="flex justify between">
                                    <button type="button" id="cancel" onclick="cancel()"
                                            class="ml-4 rounded-md px-6 py-3 w-full text-xl font-semibold bg-slate-500 hover:bg-orange-500 border-2">
                                        Cancel
                                    </button>
                                    <button type="button" id="confirm" onclick="updateEquipment()"
                                            class="ml-4 rounded-md px-6 py-3 w-full text-xl font-semibold bg-green-500 hover:bg-orange-500 border-2">
                                        Confirm
                                    </button>
                                    <button type="button" id="delete" onclick="deleteEquipment()"
                                            class="ml-4 rounded-md px-6 py-3 w-full text-xl font-semibold bg-red-500 hover:bg-orange-500 border-2">
                                        Delete
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </ce:forEach>
                    <ce:if test="${param.update.equals('success')}">
                        <script>
                            Swal.fire({
                                title: 'Updated',
                                text: 'Equipment has been updated!',
                                icon: 'success',
                                confirmButtonText: 'OK'
                            });
                        </script>
                    </ce:if>
                </div>
            </div>
        </div>
    </body>
</html>
