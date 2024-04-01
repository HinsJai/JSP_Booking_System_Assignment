<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/3/31
  Time: 下午 04:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ict.itp4511_assignment.bean.EquipmentBean" %>
<%@ taglib uri="/WEB-INF/tlds/taglib" prefix="ict" %>
<%!ArrayList<EquipmentBean> cartList = null;%>

<div class="relative z-10" aria-labelledby="slide-over-title" role="dialog" aria-modal="true" hidden
     id="cart-container">
    <div class="fixed inset-0 overflow-hidden">
        <div class="absolute inset-0 overflow-hidden">
            <div class="pointer-events-none fixed inset-y-0 right-0 flex max-w-full pl-10">

                <div class="pointer-events-auto w-screen max-w-md">
                    <div class="flex h-full flex-col overflow-y-scroll bg-white shadow-xl">
                        <div class="flex-1 overflow-y-auto px-4 py-6 sm:px-6">
                            <div class="flex items-start justify-between">
                                <p class="text-3xl font-medium text-gray-900 font-bold" id="slide-over-title">Reserving
                                                                                                              cart</p>
                                <div class="ml-3 flex h-7 items-center">
                                    <button type="button" class="relative -m-2 p-2 text-gray-400 hover:text-gray-500">
                                        <span class="absolute -inset-0.5" id="close"></span>
                                        <span class="sr-only">Close panel</span>
                                        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                             stroke="currentColor" aria-hidden="true">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M6 18L18 6M6 6l12 12" />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <div class="mt-8">
                                <div class="flow-root">
                                    <ul role="list" class="-my-6 divide-y divide-gray-200">
                                        <%
                                            try {
                                                cartList = (ArrayList<EquipmentBean>) session.getAttribute("cartList");
                                                if (cartList != null && !cartList.isEmpty()) {
                                                    for (EquipmentBean equipment : cartList) {
                                        %>
                                        <jsp:useBean id="c" class="ict.itp4511_assignment.bean.EquipmentBean"
                                                     scope="request" />
                                        <jsp:setProperty name="c" property="campusID"
                                                         value="<%=equipment.getCampusID()%>" />
                                        <jsp:setProperty name="c" property="equipmentID"
                                                         value="<%=equipment.getEquipmentID()%>" />
                                        <jsp:setProperty name="c" property="equipmentName"
                                                         value="<%=equipment.getEquipmentName()%>" />
                                        <jsp:setProperty name="c" property="equipmentType"
                                                         value="<%=equipment.getEquipmentType()%>" />
                                        <jsp:setProperty name="c" property="serialNumber"
                                                         value="<%=equipment.getSerialNumber()%>" />
                                        <jsp:setProperty name="c" property="purchaseDate"
                                                         value="<%=equipment.getPurchaseDate()%>" />
                                        <jsp:setProperty name="c" property="warrantyPeriod"
                                                         value="<%=equipment.getWarrantyPeriod()%>" />
                                        <jsp:setProperty name="c" property="status"
                                                         value="<%=equipment.getStatus()%>" />

                                        <li class="flex py-6">
                                            <div class="h-24 w-24 flex-shrink-0 overflow-hidden rounded-md border border-gray-200">
                                                <img src=""
                                                     alt=""
                                                     class="h-full w-full object-cover object-center">
                                            </div>
                                            <div class="ml-4 flex flex-1 flex-col">
                                                <div>
                                                    <div class="flex justify-between text-base font-medium text-gray-900">
                                                        <h3>
                                                            <jsp:getProperty name="c" property="equipmentName" />
                                                        </h3>
                                                    </div>
                                                    <p class="mt-1 text-sm text-gray-500">
                                                        <jsp:getProperty name="c" property="equipmentType" />
                                                    </p>
                                                </div>
                                                <div class="flex flex-1 items-end justify-between text-sm">
                                                    <div class="flex">
                                                        <button type="button" onclick="removeItem(<jsp:getProperty
                                                                name="c" property="equipmentID"/>)"
                                                                class="font-medium text-indigo-600 hover:text-indigo-500">
                                                            Remove
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <%
                                        }
                                    } else {
                                    %>
                                    <ict:msg type="info" message="Empty Cart" />
                                    <%
                                            }
                                        } catch (Exception e) {
                                            out.println("<p>Error occurred: " + e.getMessage() + "</p>");
                                        }
                                    %>
                                </div>
                            </div>
                        </div>

                        <div class="border-t border-gray-200 px-4 py-6 sm:px-6">
                            <div class="mt-6 flex items-center justify-center">
                                <button <%=(cartList.isEmpty()) ? "disabled" : ""%> id="checkout"
                                                                                    class="<%=(cartList.isEmpty()) ? "bg-slate-500" : "hover:bg-orange-500 bg-indigo-600"%> w-60 rounded-md border border-transparent  px-6 py-3 text-xl font-bold text-white shadow-sm ">
                                    Checkout
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

