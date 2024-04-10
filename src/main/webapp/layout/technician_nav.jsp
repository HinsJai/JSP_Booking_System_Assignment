<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/3
  Time: 下午 11:13
  To change this template use File | Settings | File Templates.
--%>
<script src="js/common.js"></script>
<section class="relative mx-auto">
    <!-- navbar -->
    <nav class="flex justify-between bg-gray-900 text-white w-screen">
        <div class="px-5 xl:px-12 py-6 flex w-full items-center">
            <a class="text-3xl font-bold font-heading" href="#">
                <img class="w-60 h-20" src="images/HKIIT_logo.png" alt="">
            </a>
            <!-- Nav Links -->
            <ul class="hidden md:flex px-4 mt-4 mx-auto font-semibold font-heading space-x-16">
                <li><a class="hover:text-orange-500" href="booking?action=requestList"><p
                        class="text-white text-2xl hover:text-orange-500">
                    Booking</p></a>
                </li>
                <li><a class="hover:text-orange-500" href="technicianEquipment?action=list"><p
                        class="text-white text-2xl hover:text-orange-500">
                    Equipments</p></a>
                </li>
                <li><a class="hover:text-orange-500" href="createEquipment?action=insertEquipment"><p
                        class="text-white text-2xl hover:text-orange-500">
                    Create Equipment</p></a>
                </li>
                <li><a class="hover:text-orange-500" href="userManagement?action=userList"><p
                        class="text-white text-2xl hover:text-orange-500">
                    User Management</p></a>
                </li>
                <li><a class="hover:text-orange-500" href="delivery?action=list"><p
                        class="text-white text-2xl hover:text-orange-500">
                    Delivery</p></a>
                </li>
                <li><a class="hover:text-orange-500" href="damageReport?action=list"><p
                        class="text-white text-2xl hover:text-orange-500">
                    Report</p></a>
                </li>
            </ul>
            <!-- Header Icons -->
            <div class="hidden xl:flex items-center space-x-5 items-center">
                <p class="font-bold">${sessionScope.userType}</p>
                <a class="flex items-center hover:text-gray-200" href="userProfile?action=profile">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 hover:text-gray-200"
                         fill="none"
                         viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                </a>
            </div>

            <div class="hidden xl:flex items-center space-x-5 items-center ml-4">
                <button class="flex items-center" id="logout" onclick="logout()">
                    <svg fill="#FFFFFF" height="18px" width="18px" class="hover:bg-orange-500"
                         xmlns="http://www.w3.org/2000/svg"
                         viewBox="0 0 384.971 384.971" xml:space="preserve"><g id="SVGRepo_bgCarrier"
                                                                               stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier">

                            <g id="Sign_Out">
                                <path d="M180.455,360.91H24.061V24.061h156.394c6.641,0,12.03-5.39,12.03-12.03s-5.39-12.03-12.03-12.03H12.03 C5.39,0.001,0,5.39,0,12.031V372.94c0,6.641,5.39,12.03,12.03,12.03h168.424c6.641,0,12.03-5.39,12.03-12.03 C192.485,366.299,187.095,360.91,180.455,360.91z"></path>
                                <path d="M381.481,184.088l-83.009-84.2c-4.704-4.752-12.319-4.74-17.011,0c-4.704,4.74-4.704,12.439,0,17.179l62.558,63.46H96.279 c-6.641,0-12.03,5.438-12.03,12.151c0,6.713,5.39,12.151,12.03,12.151h247.74l-62.558,63.46c-4.704,4.752-4.704,12.439,0,17.179 c4.704,4.752,12.319,4.752,17.011,0l82.997-84.2C386.113,196.588,386.161,188.756,381.481,184.088z"></path>
                            </g>

                        </g></svg>
                </button>
            </div>
        </div>
    </nav>

</section>

