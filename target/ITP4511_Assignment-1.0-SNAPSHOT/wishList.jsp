<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/3/30
  Time: 下午 07:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ include file="layout/top_nav.jsp" %>

<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <title>Wish List</title>
        <title>Home</title>
        <link rel="stylesheet" href="css/table.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <script src="./js/paging.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10">
        </script>
        <script>
            $(document).ready(function () {
                $('#table').paging({limit: 5});
            });
        </script>
    </head>
    <body>
        <section class=" bg-slate-100 text-black w-screen  h-full">
            <div class="flex flex-wrap">
                <%--                <%@ include file="layout/equipement_menu.jsp" %>--%>
                <main class="flex-1">

                    <div class="relative overflow-x-auto shadow-md ">
                        <table class="w-full text-sm text-left rtl:text-right text-white dark:text-gray-400" id="table">
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
                                <c:forEach var="w" items="${requestScope.wishList}">

                                <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                                    <td class="p-4">
                                        <img src="#"
                                             class="w-16 md:w-32 max-w-full max-h-full" alt="">
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                            ${w.equipmentName}
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                            ${w.equipmentType}
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl ">
                                        <p class="${w.status=='CheckedOut'? 'text-red-500':'text-green-600'}"> ${w.status}</p>
                                    </td>
                                    <td class="px-6 py-4">
                                        <c:choose>
                                            <c:when test="${w.status == 'CheckedOut'}">
                                                <button class=" p-4 text-xl rounded rounded-lg bg-red-500" disabled>
                                                                                                                                        <span class=" font-bold
                                                                                                                                        text-white">In Wish</span>
                                                </button>
                                                <button class="ml-6 p-4 text-xl rounded rounded-lg bg-blue-500 hover:bg-orange-500">
                                                    <a href="wish?action=remove&equipmentId=${w.e_equipmentID}"
                                                       class="font-bold text-white hover:bg-orange-500">Remove</a>
                                                </button>
                                            </c:when>
                                            <c:otherwise>

                                                <button class=" p-4 text-xl rounded rounded-lg bg-green-500 font-bold cursor-pointer hover:bg-orange-500
                                                                                                                                        text-white">
                                                    <a href=""
                                                       class="font-bold hover:bg-orange-500 text-white"><span
                                                            class=" font-bold text-white">Reserve</span></a>
                                                </button>

                                                <button class="ml-6 p-4 text-xl rounded rounded-lg bg-blue-500 hover:bg-orange-500">
                                                    <a href="wish?action=remove&equipmentId=${w.e_equipmentID}"
                                                       class="font-bold text-white hover:bg-orange-500">Remove</a>
                                                </button>

                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </tbody>
                            <c:if test="${param.removeWish.equals('success')}">
                                <script>
                                    Swal.fire({
                                        title: 'Removed',
                                        text: 'Equipment has been remove to your wishlist',
                                        icon: 'success',
                                        confirmButtonText: 'OK'
                                    });
                                </script>
                            </c:if>
                            </c:forEach>
                        </table>
                    </div>
                </main>
            </div>
        </section>
    </body>
</html>
