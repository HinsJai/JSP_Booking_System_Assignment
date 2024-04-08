<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/3
  Time: 下午 11:13
  To change this template use File | Settings | File Templates.
--%>

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
                    Equipment</p></a>
                </li>
                <li><a class="hover:text-orange-500" href="createEquipment?action=insertEquipment"><p
                        class="text-white text-2xl hover:text-orange-500">
                    Create Equipment</p></a>
                </li>
                <li><a class="hover:text-orange-500" href="delivery?action=insertEquipment"><p
                        class="text-white text-2xl hover:text-orange-500">
                    Delivery</p></a>
                </li>
            </ul>
            <!-- Header Icons -->
            <div class="hidden xl:flex items-center space-x-5 items-center">
                <a class="flex items-center hover:text-gray-200" href="userProfile?action=profile">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 hover:text-gray-200"
                         fill="none"
                         viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                </a>
            </div>
        </div>

    </nav>

</section>

