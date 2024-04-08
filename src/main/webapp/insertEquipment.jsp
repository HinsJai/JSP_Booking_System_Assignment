<%@ page import="java.util.ArrayList" %>
<%@ page import="ict.itp4511_assignment.bean.EquipmentBean" %><%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/5
  Time: 下午 09:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ include file="layout/technician_nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="bookingNotification.jsp" %>
<%! int maxTempID = -1;%>

<html class="bg-gray-900">
    <head>
        <title>Insert Equipment</title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/insertEquipment.js"></script>

    </head>
    <body>
        <sql:setDataSource var="bookDetails" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/itp4511_db?useSSL=false"
                           user="root" password="root" />
        <section class=" bg-gray-900 text-black w-screen h-full">
            <div class="flex flex-wrap">
                <main class="flex-1 bg-gray-900">
                    <div class="relative overflow-x-auto shadow-md ">
                        <table id='insertTable'
                               class="w-full text-sm text-left rtl:text-right text-white dark:text-gray-400">
                            <thead class="text-xl text-white uppercase bg-gray-50 dark:bg-gray-700 dark:text-white">
                                <tr>
                                    <th scope="col" class="px-6 py-3">
                                        ID
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Equipment Name
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Type
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Serial Number
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Purchase Date
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Warranty Period
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Status
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Private
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Campus
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Action
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                <cc:if test="${sessionScope.EquipmentTempList != null}">
                                    <cc:forEach var="e" items="${sessionScope.EquipmentTempList}">
                                        <tr class=" odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700 font-semibold">

                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <p class="text-white  text-xl p-2"
                                                   id="id_${e.equipmentID}">${e.equipmentID}</p>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" id="name_${e.equipmentID}" disabled
                                                       class=" p-2 rounded-md text-white text-xl" style="width: 90%;"
                                                       value="${e.equipmentName}">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" id="type_${e.equipmentID}" disabled
                                                       class="text-white text-xl p-2 rounded-md" style="width: 90%;"
                                                       value="${e.equipmentType}">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" name="serialNumber" disabled
                                                       value="${e.serialNumber}" id="sNo_${e.equipmentID}"
                                                       class="text-white text-xl p-2 rounded-md" style="width: 90%;">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="date" name="purchaseDate" disabled
                                                       value="${e.purchaseDate}" id="pDate_${e.equipmentID}"
                                                       class="text-white text-base p-2 rounded-md" style="width: 90%;">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" name="warrantyPeriod" disabled
                                                       value="${e.warrantyPeriod}" id="wPeriod_${e.equipmentID}"
                                                       class="text-white text-xl p-2 rounded-md" style="width: 90%;">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" name="status" value="${e.status}" disabled
                                                       id="status_${e.equipmentID}"
                                                       class="text-white text-xl p-2 rounded-md" style="width: 90%;">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" name="private"
                                                       value="${e.isPrivate==0?'Public':"Private"}" disabled
                                                       id="isPrivate_${e.equipmentID}"
                                                       class="text-white text-xl p-2 rounded-md" style="width: 90%;">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" name="campus" value="${e.campusID}" disabled
                                                       id="campus_${e.equipmentID}"
                                                       class="text-white text-xl p-2 rounded-md" style="width: 90%;">
                                            </td>
                                            <td
                                                    class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                                <button class="mr-2 bg-red-500 text-white p-4 rounded-md font-semibold text-xl hover:bg-green-600"
                                                        type="button"
                                                        onclick="removeEquipment(${e.equipmentID})">
                                                    Delete
                                                </button>
                                            </td>
                                        </tr>
                                    </cc:forEach>
                                </cc:if>

                            </tbody>
                        </table>
                        <div class="flex justify-between items-center p-4">
                            <%
                                ArrayList<EquipmentBean> EquipmentTempList = new ArrayList<>();
                                if (session.getAttribute("EquipmentTempList") != null) {
                                    EquipmentTempList = (ArrayList<EquipmentBean>) session.getAttribute("EquipmentTempList");
                                    for (EquipmentBean e : EquipmentTempList) {
                                        int tempID = e.getEquipmentID();
                                        if (tempID > maxTempID) {
                                            maxTempID = tempID;
                                        }
                                    }
                                }
                            %>
                            <cc:choose>
                                <cc:when test="${sessionScope.EquipmentTempList.size() > 0}">
                                    <button class="bg-green-500 p-4 rounded-md  font-semibold text-base hover:bg-green-600"
                                            type="button" onclick="addToDB()">
                                        Submit
                                    </button>
                                    <button class="bg-yellow-500 p-4 mr-4  rounded-md font-semibold text-xl hover:bg-green-600"
                                            type="button"
                                            onclick="addEquipment(<%=maxTempID%>)">
                                        New
                                    </button>
                                </cc:when>
                                <cc:otherwise>
                                    <button class="bg-yellow-500 p-4 mr-4 rounded-md font-semibold text-xl hover:bg-green-600"
                                            type="button"
                                            onclick="addNewEquipment()">
                                        New
                                    </button>
                                </cc:otherwise>
                            </cc:choose>
                        </div>
                    </div>
                    <%--                    <div class="bg-white text-black">${sessionScope.EquipmentTempList.size()}</div>--%>
                    <cc:if test="${param.insertEquipment.equals('success')}">
                        <script>
                            Swal.fire({
                                title: 'Added',
                                text: 'Equipment has been created successfully!',
                                icon: 'success',
                                confirmButtonText: 'OK'
                            });
                        </script>
                    </cc:if>
                </main>
            </div>
        </section>
    </body>
</html>
