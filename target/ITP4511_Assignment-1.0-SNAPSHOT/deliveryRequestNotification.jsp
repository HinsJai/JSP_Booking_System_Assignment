<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/11
  Time: 下午 09:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cb" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<script src="js/notification.js"></script>

<cb:if test="${not empty sessionScope.deliveryRequestNotification && sessionScope.notificationDismiss == false}">
    <div class="absolute bottom-0 right-0 mb-4 mr-4 z-10">
        <div id="toast-message-cta"
             class="w-full max-w-xs p-4 text-gray-500 bg-white rounded-lg shadow "
             role="alert">
            <div class="flex">
                <img class="w-12 h-12 rounded-full" src="./images/notification_icon.png"
                     alt="" />
                <div class="ms-3 text-sm font-normal">
                    <span class="mb-4 text-xl font-semibold text-gray-900">Notification</span>
                    <div class="mb-2 text-base font-normal">
                        You have new delivery request!
                    </div>
                    <a href="delivery?action=courier_deliveryList"
                       class="inline-flex px-2.5 py-1.5 text-base font-medium text-center text-white bg-blue-600 rounded-lg hover:bg-orange-500
                       focus:ring-4 focus:outline-none focus:ring-blue-300">
                        View
                    </a>
                    <button type="button" data-dismiss-target="#toast-message-cta"
                            onclick="dismissBookingRequestNotification()"
                            class="ml-6 inline-flex px-2.5 py-1.5 text-base font-medium text-center text-white bg-red-600 rounded-lg hover:bg-blue-700
                            focus:ring-4 focus:outline-none focus:ring-blue-300 ">
                        Dismiss
                    </button>
                </div>

            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

</cb:if>
