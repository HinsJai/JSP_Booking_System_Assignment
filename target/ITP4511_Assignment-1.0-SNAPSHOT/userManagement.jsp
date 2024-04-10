<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/10
  Time: 下午 04:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cu" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="layout/technician_nav.jsp" %>
<%@ include file="bookingNotification.jsp" %>
<html>
    <head>
        <title>User management</title>
        <link rel="stylesheet" href="css/table.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <script src="./js/paging.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/userManagement.js"></script>
        <script>
            $(document).ready(function () {
                $('#table').paging({limit: 8});
            });
        </script>
    </head>
    <body>
        <sql:setDataSource var="damageReportList" driver="com.mysql.cj.jdbc.Driver"
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
                                        User ID
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-2xl">
                                        email
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        First Name
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Last Name
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Gender
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Contact
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Root
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Campus
                                    </th>
                                    <th scope="col" class="px-6 py-3  text-2xl">
                                        Action
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                <sql:query dataSource="${damageReportList}" var="result">
                                    SELECT * FROM userinfo;
                                </sql:query>

                                <cu:forEach var="u" items="${result.rows}">

                                <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">

                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                        <p>${u.userID}</p>
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                            ${u.email}
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl ">
                                            ${u.fName}
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl ">
                                            ${u.lName}
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl ">
                                            ${u.gender}
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl ">
                                            ${u.contact}
                                    </td>
                                    <td class="p-2 font-semibold text-black text-xl ">
                                        <select class="p-5 w-full"
                                                id=root_${u.userID}
                                                disabled>
                                            <option value="User"  ${u.root == "User" ? 'selected="selected"' : ''}>User
                                            </option>
                                            <option value="Staff" ${u.root == "Staff" ? 'selected="selected"' : ''}>
                                                Staff
                                            </option>
                                            <option value="Technician" ${u.root == "Technician" ? 'selected="selected"' : ''}>
                                                Technician
                                            </option>
                                            <option value="Technician_admin" ${u.root == "Technician_admin" ? 'selected="selected"' : ''}>
                                                Technician admin
                                            </option>
                                            <option value="Courier" ${u.root == "Courier" ? 'selected="selected"' : ''}>
                                                Courier
                                            </option>

                                        </select>
                                    </td>
                                    <td class="p-2 font-semibold text-black text-xl ">
                                        <select class="p-5 w-full"
                                                id=campus_${u.userID}
                                                disabled>
                                            <option value="CW"  ${u.campusID == "CW" ? 'selected="selected"' : ''}>CW
                                            </option>
                                            <option value="LWL" ${u.campusID == "LWL" ? 'selected="selected"' : ''}>LWL
                                            </option>
                                            <option value="ST" ${u.campusID == "ST" ? 'selected="selected"' : ''}>ST
                                            </option>
                                            <option value="TM" ${u.campusID == "TM" ? 'selected="selected"' : ''}>TM
                                            </option>
                                            <option value="TY" ${u.campusID == "TY" ? 'selected="selected"' : ''}>TY
                                            </option>

                                        </select>
                                    </td>
                                    <td class="px-6 py-4 text-2xl text-white">
                                        <button class="p-2 bg-blue-500 rounded-md hover:bg-orange-500"
                                                id=edit_${u.userID}
                                                onclick="edit(${u.userID})">Edit
                                        </button>

                                        <button class="p-2 bg-green-500 rounded-md hover:bg-orange-500"
                                                id=update_${u.userID}
                                                hidden
                                                onclick="update(${u.userID})">Update
                                        </button>

                                        <button class="ml-4 p-2 bg-gray-500 rounded-md hover:bg-orange-500"
                                                id=cancel_${u.userID}
                                                hidden
                                                onclick="cancel(${u.userID},'${u.root}','${u.campusID}')">Cancel
                                        </button>

                                        <button class="ml-4 p-2 bg-red-500 rounded-md hover:bg-orange-500"
                                                id=delete_${u.userID}>
                                            Delete
                                        </button>
                                            <%--                                        <a href="damageReport?action=details&reportID=${d.reportID}&imageLength=${d.imageLength}&equipmentID=${d.equipmentID}&reportDate=${d.reportDate}"--%>
                                            <%--                                           class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Details</a>--%>
                                    </td>
                                </tr>
                            </tbody>
                            </cu:forEach>
                        </table>
                    </div>
                </main>
            </div>
        </section>
    </body>
</html>
