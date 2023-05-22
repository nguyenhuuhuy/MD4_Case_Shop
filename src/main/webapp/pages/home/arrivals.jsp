<%--
  Created by IntelliJ IDEA.
  User: son
  Date: 5/12/2023
  Time: 11:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<!--new-arrivals start -->
<section id="new-arrivals" class="new-arrivals">
    <div class="container">
        <div class="section-header">
            <h2>new arrivals</h2>
        </div><!--/.section-header-->
        <div class="new-arrivals-content">
                <c:if test='${requestScope["checkLike"]!=null}'>
                    <p>da like</p>
                </c:if>
                <c:forEach var="pr" items='${requestScope["productList"]}'>
<%--                    <c:if test="${requestScope['prLike'] == requestScope['productList'].id}">--%>
<%--                        <p>ok</p>--%>
<%--                    </c:if>--%>
                    <div class="col-md-3 col-sm-4">
                        <div class="single-new-arrival">
                            <div class="single-new-arrival-bg">
                                <img src="${pr.image}" alt="new-arrivals images">
                                <div class="single-new-arrival-bg-overlay"></div>
                                <div class="new-arrival-cart">
                                    <p>
                                        <span class="lnr lnr-cart"></span>
                                        <a href="cart?action=add&id=${pr.id}&qty=1">add <span>to </span> cart</a>
                                    </p>
                                    <p class="arrival-review pull-right">
                                        <a href="home?action=like&id=${pr.id}"><span class="lnr lnr-heart" ></span></a>
                                        <span class="lnr lnr-frame-expand"></span>
                                    </p>
                                </div>
                            </div>
                            <h4><a href="home?action=detail&productId=${pr.id}">${pr.name}</a></h4>
                            <p class="arrival-product-price">${pr.price}</p>
                        </div>
                    </div>
                </c:forEach>
        </div>
    </div>
    <!--/.container-->

</section>
<!--new-arrivals end -->
</body>
</html>
