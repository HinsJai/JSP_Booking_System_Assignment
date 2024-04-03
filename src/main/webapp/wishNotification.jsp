<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/3
  Time: 下午 05:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%--&& sessionScope.wishNotification.js.getIsDismissed() ==false}--%>
<script src="js/wishNotification.js"></script>

<cn:if test="${not empty sessionScope.wishNotification && sessionScope.notificationDismiss == false}">
    <div class="absolute bottom-0 right-0 mb-4 mr-4 z-10">

        <div id="toast-message-cta"
             class="w-full max-w-xs p-4 text-gray-500 bg-white rounded-lg shadow "
             role="alert">
            <div class="flex">
                <img class="w-12 h-12 rounded-full" src="./images/equipment/1.jpg"
                     alt="" />
                <div class="ms-3 text-sm font-normal">
                    <span class="mb-4 text-xl font-semibold text-gray-900">Notification</span>
                        <%--                    <cn:forEach var="n" items="${sessionScope.wishNotification.js}">--%>
                    <div class="mb-2 text-base font-normal">
                            <%--                                ${n.getEquipmentName()}--%>
                        Your wish equipment is available now!
                    </div>
                        <%--                    </cn:forEach>--%>
                    <a href="wish?action=list"
                       class="inline-flex px-2.5 py-1.5 text-base font-medium text-center text-white bg-blue-600 rounded-lg hover:bg-orange-500
                       focus:ring-4 focus:outline-none focus:ring-blue-300">
                        Wish list
                    </a>
                    <button type="button" data-dismiss-target="#toast-message-cta" onclick="dismissNotification()"
                            class="ml-6 inline-flex px-2.5 py-1.5 text-base font-medium text-center text-white bg-red-600 rounded-lg hover:bg-blue-700
                            focus:ring-4 focus:outline-none focus:ring-blue-300 ">
                        Dismiss
                    </button>
                </div>
                    <%--                <button type="button"--%>
                    <%--                        class="ms-auto -mx-1.5 -my-1.5 bg-white justify-center items-center flex-shrink-0 text-gray-400 hover:text-gray-900 rounded-lg focus:ring-2 focus:ring-gray-300 p-1.5 hover:bg-gray-100 inline-flex h-8 w-8 dark:text-gray-500 dark:hover:text-white dark:bg-gray-800 dark:hover:bg-gray-700"--%>
                    <%--                        data-dismiss-target="#toast-message-cta" aria-label="Close">--%>
                    <%--                    <span class="sr-only">Close</span>--%>
                    <%--                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"--%>
                    <%--                         viewBox="0 0 14 14">--%>
                    <%--                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"--%>
                    <%--                              d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />--%>
                    <%--                    </svg>--%>
                    <%--                </button>--%>
            </div>
        </div>


    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

</cn:if>
