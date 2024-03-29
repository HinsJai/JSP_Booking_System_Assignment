<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/3/29
  Time: 下午 11:01
  To change this template use File | Settings | File Templates.
--%>
<section class="bg-gray-50 dark:bg-gray-900">
    <div class="flex flex-col items-center  px-6 py-8 mx-auto md:h-screen lg:py-0">
        <div class="relative top-40 w-full p-6 bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md dark:bg-gray-800 dark:border-gray-700 sm:p-8">
            <div>
                <button class="bg-yellow-500 flex justify-end p-3 rounded-md font-semibold hover:bg-green-500"
                        id="black">Back
                </button>
                <h2 class="mb-1 text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white flex justify-center">
                    Change Password
                </h2>
            </div>
            <div class="mt-4 space-y-4 lg:mt-5 md:space-y-5">

                <div>
                    <label for="password" class="block mb-2 text-xl font-medium  dark:text-white">New
                                                                                                  Password</label>
                    <input type="password" name="password" id="password"
                           class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                    >
                </div>
                <div>
                    <label for="confirm-password" class="block mb-2 text-lg font-medium  dark:text-white">Confirm
                                                                                                          password</label>
                    <input type="password" name="confirm-password" id="confirm-password"
                           class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                    >
                </div>
                <button type="submit" id="change-pwd"
                        class="w-full text-white bg-blue-500  hover:bg-green-500  font-bold rounded-lg text-lg px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                    Update password
                </button>
            </div>
        </div>
    </div>
</section>
