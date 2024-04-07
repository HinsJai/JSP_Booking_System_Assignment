<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/7
  Time: 下午 05:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="ct" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="layout/technician_nav.jsp" %>

<html>
    <head>
        <title>Technician Equipment List</title>
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
        <section class=" bg-slate-100 text-black w-screen h-full">

            <div class="flex flex-wrap">

                <%@ include file="layout/technicaian_e_menu.jsp" %>

                <sql:setDataSource var="technicianEquipmentList" driver="com.mysql.cj.jdbc.Driver"
                                   url="jdbc:mysql://localhost:3306/itp4511_db?useSSL=false"
                                   user="root" password="root" />


                <main class="flex-1 bg-gray-900">
                    <div class="relative overflow-x-auto shadow-md ">
                        <table class="w-full text-sm text-left rtl:text-right text-white dark:text-gray-400" id="table">
                            <thead class="text-xl text-white uppercase bg-gray-50 dark:bg-gray-700 dark:text-white">
                                <tr>
                                    <th scope="col" class="px-6 py-3">
                                        ID
                                    </th>
                                    <th scope="col" class="px-16 py-3">
                                        <span class="sr-only">Image</span>
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Equipment
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Type
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Status
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <sql:query dataSource="${technicianEquipmentList}" var="result">
                                    <ct:choose>
                                        <ct:when test="${param.action == 'list'}">
                                            SELECT * FROM equipment ;
                                        </ct:when>
                                        <ct:otherwise>
                                            SELECT * FROM equipment where equipmentType = '${param.action}';
                                        </ct:otherwise>
                                    </ct:choose>

                                </sql:query>

                                <ct:forEach var="e" items="${result.rows}">

                                    <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                                        <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                                ${e.equipmentID}
                                        </td>
                                        <td class="p-4">
                                            <img src="images/equipment/${e.equipmentID}.jpg?time=<%=System.currentTimeMillis()%>"
                                                 class=" md:w-32 max-w-24 max-h-20" alt="">
                                        </td>
                                        <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                                ${e.equipmentName}
                                        </td>
                                        <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                                ${e.equipmentType}
                                        </td>

                                        <td class="px-6 py-4 flex justify-start">
                                            <ct:choose>
                                                <ct:when test="${ e.status == 'Available' }">
                                                    <p class=" w-44 flex items-center justify-center p-4 text-xl rounded rounded-lg bg-green-600 text-white font-bold">
                                                        Available
                                                    </p>
                                                </ct:when>

                                                <ct:when test="${ e.status == 'CheckedOut' }">
                                                    <p class="flex items-center justify-center w-44 p-4 text-xl rounded rounded-lg bg-blue-600 font-bold
                                                text-white">
                                                        CheckedOut
                                                    </p>
                                                </ct:when>

                                                <ct:when test="${ e.status == 'UnderMaintenance' }">
                                                    <p class="flex items-center justify-center w-44 p-4 text-xl rounded rounded-lg bg-yellow-500 font-bold
                                                 text-white font-bold">
                                                        CheckedOut
                                                    </p>
                                                </ct:when>

                                                <ct:when test="${ e.status == 'Damaged' }">
                                                    <p class="flex items-center justify-center w-44 p-4 text-xl rounded rounded-lg bg-red-500 font-bold
                                                 text-white font-bold">
                                                        Damaged
                                                    </p>
                                                </ct:when>
                                                <ct:when test="${ e.status == 'Unavailable' }">
                                                    <p class="flex items-center justify-center w-44 p-4 text-xl rounded rounded-lg bg-pink-600 font-bold
                                                text-white font-bold">
                                                        Unavailable
                                                    </p>
                                                </ct:when>
                                            </ct:choose>
                                        </td>
                                        <td class="px-6 py-4 text-2xl">
                                            <a href="technicianEquipment?action=details&equipmentID=${e.equipmentID}"
                                               class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Details</a>
                                        </td>
                                    </tr>
                                </ct:forEach>
                            </tbody>
                        </table>
                        <ct:if test="${param.deleted.equals('success')}">
                            <script>
                                Swal.fire({
                                    title: 'Deleted',
                                    text: 'Equipment has been deleted!',
                                    icon: 'success',
                                    confirmButtonText: 'OK'
                                });
                            </script>
                        </ct:if>
                    </div>
                </main>
            </div>
        </section>
    </body>
</html>
