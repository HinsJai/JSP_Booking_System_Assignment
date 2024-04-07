<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/3/30
  Time: 下午 07:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ include file="layout/user_nav.jsp" %>

<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cw" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <title>Wish List</title>
        <title>Home</title>
        <link rel="stylesheet" href="css/table.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <script src="./js/paging.js"></script>
        <script src="js/cart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10">
        </script>
        <script>
            $(document).ready(function () {
                $('#table').paging({limit: 5});
            });
        </script>
    </head>
    <body>
        <cw:if test="${param.reserve =='showCart'}">
            <script>
                $(document).ready(function () {
                    $("#cart-container").show();
                });
            </script>
        </cw:if>


        <%@ include file="side-cart.jsp" %>
        <section class=" bg-slate-100 text-black w-screen  h-full">
            <div class="flex flex-wrap">
                <%--                <%@ include file="layout/equipement_menu.jsp" %>--%>
                <main class="flex-1">
                    <div class="flex items-center justify-center p-4 bg-gray-600"><h1
                            class="text-4xl font-bold text-yellow-500">Wish
                                                                       List</h1>
                    </div>
                    <div class="relative overflow-x-auto shadow-md ">
                        <table class="w-full text-sm text-left rtl:text-right text-white" id="table">
                            <thead class="text-xl text-white uppercase bg-gray-50 dark:bg-gray-700 dark:text-white">
                                <tr>
                                    <th scope="col" class="px-16 py-3">
                                        <span class="sr-only">Image</span>
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-3xl">
                                        Equipment
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-3xl">
                                        Type
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-3xl">
                                        Status
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-3xl">
                                        Action
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                <cw:forEach var="w" items="${requestScope.wishList}">

                                <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                                    <td class="p-4">
                                        <img src="images/equipment/${w.e_equipmentID}.jpg"
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
                                        <cw:choose>
                                            <cw:when test="${w.status == 'CheckedOut'}">
                                                <button class=" p-4 text-xl rounded rounded-lg bg-red-500" disabled>
                                                                                                                                        <span class=" font-bold
                                                                                                                                        text-white">In Wish</span>
                                                </button>
                                                <button class="ml-6 p-4 text-xl rounded rounded-lg bg-blue-500 hover:bg-orange-500">
                                                    <a href="wish?action=remove&equipmentId=${w.e_equipmentID}"
                                                       class="font-bold text-white hover:bg-orange-500">Remove</a>
                                                </button>
                                            </cw:when>
                                            <cw:otherwise>

                                                <button class=" p-4 text-xl rounded rounded-lg bg-green-500 font-bold cursor-pointer hover:bg-orange-500
                                                                                                                                        text-white">
                                                    <a href="wish?action=addToCart&equipmentId=${w.e_equipmentID}"
                                                       class="font-bold hover:bg-orange-500 text-white"><span
                                                            class=" font-bold text-white">Reserve</span></a>
                                                </button>

                                                <button class="ml-6 p-4 text-xl rounded rounded-lg bg-blue-500 hover:bg-orange-500">
                                                    <a href="wish?action=remove&equipmentId=${w.e_equipmentID}"
                                                       class="font-bold text-white hover:bg-orange-500">Remove</a>
                                                </button>

                                            </cw:otherwise>
                                        </cw:choose>
                                    </td>
                                </tr>
                            </tbody>
                            <cw:if test="${param.removeWish.equals('success')}">
                                <script>
                                    Swal.fire({
                                        title: 'Removed',
                                        text: 'Equipment has been remove to your wishlist',
                                        icon: 'success',
                                        confirmButtonText: 'OK'
                                    });
                                </script>
                            </cw:if>

                            </cw:forEach>
                            <cw:if test="${param.addCart.equals('success')}">
                                <script>
                                    Swal.fire({
                                        title: 'Added',
                                        text: 'Equipment has been added to cart',
                                        icon: 'success',
                                        confirmButtonText: 'OK'
                                    });
                                </script>
                            </cw:if>
                        </table>
                    </div>
                </main>
            </div>
        </section>
    </body>
</html>
