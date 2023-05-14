<%--
  Created by IntelliJ IDEA.
  User: icom
  Date: 5/11/2023
  Time: 8:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page='../../layout/header.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>
<head>
    <title>Title</title>
    <style>
        .divider:after,
        .divider:before {
            content: "";
            flex: 1;
            height: 1px;
            background: #eee;
        }

        .h-custom {
            height: calc(100% - 73px);

        }

        @media (max-width: 450px) {
            .h-custom {
                height: 100%;
            }
        }

        .login__profile {
            margin: 12px;
            font-weight: 400;
        }

    </style>

</head>
<body>
<section class="vh-100" style="margin-top: 120px; color: black">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                     class="img-fluid" alt="Sample image">
            </div>
            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">

                <form method="post">
                    <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
                        <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign in form</p>
                    </div>
                    <%--                     Thông báo lỗi--%>
                    <c:if test='${requestScope["validate"]!=null}'>
                        <p style="color: red">${requestScope["validate"]}</p>
                    </c:if>
                    <div class="form-outline mb-4">
                        <label class="form-label login__profile">User Name</label>
                        <input type="text" class="form-control form-control-lg"
                               placeholder="Enter a valid user name" name="username"/>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-3">
                        <label class="form-label login__profile">Password</label>
                        <input type="password" class="form-control form-control-lg"
                               placeholder="Enter password" name="password"/>
                    </div>

                    <div class="d-flex justify-content-between align-items-center "
                         style="margin-top: 10px; margin-bottom: 5px">
                        <!-- Checkbox -->
                        <div class="form-check mb-0">
                            <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3"/>
                            <label class="form-check-label" for="form2Example3">
                                Remember me
                            </label>
                        </div>
                        <a href="#!" class="text-body " style="color: #ff9966">Forgot password?</a>
                    </div>

                    <div class="text-center text-lg-start mt-4 pt-2">
                        <button type="submit" class="btn btn-primary btn-lg"
                                style="padding-left: 2.5rem; padding-right: 2.5rem;">Login
                        </button>
                        <p class="small fw-bold mt-2 pt-1 mb-0" style="margin-top: 5px; ">Don't have an account? <a
                                href="#!"
                                class="link-primary" style=" color: #337ab7">Register</a>
                        </p>
                    </div>

                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>
<jsp:include page='../../layout/footer.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>