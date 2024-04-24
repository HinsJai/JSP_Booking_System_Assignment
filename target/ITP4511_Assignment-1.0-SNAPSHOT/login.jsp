<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2024/3/26
  Time: 下午 06:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="bootstrap/bootstrp_css.jsp" %>

<html>
    <head>
        <title>Login Page</title>
        <link href="css/login.css" rel="stylesheet">
    </head>
    <body>
        <div class="flex h-screen p-4 mt-4">
            <div class="">
                <h1 class="text-center fw-bold">Equipment Booking System</h1>
            </div>
        </div>
        <section class="p-3 p-md-4 p-xl-5">
            <div class="container">
                <div class="card border-light-subtle shadow-sm">
                    <div class="row g-0">
                        <div class="col-12 col-md-6">
                            <img class="img-fluid rounded-start w-100 h-100 object-fit-cover" loading="lazy"
                                 src="images/login_bg.jpg" alt="login background">
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="card-body p-3 p-md-4 p-xl-5">
                                <div class="">
                                    <div class="relative justify-center">
                                        <div class="mb-5 ">
                                            <div class="text-center">
                                                <img class="image-fluid rounded-start w-150 h-80"
                                                     loading="lazy"
                                                     src="images/HKIIT_logo.png" alt="login logo">
                                            </div>
                                        </div>
                                        <%--                                        <div class="">--%>
                                        <%= request.getParameter("success") == null ? "" :
                                                "<div class=\"alert alert-danger\">Incorrect email or password , please try again!</div>"%>
                                        <%--                                        </div>--%>
                                    </div>
                                    <form action="verify_login" method="post">
                                        <div class="row gy-3 gy-md-4 overflow-hidden">
                                            <div class="col-12">
                                                <label for="email" class="form-label">Email <span
                                                        class="text-danger">*</span></label>
                                                <input type="email" class="form-control" name="email" id="email"
                                                       value="ta@gmail.com" placeholder="name@example.com"
                                                       required>
                                            </div>
                                            <div class="col-12">
                                                <label for="password" class="form-label">Password <span
                                                        class="text-danger">*</span></label>
                                                <input type="password" class="form-control" name="password"
                                                       id="password"
                                                       value="Bb123456" required>
                                            </div>
                                            <div class="col-12">
                                                <div class="d-grid">
                                                    <button class="btn bsb-btn-xl btn-primary" name="loginAction"
                                                            value="authenticate">Login
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>

        <%@ include file="bootstrap/bootstrap_js.jsp" %>
    </body>
</html>
