<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/10
  Time: 上午 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ include file="layout/technician_nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cd" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>Damage Report Details</title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/damageReportDetails.js"></script>
    </head>
    <body>
        <sql:setDataSource var="damageReportDetails" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/itp4511_db?useSSL=false"
                           user="root" password="root" />

        <div class="font-[sans-serif] bg-gray-200">
            <div class="grid lg:grid-cols-2 xl:grid-cols-3 gap-4 h-full">
                <div class="bg-[#3f3f3f] lg:h-screen lg:sticky lg:top-0">
                    <div class="relative h-full bg-slate-900">

                        <div class="p-8 lg:overflow-auto lg:h-[calc(100vh-60px)] ">
                            <h2 class="text-2xl font-bold text-white">Damage Image</h2>
                            <div class="space-y-6 mt-10">
                                <div class="grid sm:grid-cols-1 items-start gap-6">

                                    <cd:forEach var="i" begin="1" end='${param.imageLength}'>
                                        <div class="px-4 py-2 shrink-0 bg-gray-50 rounded-md">
                                            <img src="./images/damage/${param.equipmentID}_${i}_${param.reportDate}.jpg?time=<%=System.currentTimeMillis()%>"
                                                 class="w-44 h-44 object-contain" />
                                        </div>
                                    </cd:forEach>
                                    <input type="number" value="${param.imageLength}" hidden id="imageLength">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="xl:col-span-2 h-max rounded-md p-8 sticky top-0">
                    <sql:query dataSource="${damageReportDetails}" var="result">
                        select * from damagereport where reportID = ${param.reportID}
                    </sql:query>
                    <cd:forEach var="d" items="${result.rows}">

                    <h2 class="text-4xl font-bold text-[#333]">Damage Report Details</h2>
                    <div class="mt-10">
                        <div>
                            <div class="grid sm:grid-cols-2 gap-6">
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold text-xl">Report ID</span>
                                    <input type="text" value="${d.reportID}" disabled id="id"
                                           class="px-4 py-3.5 bg-white text-base w-full  border-b-2 focus:border-[#333] outline-none" />
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold text-xl">Report Date</span>
                                    <input type="text" value="${d.reportDate}" disabled id="reportDate"
                                           class="px-4 py-3.5 bg-white text-base w-full  border-b-2 focus:border-[#333] outline-none" />
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold text-xl">Equipment ID</span>
                                    <input type="text" value="${d.equipmentID}" disabled id="equipmentID"
                                           class="px-4 py-3.5 bg-white text-base w-full  border-b-2 focus:border-[#333] outline-none" />
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold text-xl">Courier ID</span>
                                    <input type="text" value="${d.reportedBy}" disabled id="courierID"
                                           class="px-4 py-3.5 bg-white text-base w-full  border-b-2 focus:border-[#333] outline-none" />
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold text-xl">Damage Description</span>
                                    <textarea rows="4" cols="70" disabled
                                              class="p-2 bg-white">${d.damageDescription}
                                    </textarea>
                                </div>
                                <div class="relative flex items-center">
                                    <span class=" w-40 font-bold text-xl">Status</span>
                                    <p class="px-4 py-3.5 bg-white text-base w-full  ">${d.status}</p>
                                </div>

                            </div>
                        </div>

                        <cd:if test="${d.status.equals('Pending') && sessionScope.userType == 'Technician_admin'}">
                            <div class="mt-12">
                                <button type="button" id="confirm" onclick="resolveEquipment()"
                                        class="ml-4 rounded-md px-6 py-3 w-full text-xl font-semibold bg-blue-500 hover:bg-orange-500 border-2">
                                    Resolve
                                </button>
                            </div>
                        </cd:if>

                    </div>
                </div>

                <cd:if test="${param.resolved.equals('success')}">
                    <script>
                        Swal.fire({
                            title: 'Resolved',
                            text: 'Equipment has been resolved!',
                            icon: 'success',
                            confirmButtonText: 'OK'
                        });
                    </script>
                </cd:if>

            </div>
            </cd:forEach>
        </div>

    </body>
</html>
