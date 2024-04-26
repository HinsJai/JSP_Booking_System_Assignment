<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/3/26
  Time: 上午 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="layout/user_nav.jsp" %>
<%@ include file="wishNotification.jsp" %>
<html>
    <head>
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
                $('#table').paging({limit: 6});
            });
        </script>

    </head>
    <body>


        <c:if test="${param.reserve.equals('showCart')}">
            <script>
                $(document).ready(function () {
                    $("#cart-container").show();
                });
            </script>
        </c:if>

        <%@ include file="side-cart.jsp" %>


        <section class=" bg-slate-100 text-black w-screen h-full">

            <div class="flex flex-wrap">

                <%@ include file="layout/equipement_menu.jsp" %>

                <main class="flex-1 bg-gray-900">

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
                                <c:forEach var="e" items="${requestScope.equipments}">

                                <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                                    <td class="p-4">
                                        <img src="images/equipment/${e.e_equipmentID}.jpg"
                                             class=" md:w-32 max-w-24 max-h-20" alt="">
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                            ${e.equipmentName}
                                    </td>
                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl">
                                            ${e.equipmentType}
                                    </td>

                                    <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white text-xl ">
                                        <p class="${e.status=='CheckedOut'? 'text-red-500':'text-green-600'}"> ${e.status}</p>
                                    </td>


                                    <td class="px-6 py-4">
                                        <c:choose>
                                        <c:when test="${e.w_equipmentID >0 && e.status == 'CheckedOut'}">
                                            <button class=" p-4 text-xl rounded rounded-lg bg-red-500" disabled>
                                                <span class=" font-bold
                                                text-white">In Wish</span>
                                            </button>
                                        </c:when>

                                        <c:when test="${ e.status == 'Available' && e.cartID ==0}">
                                            <button class=" p-4 text-xl rounded rounded-lg bg-green-500 hover:bg-orange-500">
                                                <a href="reserve?action=add&equipmentId=${e.e_equipmentID}"
                                                   class="font-bold hover:bg-orange-500 text-white"><span
                                                        class=" font-bold text-white">Reserve</span></a>
                                            </button>
                                        </c:when>

                                        <c:when test="${  e.cartID >0  }">
                                            <button class=" p-4 text-xl rounded rounded-lg bg-orange-500 "
                                                    disabled>
                                                <span class=" font-bold  text-white">In Cart</span>
                                            </button>
                                        </c:when>

                                        <c:when test="${ e.status == 'CheckedOut' && e.cartID ==0 && e.wishID ==0}">
                                        <button class=" p-4 text-xl rounded rounded-lg bg-blue-500 font-bold cursor-pointer hover:bg-orange-500
                                                text-white" id="addWish">
                                            <a href="wish?action=add&equipmentId=${e.e_equipmentID}"
                                               class="font-bold hover:bg-orange-500 text-white"><span
                                                    class=" font-bold text-white">Add Wish</span></a>
                                            </c:when>
                                            </c:choose>
                                    </td>
                                </tr>
                            </tbody>
                            <c:if test="${param.addWish.equals('success')}">
                                <script>
                                    Swal.fire({
                                        title: 'Added',
                                        text: 'Equipment has been added to your wishlist',
                                        icon: 'success',
                                        confirmButtonText: 'OK'
                                    });
                                </script>
                            </c:if>
                            <c:if test="${param.addCart.equals('success')}">
                                <script>
                                    Swal.fire({
                                        title: 'Added',
                                        text: 'Equipment has been added to cart',
                                        icon: 'success',
                                        confirmButtonText: 'OK'
                                    });
                                </script>
                            </c:if>
                            </c:forEach>

                        </table>

                    </div>
                    <c:if test="${param.createBooking.equals('success')}">
                        <script>
                            Swal.fire({
                                title: 'Created',
                                text: 'Booking has been created successfully!',
                                icon: 'success',
                                confirmButtonText: 'OK'
                            });
                        </script>
                    </c:if>
                </main>
            </div>
        </section>
    </body>
</html>
