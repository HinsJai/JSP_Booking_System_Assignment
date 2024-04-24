<%@ page import="ict.itp4511_assignment.bean.EquipmentBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ict.itp4511_assignment.bean.UserInfoBean" %><%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/10
  Time: 下午 10:09
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
<html>
    <head>
        <title>Create User</title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/createUser.js"></script>
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
                                        Email
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Password
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        First Name
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Last Name
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Gender
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Contact
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Root
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
                                <cc:if test="${sessionScope.UserTempList != null}">
                                    <cc:forEach var="u" items="${sessionScope.UserTempList}">
                                        <tr class=" odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700 font-semibold">

                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <p class="text-white  text-xl p-2"
                                                   id="id_${u.userID}">${u.userID}</p>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" id="email_${u.userID}" disabled
                                                       class=" p-2 rounded-md text-white text-xl" style="width: 90%;"
                                                       value="${u.email}">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" id="password_${u.userID}" disabled
                                                       class="text-white text-xl p-2 rounded-md" style="width: 90%;"
                                                       value="${u.password}">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" name="fName" disabled
                                                       value="${u.fName}" id="fName_${u.userID}"
                                                       class="text-white text-xl p-2 rounded-md" style="width: 90%;">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" name="lName" disabled
                                                       value="${u.lName}" id="lName_${u.userID}"
                                                       class="text-white text-base p-2 rounded-md" style="width: 90%;">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" name="gender" disabled
                                                       value="${u.gender}" id="gender_${u.userID}"
                                                       class="text-white text-xl p-2 rounded-md" style="width: 90%;">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" name="contact" value="${u.contact}" disabled
                                                       id="contact_${u.userID}" maxlength="8"
                                                       class="text-white text-xl p-2 rounded-md" style="width: 90%;">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" name="root"
                                                       value="${u.root}" disabled
                                                       id="root_${u.userID}"
                                                       class="text-white text-xl p-2 rounded-md" style="width: 90%;">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <input type="text" name="campus" value="${u.campus}" disabled
                                                       id="campus_${u.userID}"
                                                       class="text-white text-xl p-2 rounded-md" style="width: 90%;">
                                            </td>
                                            <td
                                                    class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                                <button class="mr-2 bg-red-500 text-white p-4 rounded-md font-semibold text-xl hover:bg-green-600"
                                                        type="button"
                                                        onclick="removeTempUser(${u.userID})">
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
                                ArrayList<UserInfoBean> userTempList = new ArrayList<>();
                                if (session.getAttribute("UserTempList") != null) {
                                    userTempList = (ArrayList<UserInfoBean>) session.getAttribute("UserTempList");
                                    for (UserInfoBean e : userTempList) {
                                        int tempID = e.getUserID();
                                        if (tempID > maxTempID) {
                                            maxTempID = tempID;
                                        }
                                    }
                                }
                            %>
                            <cc:choose>
                                <cc:when test="${sessionScope.UserTempList.size() > 0}">
                                    <button class="bg-green-500 p-4 rounded-md  font-semibold text-base hover:bg-green-600"
                                            type="button" onclick="addToDB()">
                                        Submit
                                    </button>
                                    <button class="bg-yellow-500 p-4 mr-4  rounded-md font-semibold text-xl hover:bg-green-600"
                                            type="button"
                                            onclick="addUser(<%=maxTempID%>)">
                                        New
                                    </button>
                                </cc:when>
                                <cc:otherwise>
                                    <button class="bg-yellow-500 p-4 mr-4 rounded-md font-semibold text-xl hover:bg-green-600"
                                            type="button"
                                            onclick="addNewUser()">
                                        New
                                    </button>
                                </cc:otherwise>
                            </cc:choose>
                        </div>
                    </div>
                    <cc:if test="${param.addToDB.equals('success')}">
                        <script>
                            Swal.fire({
                                title: 'Added',
                                text: 'All user has been created successfully!',
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
