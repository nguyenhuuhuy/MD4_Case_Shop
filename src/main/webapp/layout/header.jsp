<%--
  Created by IntelliJ IDEA.
  User: son
  Date: 5/12/2023
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page='../library/bootstrap/bootstrapHeader.jsp'>
        <jsp:param name="articleId" value=""/>
    </jsp:include>
</head>
<body>
<!--welcome-hero start -->
<%--<header id="home" class="welcome-hero">--%>
<!-- top-area Start -->
<div class="top-area">
    <div class="header-area">
        <!-- Start Navigation -->
        <nav class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy" data-minus-value-desktop="70"
             data-minus-value-mobile="55" data-speed="1000">

            <!-- Start Top Search -->
            <form method="post">
                <div class="top-search">
                    <div class="container">
                        <div class="input-group">
                            <span class="input-group-addon"><button type="submit"><i class="fa fa-search"></i></button></span>
                            <input type="text" class="form-control" placeholder="Search" name="search">
                            <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                        </div>
                    </div>
                </div>
            </form>

            <!-- End Top Search -->

            <div class="container">
                <!-- Start Atribute Navigation -->
                <div class="attr-nav">
                    <ul>
                        <c:if test='${sessionScope["userLogin"]!=null}'>
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img class="img-profile rounded-circle"
                                         src="${sessionScope['userLogin'].getAvatar()}"
                                         style="border-radius: 50px; width: 25px;margin-right: 10px;">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope["userLogin"].getName()}</span>
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item"
                                       href="/user?action=editUserLogin&id=${sessionScope['userLogin'].getId()}">
                                        Settings
                                    </a>
                                </div>
                            </li>
                        </c:if>
                        <li class="search">
                            <a href="#"><span class="lnr lnr-magnifier"></span></a>
                        </li><!--/.search-->
                        <li class="nav-setting">
                            <a href="#"><span class="lnr lnr-cog"></span></a>
                        </li><!--/.search-->
                        <li class="dropdown">
                            <a href="${sessionScope['userLogin'] != null ? "cart" : "user?action=login"}"
                               class="dropdown-toggle" data-toggle="dropdown">
                                <span class="lnr lnr-cart"></span>
                                <span class="badge badge-bg-1">${requestScope['cartUser'].getQuantityAll()}</span>
                            </a>
                            <c:if test='${sessionScope["userLogin"]!=null}'>
                                <ul class="dropdown-menu cart-list s-cate">
                                    <c:forEach items="${requestScope['cartUser'].products}" var="pr">
                                        <li class="single-cart-list">
                                            <a href="#" class="photo"><img src="${pr.image}"
                                                                           class="cart-thumb" alt="image"/></a>
                                            <div class="cart-list-txt">
                                                <h6><a href="#">${pr.name}</a></h6>
                                                <p>${pr.quantity} x - <span class="price">${pr.price} $</span></p>
                                            </div><!--/.cart-list-txt-->

                                        </li>
                                        <!--/.single-cart-list -->
                                    </c:forEach>
                                    <li class="total">
                                        <span style="padding-left: 71px;">Total: ${requestScope['cartUser'].getTotal()}</span>
                                        <a href="/cart" style="margin-bottom: 30px;margin-right: 40px;">
                                            <button class="btn-cart pull-right">view cart</button>
                                        </a>
                                    </li>
                                </ul>
                            </c:if>
                        </li><!--/.dropdown-->
                    </ul>
                </div><!--/.attr-nav-->
                <!-- End Atribute Navigation -->
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                        <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="#">Group<span>CHS</span>.</a>

                </div><!--/.navbar-header-->
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
                    <ul class="nav navbar-nav navbar-center" data-in="fadeInDown" data-out="fadeOutUp">
                        <li><a href="/index.jsp">home</a></li>
                        <li class="scroll"><a href="#new-arrivals">new arrival</a></li>
                        <li class="scroll"><a href="#feature">features</a></li>
                        <li class="scroll"><a href="#blog">blog</a></li>
                        <li class="scroll"><a href="#newsletter">contact</a></li>
                        <c:if test='${sessionScope["userLogin"]!=null}'>
                            <li><a href="/user?action=logout">Log Out</a></li>
                        </c:if>
                        <c:if test='${sessionScope["userLogin"]==null}'>
                            <li><a href="/user?action=register">Register</a></li>
                            <li><a href="/user?action=login">Login</a></li>
                        </c:if>
                    </ul><!--/.nav -->
                </div><!-- /.navbar-collapse -->
            </div><!--/.container-->
        </nav><!--/nav-->
        <!-- End Navigation -->
    </div><!--/.header-area-->
    <div class="clearfix"></div>
</div><!-- /.top-area-->
<!-- top-area End -->
<%--</header><!--/.welcome-hero-->--%>
<!--welcome-hero end -->
</body>
</html>
<jsp:include page='../library/bootstrap/bootstrapFooter.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>
