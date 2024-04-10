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
    <body class="bg-gray-900">
        <sql:setDataSource var="damageReportList" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/itp4511_db?useSSL=false"
                           user="root" password="root" />

        <div class="flex">
            <select id="search-type"
                    class="font-bold text-xl flex-shrink-0 z-10 inline-flex items-center py-2  text-center text-gray-900 bg-gray-100 border border-gray-300  hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-100 dark:bg-gray-700 dark:hover:bg-gray-600 dark:focus:ring-gray-700 dark:text-white dark:border-gray-600"
            >
                <option value="all">All</option>
                <option value="userID">User ID</option>
                <option value="email">Email</option>
                <option value="fName">First Name</option>
                <option value="lName">Last Name</option>
                <option value="contact">Contact</option>
                <option value="campusID">Campus</option>


            </select>

            <div class="relative w-full">
                <input type="search" id="keyword"
                       class="h-14 block p-2.5 w-full z-20 text-white bg-gray-600    focus:ring-blue-500 focus:border-blue-500 "
                       placeholder="Search by ID, name, contact, root, campus" required />
                <button id="search" onclick="searchUser()"
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
                        <table class="w-full text-sm text-left rtl:text-right text-white" id="table">
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
                                    <th scope="col" class="px-4 py-3  text-2xl">
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
                                    <cu:choose>
                                        <cu:when
                                                test="${param.action.equals('search')}">
                                            SELECT * FROM userinfo WHERE ${param.type} LIKE "%${param.keyword}%";
                                        </cu:when>
                                        <cu:otherwise>
                                            SELECT * FROM userinfo;
                                        </cu:otherwise>
                                    </cu:choose>
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
                                        <select class="p-2 rounded-md"
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
                                        <select class="p-2 rounded-md"
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

                                        <button class=" p-2 bg-gray-500 rounded-md hover:bg-orange-500"
                                                id=cancel_${u.userID}
                                                hidden
                                                onclick="cancel(${u.userID},'${u.root}','${u.campusID}')">Cancel
                                        </button>

                                        <button class="p-2 bg-red-500 rounded-md hover:bg-orange-500"
                                                id=delete_${u.userID} onclick="deleteUser(${u.userID})">
                                            Delete
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                            </cu:forEach>
                            <cu:if test="${param.update.equals('success')}">
                                <script>
                                    Swal.fire({
                                        title: 'Updated',
                                        text: 'User info is updated!',
                                        icon: 'success',
                                        confirmButtonText: 'OK'
                                    });
                                </script>
                            </cu:if>
                            <cu:if test="${param.delete.equals('success')}">
                                <script>
                                    Swal.fire({
                                        title: 'Deleted',
                                        text: 'User has been deleted!',
                                        icon: 'success',
                                        confirmButtonText: 'OK'
                                    });
                                </script>
                            </cu:if>
                        </table>
                        <div>
                            <button class="ml-4 bg-yellow-500 rounded-md p-4 font-bold text-xl hover:bg-orange-500"
                                    onclick="createUser()">
                                Create User
                            </button>
                        </div>
                    </div>
                </main>
            </div>
        </section>
    </body>
</html>
