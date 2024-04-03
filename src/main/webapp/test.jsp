<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/4/2
  Time: 下午 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="tailwindcss/tailwindcss_cdn.jsp" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <div class="flex h-screen">
            <div class="w-16 flex flex-col justify-between items-center py-4 bg-gray-200">
                <div>
                    <svg class="w-14 h-14" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 8h6m-5 0a3 3 0 110 6H9l3 3m-3-6h6m6 1a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    <div class="flex flex-col space-y-4 items-center space-y-10 py-3">
                        <div class="flex sel relative">
                            <div class="absolute right-0 bg-red-500 top-0 text-white w-4 h-4 text-center rounded-full text-xs z-10">
                                5
                            </div>
                            <a href="" class="text-blue-700 absolute top-2 right-0">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"></path>
                                </svg>
                            </a>
                        </div>
                        <a href="">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"></path>
                            </svg>
                        </a>
                        <a href="">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path>
                            </svg>
                        </a>
                        <a href="">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                            </svg>
                        </a>
                        <a href="">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M16 8v8m-4-5v5m-4-2v2m-2 4h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                            </svg>
                        </a>
                    </div>
                </div>
                <div div class="flex flex-col space-y-4">
                    <a href="">
                        <div class="rounded-full bg-gray-400 w-8 h-8"></div>
                    </a>
                    <a href="">
                        <div class="rounded-full bg-gray-400 w-8 h-8"></div>
                    </a>
                    <a href="">
                        <div class="rounded-full bg-gray-400 w-8 h-8"></div>
                    </a>
                </div>
            </div>

            <div class="bg-gray-100 w-64">
                <div class="flex flex-row justify-between p-4 items-center">
                    <div class="text-xl font-bold">Inbox</div>
                    <svg class="flex-none w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                </div>
                <div class="flex justify-start font-semibold items-center p-4 space-x-1">
                    <div class="text-sm">Conversations</div>
                    <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                    </svg>
                </div>
                <div class="flex flex-col space-y-3">
                    <div class="flex justify-between font-semibold items-center px-4 text-xs text-blue-600">
                        <div class="flex space-x-3 items-center">
                            <img class="inline-block h-6 w-6 rounded-full ring-black ring-1"
                                 src="https://images.unsplash.com/photo-1550525811-e5869dd03032?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                 alt="" />
                            <div>You</div>
                        </div>
                        <div>5</div>
                    </div>
                    <div class="flex justify-between font-semibold items-center px-4 text-xs">
                        <div class="flex space-x-3 items-center">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"></path>
                            </svg>
                            <div>Mentions</div>
                        </div>
                        <div class="text-gray-400">0</div>
                    </div>
                    <div class="flex justify-between font-semibold items-center px-4 text-xs">
                        <div class="flex space-x-3 items-center">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                            <div>Unassigned</div>
                        </div>
                        <div class="text-gray-400">2,497</div>
                    </div>
                    <div class="flex justify-between font-semibold items-center px-4 text-xs">
                        <div class="flex flex-row space-x-3 items-center">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path>
                            </svg>
                            <div>All</div>
                        </div>
                        <div class="text-gray-400">5,171</div>
                    </div>

                    <div class="flex justify-between font-semibold items-center px-4 text-xs text-gray-500">
                        <div class="flex flex-row space-x-3 items-center">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                            </svg>
                            <div class="text-xs">Create view</div>
                        </div>
                    </div>

                    <div class="flex justify-between font-semibold items-center px-4 text-xs text-gray-500">
                        <div>See 124 more...</div>
                        <div>Edit</div>
                    </div>

                    <div class="flex flex-col py-2 space-y-3">
                        <div class="flex font-semibold items-center px-4 text-xs text-gray-900 space-x-1">
                            <div>Automation</div>
                            <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M9 5l7 7-7 7"></path>
                            </svg>
                        </div>

                        <div class="flex font-semibold items-center px-4 text-xs text-gray-900 space-x-1">
                            <div>Your preferences</div>
                            <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M9 5l7 7-7 7"></path>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bg-blue-200 flex-auto">Main Content</div>
        </div>
    </body>
</html>
