<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/3/26
  Time: 上午 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="layout/top_nav.jsp" %>
<%--<%@ include file="bootstrap/bootstrp_css.jsp" %>--%>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--<%@ include file="css/nav.css" %>--%>

<html>
    <head>
        <title>Home</title>
    </head>

    <body>


        <section class=" bg-slate-100 text-black w-screen  h-full">
            <div class="flex flex-wrap">
                <%@ include file="layout/equipement_menu.jsp" %>

                <main class="flex-1">


                    <div class="relative overflow-x-auto shadow-md ">
                        <table class="w-full text-sm text-left rtl:text-right text-white dark:text-gray-400">
                            <thead class="text-xl text-white uppercase bg-gray-50 dark:bg-gray-700 dark:text-white">
                                <tr>
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
                                <c:forEach var="e" items="${requestScope.equipments}">

                                    <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                                        <td class="p-4">
                                            <img src="#"
                                                 class="w-16 md:w-32 max-w-full max-h-full" alt="">
                                        </td>
                                        <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                                ${e.equipmentName}
                                        </td>
                                        <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                                ${e.equipmentType}
                                        </td>
                                        <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                                ${e.status}
                                        </td>
                                        <td class="px-6 py-4">
                                            <button class="bg-blue-400 p-4 text-xl rounded rounded-lg">
                                                <a href="#">
                                                    <span class="text-white font-bold">Reserve</span>
                                                </a>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>

                                <%--                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">--%>
                                <%--                                    <td class="p-4">--%>
                                <%--                                        <img src="/docs/images/products/apple-watch.png"--%>
                                <%--                                             class="w-16 md:w-32 max-w-full max-h-full" alt="Apple Watch">--%>
                                <%--                                    </td>--%>
                                <%--                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white">--%>
                                <%--                                        Apple Watch--%>
                                <%--                                    </td>--%>
                                <%--                                    <td class="px-6 py-4">--%>
                                <%--                                        <div class="flex items-center">--%>

                                <%--                                        </div>--%>
                                <%--                                    </td>--%>
                                <%--                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white">--%>
                                <%--                                        $599--%>
                                <%--                                    </td>--%>
                                <%--                                    <td class="px-6 py-4">--%>
                                <%--                                        <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline">Remove</a>--%>
                                <%--                                    </td>--%>
                                <%--                                </tr>--%>
                                <%--                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">--%>
                                <%--                                    <td class="p-4">--%>
                                <%--                                        <img src="/docs/images/products/imac.png"--%>
                                <%--                                             class="w-16 md:w-32 max-w-full max-h-full" alt="Apple iMac">--%>
                                <%--                                    </td>--%>
                                <%--                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white">--%>
                                <%--                                        iMac 27"--%>
                                <%--                                    </td>--%>
                                <%--                                    <td class="px-6 py-4">--%>
                                <%--                                        <div class="flex items-center">--%>
                                <%--                                            <button class="inline-flex items-center justify-center p-1 text-sm font-medium h-6 w-6 text-gray-500 bg-white border border-gray-300 rounded-full focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-200 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700"--%>
                                <%--                                                    type="button">--%>
                                <%--                                                <span class="sr-only">Quantity button</span>--%>
                                <%--                                                <svg class="w-3 h-3" aria-hidden="true"--%>
                                <%--                                                     xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 2">--%>
                                <%--                                                    <path stroke="currentColor" stroke-linecap="round"--%>
                                <%--                                                          stroke-linejoin="round" stroke-width="2" d="M1 1h16" />--%>
                                <%--                                                </svg>--%>
                                <%--                                            </button>--%>
                                <%--                                            <div class="ms-3">--%>
                                <%--                                                <input type="number" id="first_product"--%>
                                <%--                                                       class="bg-gray-50 w-14 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block px-2.5 py-1 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"--%>
                                <%--                                                       placeholder="1" required />--%>
                                <%--                                            </div>--%>
                                <%--                                            <button class="inline-flex items-center justify-center h-6 w-6 p-1 ms-3 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-full focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-200 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700"--%>
                                <%--                                                    type="button">--%>
                                <%--                                                <span class="sr-only">Quantity button</span>--%>
                                <%--                                                <svg class="w-3 h-3" aria-hidden="true"--%>
                                <%--                                                     xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">--%>
                                <%--                                                    <path stroke="currentColor" stroke-linecap="round"--%>
                                <%--                                                          stroke-linejoin="round" stroke-width="2" d="M9 1v16M1 9h16" />--%>
                                <%--                                                </svg>--%>
                                <%--                                            </button>--%>
                                <%--                                        </div>--%>
                                <%--                                    </td>--%>
                                <%--                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white">--%>
                                <%--                                        $2499--%>
                                <%--                                    </td>--%>
                                <%--                                    <td class="px-6 py-4">--%>
                                <%--                                        <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline">Remove</a>--%>
                                <%--                                    </td>--%>
                                <%--                                </tr>--%>
                                <%--                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">--%>
                                <%--                                    <td class="p-4">--%>
                                <%--                                        <img src="/docs/images/products/iphone-12.png"--%>
                                <%--                                             class="w-16 md:w-32 max-w-full max-h-full" alt="iPhone 12">--%>
                                <%--                                    </td>--%>
                                <%--                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white">--%>
                                <%--                                        IPhone 12--%>
                                <%--                                    </td>--%>
                                <%--                                    <td class="px-6 py-4">--%>
                                <%--                                        <div class="flex items-center">--%>
                                <%--                                            <button class="inline-flex items-center justify-center p-1 text-sm font-medium h-6 w-6 text-gray-500 bg-white border border-gray-300 rounded-full focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-200 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700"--%>
                                <%--                                                    type="button">--%>
                                <%--                                                <span class="sr-only">Quantity button</span>--%>
                                <%--                                                <svg class="w-3 h-3" aria-hidden="true"--%>
                                <%--                                                     xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 2">--%>
                                <%--                                                    <path stroke="currentColor" stroke-linecap="round"--%>
                                <%--                                                          stroke-linejoin="round" stroke-width="2" d="M1 1h16" />--%>
                                <%--                                                </svg>--%>
                                <%--                                            </button>--%>
                                <%--                                            <div class="ms-3">--%>
                                <%--                                                <input type="number"--%>
                                <%--                                                       class="bg-gray-50 w-14 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block px-2.5 py-1 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"--%>
                                <%--                                                       placeholder="1" required />--%>
                                <%--                                            </div>--%>
                                <%--                                            <button class="inline-flex items-center justify-center h-6 w-6 p-1 ms-3 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-full focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-200 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700"--%>
                                <%--                                                    type="button">--%>
                                <%--                                                <span class="sr-only">Quantity button</span>--%>
                                <%--                                                <svg class="w-3 h-3" aria-hidden="true"--%>
                                <%--                                                     xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">--%>
                                <%--                                                    <path stroke="currentColor" stroke-linecap="round"--%>
                                <%--                                                          stroke-linejoin="round" stroke-width="2" d="M9 1v16M1 9h16" />--%>
                                <%--                                                </svg>--%>
                                <%--                                            </button>--%>
                                <%--                                        </div>--%>
                                <%--                                    </td>--%>
                                <%--                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white">--%>
                                <%--                                        $999--%>
                                <%--                                    </td>--%>
                                <%--                                    <td class="px-6 py-4">--%>
                                <%--                                        <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline">Remove</a>--%>
                                <%--                                    </td>--%>
                                <%--                                </tr>--%>
                            </tbody>
                        </table>
                    </div>

                </main>
            </div>
        </section>

        <%--        <jsp:useBean id="userInfo" class="ict.itp4511_assignment.bean.UserInfoBean" scope="session" />--%>
        <%--        <b>Hello,--%>
        <%--            <jsp:getProperty name="userInfo" property="userID" />--%>
        <%--        </b>--%>
        <%--        <p>Welcome to the ICT</p>--%>
        <%--        <form method="post" action="verify_login">--%>
        <%--            <button name="loginAction" value="logout">Logout</button>--%>
        <%--        </form>--%>
        <%--        <hr>--%>
        <!-- component -->
        <!-- follow me on twitter @asad_codes -->

        <%--        <%@ include file="bootstrap/bootstrap_js.jsp" %>--%>
    </body>
</html>
