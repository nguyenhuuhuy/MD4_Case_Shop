<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/9/2023
  Time: 4:03 PM
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
        .login__profile {
            margin: 12px;
            font-weight: 400;
        }
    </style>
</head>
<body>
<div class="container" style="margin-top: 120px; color: black">
    <div class="col-12" style="margin-top: 20px; margin-bottom: 20px">
        <div class="row">
            <section style="background-color: #eee;">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-lg-12 col-xl-11">
                            <div class="card text-black" style="border-radius: 25px;">
                                <div class="card-body p-md-5">
                                    <div class="row justify-content-center">
                                        <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                                            <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>
                                            <form class="mx-1 mx-md-4" method="post">
                                                <%--                     Thông báo lỗi--%>
                                                <c:if test='${requestScope["validate"]!=null}'>
                                                    <p style="color: red">${requestScope["validate"]}</p>
                                                </c:if>
                                                <div class="d-flex flex-row align-items-center mb-4 ">
                                                    <div>
                                                        <label class="login__profile">Your Name</label>
                                                        <input name="name" type="text" class="form-control"
                                                               value="${requestScope["name"]}"/>
                                                    </div>
                                                </div>

                                                <div class="d-flex flex-row align-items-center mb-4 ">
                                                    <div>
                                                        <label class="login__profile">Username</label>
                                                        <input name="username" type="text" class="form-control"
                                                               value="${requestScope["username"]}"/>
                                                    </div>
                                                </div>

                                                <div class="d-flex flex-row align-items-center mb-4">
                                                    <div>
                                                        <label class="login__profile">Your Email</label>
                                                        <input name="email" type="email" class="form-control"
                                                               value="${requestScope["email"]}"/>
                                                    </div>
                                                </div>

                                                <div class="d-flex flex-row align-items-center mb-4">
                                                    <div>
                                                        <label class="login__profile">Password</label>
                                                        <input name="password" type="password" class="form-control"
                                                               value="${requestScope["password"]}"/>
                                                    </div>
                                                </div>

                                                <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4"
                                                     style="text-align: center ; margin: 15px">
                                                    <button type="submit" class="btn btn-primary btn-lg">Register
                                                    </button>
                                                </div>
                                            </form>

                                        </div>
                                        <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2"
                                             style="margin-top: 8%;margin-bottom: 10px; align-items: center; justify-content: center;">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                                                 class="img-fluid" alt="Sample image">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>

</body>
</html>
<jsp:include page='../../layout/footer.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>