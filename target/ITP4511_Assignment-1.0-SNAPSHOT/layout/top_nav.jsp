<%--
  Created by IntelliJ IDEA.
  User: kongkwokhin
  Date: 28/3/2024
  Time: 11:08 am
  To change this template use File | Settings | File Templates.
--%>
<%--<div class="flex flex-wrap h-screen">--%>
<%--<%@ include file="../tailwindcss/tailwindcss_cdn.jsp" %>--%>
<section class="relative mx-auto">
    <!-- navbar -->
    <nav class="flex justify-between bg-gray-900 text-white w-screen">
        <div class="px-5 xl:px-12 py-6 flex w-full items-center">
            <a class="text-3xl font-bold font-heading" href="#">
                <img class="w-60 h-20" src="images/HKIIT_logo.png" alt="">
            </a>
            <!-- Nav Links -->
            <ul class="hidden md:flex px-4 mt-4 mx-auto font-semibold font-heading space-x-12">
                <li><a class="" href="home?action=list"><p class="text-white text-2xl hover:text-orange-500">Home</p>
                </a>
                </li>
                <li><a class="hover:text-orange-500" href=""><p class="text-white text-2xl hover:text-orange-500">
                    Home</p></a></li>
                <li><a class="hover:text-orange-500" href="#"><p class="text-white text-2xl hover:text-orange-500">
                    Home</p></a></li>
                <li><a class="hover:text-orange-2500" href="#"><p class="text-white text-2xl hover:text-orange-500">
                    Home</p></a></li>
            </ul>
            <!-- Header Icons -->
            <div class="hidden xl:flex items-center space-x-5 items-center">
                <a class="hover:text-gray-200" href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none"
                         viewBox="0 0 24 24"
                         stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
                    </svg>
                </a>
                <a class="flex items-center hover:text-gray-200" href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none"
                         viewBox="0 0 24 24"
                         stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path>
                    </svg>
                    <span class="flex absolute -mt-5 ml-4">
              <span class="animate-ping absolute inline-flex h-3 w-3 rounded-full bg-pink-400 opacity-75"></span>
                <span class="relative inline-flex rounded-full h-3 w-3 bg-pink-500">
                </span>
                            </span>
                </a>
                <!-- Sign In / Register      -->
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
        <!-- Responsive navbar -->
        <a class="xl:hidden flex mr-6 items-center" href="#">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 hover:text-gray-200" fill="none"
                 viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path>
            </svg>
            <span class="flex absolute -mt-5 ml-4">
          <span class="animate-ping absolute inline-flex h-3 w-3 rounded-full bg-pink-400 opacity-75"></span>
          <span class="relative inline-flex rounded-full h-3 w-3 bg-pink-500">
          </span>
        </span>
        </a>
        <a class="navbar-burger self-center mr-12 xl:hidden" href="#">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 hover:text-gray-200" fill="none"
                 viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
        </a>
    </nav>

</section>
<%--</div>--%>

<div class="absolute bottom-0 right-0 mb-4 mr-4 z-10">
    <div>
        <a title="Follow me on twitter" href="https://www.twitter.com/asad_codes" target="_blank"
           class="block w-16 h-16 rounded-full transition-all shadow hover:shadow-lg transform hover:scale-110 hover:rotate-12">
            <img class="object-cover object-center w-full h-full rounded-full"
                 src="https://www.imore.com/sites/imore.com/files/styles/large/public/field/image/2019/12/twitter-logo.jpg"
                 alt="" />
        </a>
    </div>
</div>
