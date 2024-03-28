<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/3/29
  Time: 上午 01:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ include file="layout/top_nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ include file="bootstrap/bootstrp_css.jsp" %>--%>

<html>
    <head>
        <title>Profile</title>
        <link rel="stylesheet" href="css/nav.css">
        <link rel="stylesheet" href="css/userProfile.css">
    </head>
    <body>
        <c:if test="${requestScope.user.isValidUser == true}">
            <div class="page-content page-container" id="page-content">
                <div class="padding ">
                    <div class="row container d-flex justify-content-center ">
                        <div class="relative top-20 left-60">
                            <div class="card user-card-full ">
                                <div class="row m-l-0 m-r-0">
                                    <div class="col-sm-4 bg-c-lite-green user-profile">
                                        <div class="card-block text-center text-white">
                                            <div class="flex justify-center">
                                                <img src="https://img.icons8.com/bubbles/100/000000/user.png"
                                                     class="img-radius" alt="User-Profile-Image">
                                            </div>
                                            <h6 class="f-w-600 text-xl">${requestScope.user.fName} ${requestScope.user.lName}</h6>
                                            <p class="text-xl"><span
                                                    class="font-semibold text-xl">User ID: </span>${requestScope.user.userID}
                                            </p>
                                        </div>
                                    </div>
                                    <div class="p-4 bg-slate-200">
                                        <div class="flex justify-between items-center">
                                            <span class="font-bold text-2xl">
                                                Information
                                            </span>
                                            <div class="inline">
                                                <button
                                                        class="p-4 bg-green-500 rounded-md font-bold text-white hover:bg-orange-500">
                                                    Edit
                                                </button>
                                                <button class="p-4 bg-blue-500 rounded-md font-bold text-white hover:bg-pink-500">
                                                    Update
                                                    password
                                                </button>
                                            </div>

                                        </div>
                                        <hr class="h-px my-4  bg-gray-600 border-1 dark:bg-gray-600">
                                        <div class="row">
                                            <div class="mb-4">
                                                <p class="m-b-10 f-w-600 text-lg">Email</p>
                                                <input type="email" value="${requestScope.user.email}" disabled
                                                       class="text-muted f-w-400 p-2 text-lg">
                                            </div>
                                            <div class="mb-4">
                                                <p class="m-b-10 f-w-600 text-lg">Phone</p>
                                                <input type="text" maxlength="8" min="8" max="8"
                                                       value="${requestScope.user.contact}"
                                                       class="text-muted f-w-400 p-2 text-lg" disabled>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="mb-4">
                                                <p class="m-b-10 f-w-600 text-lg">Gender</p>
                                                <h6 class="text-muted f-w-400 text-xl">${requestScope.user.gender}</h6>
                                            </div>
                                            <div class="mb-4">
                                                <p class="m-b-10 f-w-600 text-lg">Campus</p>
                                                <h6 class="text-muted f-w-400 text-xl">${requestScope.user.campus}</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </body>
</html>
