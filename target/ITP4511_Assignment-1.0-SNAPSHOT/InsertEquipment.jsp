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
<%--<%! ArrayList<EquipmentBean> equipmentList = new ArrayList<>(); %>--%>

<html class="bg-gray-900">
    <head>
        <title>Insert Equipment</title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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
                                <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                                </tr>
                            </tbody>
                        </table>
                        <div class="flex justify-end relative right-10 p-4">
                            <button class="bg-yellow-500 p-4 rounded-md font-semibold text-xl hover:bg-green-600"
                                    type="button"
                                    onclick="addEquipment()">
                                New row
                            </button>
                        </div>
                    </div>
                </main>
            </div>
        </section>


    </body>
</html>
