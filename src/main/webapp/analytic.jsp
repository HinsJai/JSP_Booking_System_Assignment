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
<%@ taglib prefix="cb" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
    <head>
        <title>Analytic</title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <%--        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>--%>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script
                type="module"
                src="https://unpkg.com/@material-tailwind/html@latest/scripts/popover.js"
        ></script>
        <script src="https://unpkg.com/@material-tailwind/html@latest/scripts/ripple.js"></script>

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
            AND YEAR(booking.bookingDate) = YEAR(CURDATE())
            GROUP BY
            YEAR(booking.bookingDate)
            ORDER BY
            Year;
        </sql:query>
        <div class="flex-1 bg-[#222222] p-8">
            <div
                    style="height: 3%"
                    class="text-slate-50 w-full mb-5"
            >
                <span class="font-bold text-4xl flex justify-start">Dashboard (${param.campusID == null ? 'TY' : param.campusID})
                <span class="flex  justify-start ml-2">
                                  <button
                                          data-ripple-light="true"
                                          data-popover-target="menu0"
                                          class="select-none rounded-lg bg-gray-600 hover:bg-orange-500 py-2 px-6 text-center align-middle font-sans text-xs font-bold uppercase text-white shadow-md shadow-gray-900/10 transition-all hover:shadow-lg hover:shadow-gray-900/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
                                  >
                Venue
              </button>
              <ul
                      role="menu"
                      data-popover="menu0"
                      data-popover-placement="bottom"
                      class="absolute z-10 min-w-[180px] overflow-auto rounded-md border border-blue-gray-50 bg-white p-3 font-sans text-sm font-normal text-black shadow-lg shadow-blue-gray-500/10 focus:outline-none"
              >
                <li
                        role="menuitem"
                        onclick="window.location.replace('analytic?action=venue&campusID=TY&duration=${param.duration == null ? 'month' : param.duration }&eDuration=${param.eDuration == null ? 'month' : param.eDuration }')"
                <%--                --%>
                        class="block w-full cursor-pointer select-none rounded-md px-3 pt-[9px] pb-2 text-start leading-tight transition-all hover:bg-gray-300 hover:bg-opacity-80 hover:text-blue-gray-900 focus:bg-blue-gray-50 focus:bg-opacity-80 focus:text-blue-gray-900 active:bg-blue-gray-50 active:bg-opacity-80 active:text-blue-gray-900"
                >
                  TY
                </li>
                <li
                        role="menuitem"
                        onclick="window.location.replace('analytic?action=venue&campusID=ST&duration=${param.duration == null ? 'month' : param.duration }&eDuration=${param.eDuration == null ? 'month' : param.eDuration }')"
                        class="block w-full cursor-pointer select-none rounded-md px-3 pt-[9px] pb-2 text-start leading-tight transition-all hover:bg-gray-300 hover:bg-opacity-80 hover:text-blue-gray-900 focus:bg-blue-gray-50 focus:bg-opacity-80 focus:text-blue-gray-900 active:bg-blue-gray-50 active:bg-opacity-80 active:text-blue-gray-900"
                >
                  ST
                </li>
                <li
                        role="menuitem"
                        onclick="window.location.replace('analytic?action=venue&campusID=CW&duration=${param.duration == null ? 'month' : param.duration }&eDuration=${param.eDuration == null ? 'month' : param.eDuration }')"
                        class="block w-full cursor-pointer select-none rounded-md px-3 pt-[9px] pb-2 text-start leading-tight transition-all hover:bg-gray-300 hover:bg-opacity-80 hover:text-blue-gray-900 focus:bg-blue-gray-50 focus:bg-opacity-80 focus:text-blue-gray-900 active:bg-blue-gray-50 active:bg-opacity-80 active:text-blue-gray-900"
                >
                  CW
                </li>
                             <li
                                     role="menuitem"
                                     onclick="window.location.replace('analytic?action=venue&campusID=LWL&duration=${param.duration == null ? 'month' : param.duration }&eDuration=${param.eDuration == null ? 'month' : param.eDuration }')"
                                     class="block w-full cursor-pointer select-none rounded-md px-3 pt-[9px] pb-2 text-start leading-tight transition-all hover:bg-gray-300 hover:bg-opacity-80 hover:text-blue-gray-900 focus:bg-blue-gray-50 focus:bg-opacity-80 focus:text-blue-gray-900 active:bg-blue-gray-50 active:bg-opacity-80 active:text-blue-gray-900"
                             >
                  LWL
                </li>
                  </li>
                  <li
                          role="menuitem"
                          onclick="window.location.replace('analytic?action=venue&campusID=TM&duration=${param.duration == null ? 'month' : param.duration }&eDuration=${param.eDuration == null ? 'month' : param.eDuration }')"
                          class="block w-full cursor-pointer select-none rounded-md px-3 pt-[9px] pb-2 text-start leading-tight transition-all hover:bg-gray-300 hover:bg-opacity-80 hover:text-blue-gray-900 focus:bg-blue-gray-50 focus:bg-opacity-80 focus:text-blue-gray-900 active:bg-blue-gray-50 active:bg-opacity-80 active:text-blue-gray-900"
                  >
                  TM
                </li>
              </ul>
                </span>
                    </span>
                <%--                <p class="text-white text-2xl font-semibold" id="date-time-now"></p>--%>
            </div>
            <div class="grid grid-cols-4 gap-6 mb-6">
                <div
                        class="bg-[#272727] flex justify-between p-5 rounded-2xl shadow-2xl"
                >
                    <div>
                        <p class="text-green-500 text-3xl">
                            <cd:choose>
                                <cd:when test="${empty result.rows}">
                                    0
                                </cd:when>
                                <cd:otherwise>
                                    <cd:forEach var="row" items="${result.rows}">
                                        ${row.TotalBookingRate}
                                    </cd:forEach>
                                </cd:otherwise>
                            </cd:choose>
                        </p>
                        <p class="text-white text-xl">Total Booking</p>
                    </div>
                </div>

                <div
                        class="bg-[#272727] flex justify-between p-5 rounded-2xl shadow-2xl"
                >
                    <sql:query dataSource="${bookingRate}" var="result">
                        SELECT
                        DATE(booking.bookingDate) AS Date,
                        COUNT(*) AS TotalBookingRate
                        FROM
                        booking
                        INNER JOIN
                        userinfo ON booking.userID = userinfo.userID
                        WHERE
                        userinfo.campusID = '${param.campusID == null ? 'TY' : param.campusID}'
                        AND booking.bookingStatus = 'Pending'
                        AND DATE(booking.bookingDate) = CURDATE()
                        GROUP BY
                        DATE(booking.bookingDate)
                        ORDER BY
                        Date;
                    </sql:query>
                    <div>
                        <p class="text-yellow-500 text-3xl">
                            <cd:choose>
                                <cd:when test="${empty result.rows}">
                                    0
                                </cd:when>
                                <cd:otherwise>
                                    <cd:forEach var="row" items="${result.rows}">
                                        ${row.TotalBookingRate}
                                    </cd:forEach>
                                </cd:otherwise>
                            </cd:choose>
                        </p>
                        <p class="text-white text-xl">Pending Booking</p>
                    </div>
                </div>

                <div
                        class="bg-[#272727] flex justify-between p-5 rounded-2xl shadow-2xl"
                >
                    <sql:query dataSource="${bookingRate}" var="result">
                        SELECT COUNT(*) AS TotalUsers
                        FROM userinfo
                        WHERE campusID = '${param.campusID == null ? 'TY' : param.campusID}';
                    </sql:query>

                    <div>
                        <p class="text-blue-500 text-3xl" id="warning_day_count">
                            <cd:choose>
                                <cd:when test="${empty result.rows}">
                                    0
                                </cd:when>
                                <cd:otherwise>
                                    <cd:forEach var="row" items="${result.rows}">
                                        ${row.TotalUsers}
                                    </cd:forEach>
                                </cd:otherwise>
                            </cd:choose>
                        </p>
                        <p class="text-white text-xl">Total User</p>
                        <p></p>
                    </div>

                </div>

                <div
                        class="bg-[#272727] flex justify-between p-5 rounded-2xl shadow-2xl"
                >
                    <sql:query var="result" dataSource="${bookingRate}">
                        SELECT COALESCE(COUNT(*), 0) AS totalPending, e.campusID
                        FROM damageReport dr
                        JOIN equipment e ON dr.equipmentID = e.equipmentID
                        WHERE dr.status = 'Pending'
                        AND e.campusID = '${param.campusID == null ? 'TY' : param.campusID}'
                        GROUP BY e.campusID;

                    </sql:query>
                    <div>
                        <p class="text-red-600 text-3xl">
                            <cd:choose>
                                <cd:when test="${empty result.rows}">
                                    0
                                </cd:when>
                                <cd:otherwise>
                                    <cd:forEach var="row" items="${result.rows}">
                                        ${row.totalPending}
                                    </cd:forEach>
                                </cd:otherwise>
                            </cd:choose>
                        </p>
                        <p class="text-white text-xl">Today Damage</p>
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-3 gap-6 border-none">
                <div class="col-span-2 bg-[#272727] p-5 rounded-2xl shadow-2xl">
                    <div class="flex justify-center">
    <span class="text-slate-50 text-center text-2xl mb-4 mr-4"
    >Venue of Booking rate <span class="uppercase">(${param.duration})</span></span
    >
                        <span>
    <button
            data-ripple-light="true"
            data-popover-target="menu2"
            class="select-none rounded-lg bg-gray-600 hover:bg-orange-500 py-2 px-6 text-center align-middle font-sans text-xs font-bold uppercase text-white shadow-md shadow-gray-900/10 transition-all hover:shadow-lg hover:shadow-gray-900/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
    >
    Duration
    </button>
    <ul
            role="menu"
            data-popover="menu2"
            data-popover-placement="bottom"
            class="absolute z-10 min-w-[180px] overflow-auto rounded-md border border-blue-gray-50 bg-white p-3 font-sans text-sm font-normal text-blue-gray-500 shadow-lg shadow-blue-gray-500/10 focus:outline-none"
    >

    <li
            role="menuitem"
            onclick="window.location.replace('analytic?action=list&campusID=${param.campusID == null ? 'TY' : param.campusID}&duration=month&eDuration=${param.eDuration == null ? 'month' : param.eDuration }')"
            class="block w-full cursor-pointer select-none rounded-md px-3 pt-[9px] pb-2 text-start leading-tight transition-all hover:bg-gray-300 hover:bg-opacity-80 hover:text-blue-gray-900 focus:bg-blue-gray-50 focus:bg-opacity-80 focus:text-blue-gray-900 active:bg-blue-gray-50 active:bg-opacity-80 active:text-blue-gray-900"
    >
    Month
    </li>
    <li
            role="menuitem"
            onclick="window.location.replace('analytic?action=list&campusID=${param.campusID == null ? 'TY' : param.campusID}&duration=year&eDuration=${param.eDuration == null ? 'month' : param.eDuration }')"

            class="block w-full cursor-pointer select-none rounded-md px-3 pt-[9px] pb-2 text-start leading-tight transition-all hover:bg-gray-300 hover:bg-opacity-80 hover:text-blue-gray-900 focus:bg-blue-gray-50 focus:bg-opacity-80 focus:text-blue-gray-900 active:bg-blue-gray-50 active:bg-opacity-80 active:text-blue-gray-900"
    >
    Year
    </li>
    </ul>
    </span>

                    </div>
                    <canvas id="venue-booking-rate" class="text-white"></canvas>
                </div>
                <div class="col-span-1 bg-[#272727] p-5 rounded-2xl shadow-2xl">
                    <div class="flex justify-center">
    <span class="text-slate-50 text-center text-2xl mb-4 mr-4">
    Equipment Booking rate <span class="uppercase">(${param.eDuration})</span>
    </span>
                        <span>
    <button
            data-ripple-light="true"
            data-popover-target="menu"
            class="select-none rounded-lg bg-gray-600 hover:bg-orange-500 py-2 px-6 text-center align-middle font-sans text-xs font-bold uppercase text-white shadow-md shadow-gray-900/10 transition-all hover:shadow-lg hover:shadow-gray-900/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
    >
    Duration
    </button>
    <ul
            role="menu"
            data-popover="menu"
            data-popover-placement="bottom"
            class="absolute z-10 min-w-[180px] overflow-auto rounded-md border border-blue-gray-50 bg-white p-3 font-sans text-sm font-normal text-blue-gray-500 shadow-lg shadow-blue-gray-500/10 focus:outline-none"
    >
    <li
            role="menuitem"
            onclick="window.location.replace('analytic?action=list&campusID=${param.campusID == null ? 'TY' : param.campusID}&duration=${param.duration == null ? 'month' : param.duration }&eDuration=month')"
            class="block w-full cursor-pointer select-none rounded-md px-3 pt-[9px] pb-2 text-start leading-tight transition-all hover:bg-gray-300 hover:bg-opacity-80 hover:text-blue-gray-900 focus:bg-blue-gray-50 focus:bg-opacity-80 focus:text-blue-gray-900 active:bg-blue-gray-50 active:bg-opacity-80 active:text-blue-gray-900"
    >
    Month
    </li>
    <li
            role="menuitem"
            onclick="window.location.replace('analytic?action=list&campusID=${param.campusID == null ? 'TY' : param.campusID}&duration=${param.duration == null ? 'month' : param.duration }&eDuration=year')"
            class="block w-full cursor-pointer select-none rounded-md px-3 pt-[9px] pb-2 text-start leading-tight transition-all hover:bg-gray-300 hover:bg-opacity-80 hover:text-blue-gray-900 focus:bg-blue-gray-50 focus:bg-opacity-80 focus:text-blue-gray-900 active:bg-blue-gray-50 active:bg-opacity-80 active:text-blue-gray-900"
    >
    Year
    </li>
    </ul>
    </span>
                    </div>
                    <canvas id="equipment-booking-rate" class="text-slate-50"></canvas>
                </div>
            </div>
        </div>
    </body>
    <cd:if test="${param.duration == 'month'}">
        <sql:query var="result" dataSource="${bookingRate}">
            SELECT
            YEAR(booking.bookingDate) AS Year,
            MONTH(booking.bookingDate) AS Month,
            COUNT(*) AS TotalBookingRate
            FROM
            booking
            INNER JOIN
            userinfo ON booking.userID = userinfo.userID
            WHERE
            userinfo.campusID = '${param.campusID == null ? 'TY' : param.campusID}'
            GROUP BY
            YEAR(booking.bookingDate), MONTH(booking.bookingDate)
            ORDER BY
            Year, Month;
        </sql:query>
    </cd:if>
    <cd:if test="${param.duration == 'year'}">
        <sql:query var="result" dataSource="${bookingRate}">
            SELECT
            YEAR(booking.bookingDate) AS Year,
            MONTH(booking.bookingDate) AS Month,
            COUNT(*) AS TotalBookingRate
            FROM
            booking
            INNER JOIN
            userinfo ON booking.userID = userinfo.userID
            WHERE
            userinfo.campusID = '${param.campusID == null ? 'TY' : param.campusID}'
            AND YEAR(booking.bookingDate) = YEAR(CURDATE())
            GROUP BY
            YEAR(booking.bookingDate), MONTH(booking.bookingDate)
            ORDER BY
            Year, Month;
        </sql:query>
    </cd:if>


    <cd:if test="${param.duration == 'month'}">
        <sql:query var="equipmentResult" dataSource="${bookingRate}">
            SELECT equipment.equipmentType, COUNT(*) AS EquipmentCount
            FROM booking
            INNER JOIN userinfo ON booking.userID = userinfo.userID
            INNER JOIN bookingequipment ON booking.bookingID = bookingequipment.bookingID
            INNER JOIN equipment ON bookingequipment.equipmentID = equipment.equipmentID
            WHERE userinfo.campusID = '${param.campusID == null ? 'TY' : param.campusID}'
            AND MONTH(booking.bookingDate) = MONTH(CURDATE())
            AND YEAR(booking.bookingDate) = YEAR(CURDATE())
            GROUP BY equipment.equipmentType;
        </sql:query>
    </cd:if>

    <cd:if test="${param.duration == 'year'}">
        <sql:query var="equipmentResult" dataSource="${bookingRate}">
            SELECT equipment.equipmentType, COUNT(*) AS EquipmentCount
            FROM booking
            INNER JOIN userinfo ON booking.userID = userinfo.userID
            INNER JOIN bookingequipment ON booking.bookingID = bookingequipment.bookingID
            INNER JOIN equipment ON bookingequipment.equipmentID = equipment.equipmentID
            WHERE userinfo.campusID = '${param.campusID == null ? 'TY' : param.campusID}'
            AND YEAR(booking.bookingDate) = YEAR(CURDATE())
            GROUP BY equipment.equipmentType;
        </sql:query>
    </cd:if>

    <script>

        let venueBookingRateData;
        let equipmentBookingRateData = new Array(11).fill(0);

        <cd:forEach var="row" items="${equipmentResult.rows}">
        <cb:choose>
        <cb:when test="${row.EquipmentType == 'Laptop'}">
        equipmentBookingRateData[0] = parseInt(${row.EquipmentCount});
        </cb:when>
        <cb:when test="${row.EquipmentType == 'Tablet'}">
        equipmentBookingRateData[1] = parseInt(${row.EquipmentCount});
        </cb:when>
        <cb:when test="${row.EquipmentType == 'Printer and Scanner'}">
        equipmentBookingRateData[2] = parseInt(${row.EquipmentCount});
        </cb:when>
        <cb:when test="${row.EquipmentType == 'Smart Phone'}">
        equipmentBookingRateData[3] = parseInt(${row.EquipmentCount});
        </cb:when>
        <cb:when test="${row.EquipmentType == 'Projector'}">
        equipmentBookingRateData[4] = parseInt(${row.EquipmentCount});
        </cb:when>
        <cb:when test="${row.EquipmentType == 'Monitor'}">
        equipmentBookingRateData[5] = parseInt(${row.EquipmentCount});
        </cb:when>
        <cb:when test="${row.EquipmentType == 'robot'}">
        equipmentBookingRateData[6] = parseInt(${row.EquipmentCount});
        </cb:when>
        <cb:when test="${row.EquipmentType == 'Server'}">
        equipmentBookingRateData[7] = parseInt(${row.EquipmentCount});
        </cb:when>
        <cb:when test="${row.EquipmentType == 'Networking'}">
        equipmentBookingRateData[8] = parseInt(${row.EquipmentCount});
        </cb:when>
        <cb:when test="${row.EquipmentType == 'Audio-Visual'}">
        equipmentBookingRateData[9] = parseInt(${row.EquipmentCount});
        </cb:when>
        <cb:when test="${row.EquipmentType == 'Others'}">
        equipmentBookingRateData[10] = parseInt(${row.EquipmentCount});
        </cb:when>
        </cb:choose>
        </cd:forEach>

        function daysInMonth(month, year) {
            return new Date(year, month, 0).getDate();
        }

        function get_month_days() {
            let date = new Date();
            let month = date.getMonth() + 1;
            let year = date.getFullYear();
            return daysInMonth(month, year);
        }

        function get_labels(duration) {
            switch (duration) {
                case 'month':
                    venueBookingRateData = new Array(get_month_days()).fill(0);
                <cd:forEach var="row" items="${result.rows}">
                    venueBookingRateData[parseInt(${row.Month}) - 1] = parseInt(${row.TotalBookingRate});
                </cd:forEach>

                    return Array.from({length: get_month_days()}, (_, index) => index + 1);
                case 'year':
                    venueBookingRateData = new Array(12).fill(0);
                <cd:forEach var="row" items="${result.rows}">
                    venueBookingRateData[parseInt(${row.Month}) - 1] = parseInt(${row.TotalBookingRate});
                </cd:forEach>
                    return [
                        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
                    ];
            }
        }


        new Chart(document.getElementById("venue-booking-rate"), {
            type: "line",
            data: {
                labels: get_labels(`${param.duration}`),

                datasets: [
                    {
                        label: "Num of booking",
                        data: venueBookingRateData,
                        backgroundColor: "yellow",
                        borderWidth: 2,
                        borderColor: "yellow",
                    },
                ],
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: `${param.duration =="month" ? "Day" : "Month"}`,
                            color: 'white',
                            font: {
                                size: 20
                            }
                        },
                        ticks: {
                            font: {
                                size: 20
                            },
                            color: 'white'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: `Count`,
                            color: 'white',
                            font: {
                                size: 20
                            }
                        },
                        ticks: {
                            font: {
                                size: 20
                            },
                            color: 'white'
                        }
                    }
                },
                plugins: {
                    legend: {
                        labels: {
                            font: {
                                size: 20
                            },
                            color: 'white'
                        }
                    }
                }
            },
        });
        const image = new Image();
        new Chart(document.getElementById("equipment-booking-rate"), {
            type: "doughnut",
            plugins: [
                {
                    id: "customCanvasBackgroundImage",
                    beforeDraw: (chart) => {
                        if (image.complete) {
                            const ctx = chart.ctx;
                            const {top, left, width, height} = chart.chartArea;
                            const x = left + width / 2 - image.width / 2;
                            const y = top + height / 2 - image.height / 2;
                            ctx.drawImage(image, x, y);
                        } else {
                            image.onload = () => chart.draw();
                        }
                    },
                },
            ],
            data: {
                labels: ["Laptop", "Tablet", "Printer & Scanner", "Smart Phone", "Projector", "Monitor", "Robot", "Server", "Networking", "Audio-Visual", "Others"],

                datasets: [
                    {
                        label: "Count",
                        data: equipmentBookingRateData,
                        backgroundColor: [
                            "rgb(50, 99, 132)",
                            "rgb(54, 162, 235)",
                            "rgb(255, 205, 86)",
                            "rgb(75, 192, 192)",
                            "rgb(153, 102, 255)",
                            "rgb(255, 159, 64)",
                            "rgb(255, 99, 132)",
                            "rgb(54, 162, 235)",
                            "rgb(255, 205, 86)",
                            "rgb(75, 2, 192)",
                            "rgb(23, 102, 255)",
                        ],

                        hoverOffset: 4,
                    },
                ],
            },
            options: {
                plugins: {
                    legend: {
                        labels: {
                            color: 'white',
                            font: {
                                size: 16
                            }
                        }
                    },
                    tooltip: {
                        bodyFont: {
                            size: 20,
                            color: 'white'
                        },
                        titleFont: {
                            size: 20,
                            color: 'white'
                        }
                    }
                }
            },
        })
    </script>
</html>
