<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/12
  Time: 上午 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<%@ include file="layout/technician_nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cd" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
    <head>
        <title>Analytic</title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>


    </head>
    <body class="bg-gray-900">
        <sql:setDataSource var="bookingRate" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/itp4511_db?useSSL=false"
                           user="root" password="root" />
        <cd:set var="now" value="<%=new java.util.Date()%>" />

        <sql:query dataSource="${bookingRate}" var="result">
            SELECT
            YEAR(booking.bookingDate) AS Year,
            COUNT(*) AS TotalBookingRate
            FROM
            booking
            INNER JOIN
            userinfo ON booking.userID = userinfo.userID
            WHERE
            userinfo.campusID = '${param.campusID == null ? 'TY' : param.campusID}'
            AND booking.bookingStatus = 'Completed'
            AND YEAR(booking.bookingDate) = YEAR(CURDATE())
            GROUP BY
            YEAR(booking.bookingDate)
            ORDER BY
            Year;
        </sql:query>

        <div class=" w-[800px] h-full bg-white rounded-lg shadow dark:bg-gray-800 p-4 md:p-6">
            <div class="flex justify-between border-gray-200 border-b dark:border-gray-700 pb-3">
                <div>
                    <div class="text-base font-normal text-gray-500 dark:text-gray-400 pb-1">Total booking
                                                                                             (<fmt:formatDate
                                pattern="yyyy"
                                value="${now}" />)
                    </div>
                    <p class="leading-none text-3xl font-bold text-gray-900 dark:text-white">
                        <cd:forEach var="row" items="${result.rows}">
                            ${row.TotalBookingRate}
                        </cd:forEach>
                    </p>
                </div>
                <div>

                </div>
            </div>


            <div id=""></div>
            <div class="grid grid-cols-1 items-center border-gray-200 border-t dark:border-gray-700 justify-between">
                <div class="flex justify-between items-center pt-5">
                    <div id=""
                         class="z-10   shadow ">
                        <label class="text-white"> Campus:
                            <select class="py-2 text-sm text-white bg-gray-600 rounded-md p-2" id="venue">
                                <option value="TY" ${param.campusID == null ||  param.campusID == 'TY'? 'selected="selected"' : ''}>
                                    TY
                                </option>
                                <option value="CW" ${param.campusID == 'CW' ? 'selected="selected"' : ''}>CW</option>
                                <option value="LWL" ${param.campusID == 'LWL' ? 'selected="selected"' : ''}>LWL</option>
                                <option value="ST" ${param.campusID == 'ST' ? 'selected="selected"' : ''}>ST</option>
                                <option value="TM" ${param.campusID == 'TM' ? 'selected="selected"' : ''}>TM</option>
                            </select>
                        </label>
                    </div>
                    <%--                    <a--%>
                    <%--                            href="#"--%>
                    <%--                            class="uppercase text-sm font-semibold inline-flex items-center rounded-lg text-blue-600 hover:text-blue-700 dark:hover:text-blue-500  hover:bg-gray-100 dark:hover:bg-gray-700 dark:focus:ring-gray-700 dark:border-gray-700 px-3 py-2">--%>
                    <%--                        --%>
                    <%--                        <svg class="w-2.5 h-2.5 ms-1.5 rtl:rotate-180" aria-hidden="true"--%>
                    <%--                             xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">--%>
                    <%--                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"--%>
                    <%--                                  d="m1 9 4-4-4-4" />--%>
                    <%--                        </svg>--%>
                    <%--                    </a>--%>
                </div>
            </div>
        </div>
        <sql:query dataSource="${bookingRate}" var="result">
            SELECT YEAR(booking.bookingDate) AS Year,
            MONTH(booking.bookingDate) AS Month,
            campusID,
            COUNT(*) AS BookingRate
            FROM booking
            INNER JOIN
            userinfo ON booking.userID = userinfo.userID
            WHERE userinfo.campusID = '${param.campusID == null ? 'TY' : param.campusID}'

            and booking.bookingStatus = 'Completed'
            GROUP BY YEAR(booking.bookingDate),
            MONTH(booking.bookingDate)
            ORDER BY Year,
            Month;
        </sql:query>

        <script>
            let data = new Array(12).fill(0);
            <cd:forEach var="row" items="${result.rows}">
            data[parseInt(${row.Month}) - 1] = parseInt(${row.BookingRate});
            </cd:forEach>
            const options = {
                series: [
                    {
                        name: "Venue booking rate",
                        color: "#31C48D",
                        data: data

                        <%--                        <cd:forEach var="i" items="${result.rows}">--%>
                        <%--                        <cd:choose>--%>
                        <%--                        <cd:when test="${i.Month==1}">--%>
                        <%--                        <cd:set value="${i.bookingRate}" var="jan" scope="page"/>--%>
                        <%--                        </cd:when>--%>
                        <%--                        <cd:when test="${i.Month==2}">--%>
                        <%--                        <cd:set value="${i.bookingRate}" var="feb" scope="page"/>--%>
                        <%--                        </cd:when>--%>
                        <%--                        <cd:when test="${i.Month==3}">--%>
                        <%--                        <cd:set value="${i.bookingRate}" var="mar" scope="page"/>--%>
                        <%--                        </cd:when>--%>
                        <%--                        <cd:when test="${i.Month==4}">--%>
                        <%--                        <cd:set value="${i.bookingRate}" var="apr" scope="page"/>--%>
                        <%--                        </cd:when>--%>
                        <%--                        <cd:when test="${i.Month==5}">--%>
                        <%--                        <cd:set value="${i.bookingRate}" var="may" scope="page" />--%>
                        <%--                        </cd:when>--%>
                        <%--                        <cd:when test="${i.Month==6}">--%>
                        <%--                        <cd:set value="${i.bookingRate}" var="jun" scope="page"/>--%>
                        <%--                        </cd:when>--%>
                        <%--                        <cd:when test="${i.Month==7}">--%>
                        <%--                        <cd:set value="${i.bookingRate}" var="jul" scope="page"/>--%>
                        <%--                        </cd:when>--%>
                        <%--                        <cd:when test="${i.Month==8}">--%>
                        <%--                        <cd:set value="${i.bookingRate}" var="aug" scope="page" />--%>
                        <%--                        </cd:when>--%>
                        <%--                        <cd:when test="${i.Month==9}">--%>
                        <%--                        <cd:set value="${i.bookingRate}" var="sep" scope="page"/>--%>
                        <%--                        </cd:when>--%>
                        <%--                        <cd:when test="${i.Month==10}">--%>
                        <%--                        <cd:set value="${i.bookingRate}" var="oct" scope="page" />--%>
                        <%--                        </cd:when>--%>
                        <%--                        <cd:when test="${i.Month==11}">--%>
                        <%--                        <cd:set value="${i.bookingRate}" var="nov" scope="page" />--%>
                        <%--                        </cd:when>--%>
                        <%--                        <cd:when test="${i.Month==12}">--%>
                        <%--                        <cd:set value="${i.bookingRate}" var="dec" scope="page"/>--%>
                        <%--                        </cd:when>--%>
                        <%--                        </cd:choose>--%>
                        <%--                        </cd:forEach>--%>
                        <%--                        data: ["${jan==null?0:jan}", "${feb==null?0:feb}", "${mar==null?0:mar}", "${apr==null?0:apr}", "${may==null?0:may}", "${jun==null?0:jun}", "${jul==null?0:jul}",--%>
                        <%--                            "${aug==null?0:aug}", "${sep==null?0:sep}", "${oct==null?0:oct}", "${nov==null?0:nov}", "${dec==null?0:dec}"],--%>
                    },
                ],
                chart: {
                    sparkline: {
                        enabled: false,
                    },
                    type: "bar",
                    width: "100%",
                    height: 400,
                    toolbar: {
                        show: false,
                    }
                },
                fill: {
                    opacity: 1,
                },
                plotOptions: {
                    bar: {
                        horizontal: true,
                        columnWidth: "100%",
                        borderRadiusApplication: "end",
                        borderRadius: 6,
                        dataLabels: {
                            position: "top",
                        },
                    },
                },
                legend: {
                    show: true,
                    position: "bottom",
                },
                dataLabels: {
                    enabled: false,
                },
                tooltip: {
                    shared: true,
                    intersect: false,
                    formatter: function (value) {
                        return value
                    }
                },
                xaxis: {
                    labels: {
                        show: true,
                        style: {
                            fontFamily: "Inter, sans-serif",
                            cssClass: 'text-xs font-normal fill-gray-500 dark:fill-gray-400'
                        },
                        formatter: function (value) {
                            return value
                        }
                    },
                    categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    axisTicks: {
                        show: false,
                    },
                    axisBorder: {
                        show: false,
                    },
                },
                yaxis: {
                    labels: {
                        show: true,
                        style: {
                            fontFamily: "Inter, sans-serif",
                            cssClass: 'text-xs font-normal fill-gray-500 dark:fill-gray-400'
                        }
                    }
                },
                grid: {
                    show: true,
                    strokeDashArray: 4,
                    padding: {
                        left: 2,
                        right: 2,
                        top: -20
                    },
                },
                fill: {
                    opacity: 1,
                }
            }

            if (document.getElementById("bar-chart") && typeof ApexCharts !== 'undefined') {
                const chart = new ApexCharts(document.getElementById("bar-chart"), options);
                chart.render();
            }

        </script>
        <script>
            $("#venue").change(function () {
                console.log($(this).val());
                $.ajax({
                    url: "analytic?action=changeCampus",
                    type: "POST",
                    data: {
                        campusID: $(this).val()
                    },
                    success: function (data) {
                        window.location.replace("analytic?action=list&campusID=" + data.campusID);
                    }
                });
            });
        </script>
    </body>
</html>
