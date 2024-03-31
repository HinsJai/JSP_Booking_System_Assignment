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
        <script
                src="https://code.jquery.com/jquery-3.7.1.min.js"
                integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10">
        </script>
    </head>
    <body>
        <c:choose>
            <c:when test="${param.page.equals('updatePassword')}">
                <div>
                    <jsp:include page="updatePassword.jsp" />
                </div>
            </c:when>
            <c:otherwise>
                <c:if test="${requestScope.user.isValidUser == true}">
                    <div class="page-content page-container " id="profile-container">
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
                                                    <span class="text-xl">
                                                       <span class="font-semibold text-xl">User ID: </span>
                                                    </span>
                                                    <span id="userID"
                                                          class="font-semibold text-xl">${requestScope.user.userID}</span>
                                                </div>
                                            </div>
                                            <div class="p-4 bg-slate-200">
                                                <div class="flex justify-between items-center">
                                                    <span class="font-bold text-2xl">
                                                    Information
                                                    </span>
                                                    <div class="inline">
                                                        <button
                                                                class="p-4 bg-green-500 rounded-md font-bold text-white hover:bg-orange-500"
                                                                id="edit">
                                                            Edit
                                                        </button>
                                                        <button hidden
                                                                class="p-4 bg-green-500 rounded-md font-bold text-white hover:bg-orange-500"
                                                                id="save" name="save">
                                                            Save
                                                        </button>
                                                        <button class="p-4 bg-blue-500 rounded-md font-bold text-white hover:bg-pink-500"
                                                                id="update_pwd">
                                                            Update
                                                            password
                                                        </button>
                                                        <button class="p-4 bg-blue-500 rounded-md font-bold text-white hover:bg-pink-500"
                                                                id="cancel" hidden>
                                                            Cancel
                                                        </button>
                                                    </div>
                                                    <c:if test="${param.updateUser.equals('success')}">
                                                        <script>
                                                            Swal.fire({
                                                                title: 'Updated',
                                                                text: 'Profile updated successfully',
                                                                icon: 'success',
                                                                confirmButtonText: 'OK'
                                                            });
                                                        </script>
                                                    </c:if>
                                                    <c:if test="${param.updatePassword.equals('success')}">
                                                        <script>
                                                            Swal.fire({
                                                                title: 'Updated',
                                                                text: 'Password updated successfully',
                                                                icon: 'success',
                                                                confirmButtonText: 'OK'
                                                            });
                                                        </script>
                                                    </c:if>
                                                </div>
                                                <hr class="h-px my-4  bg-gray-600 border-1 dark:bg-gray-600">
                                                <div class="row">
                                                    <div class="mb-4">
                                                        <p class="m-b-10 f-w-600 text-lg">Email</p>
                                                        <input type="email" value="${requestScope.user.email}" disabled
                                                               class="text-muted f-w-400 p-2 text-lg" id="email">
                                                    </div>
                                                    <div class="mb-4">
                                                        <p class="m-b-10 f-w-600 text-lg">Phone</p>
                                                        <input type="text" maxlength="8" min="8" max="8"
                                                               value="${requestScope.user.contact}"
                                                               class="text-muted f-w-400 p-2 text-lg" id="phone"
                                                               disabled>
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
            </c:otherwise>
        </c:choose>
        <script src="js/userProfile.js">
        </script>
    </body>
</html>
