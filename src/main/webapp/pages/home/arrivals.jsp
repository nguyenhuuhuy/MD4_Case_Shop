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
<div style="margin-top: 200px">

    <h4 class="p-2">
        <span class="custom" style="color: black;" onclick="ListAll()" id="listProductAll-text">All</span>
        <span class="custom" onclick="byCategory01()" id="findByCategory_01-text" >category1</span>
        <span class="custom" onclick="byCategory02()" id="findByCategory_02-text">category2</span>
    </h4>


</div>
<!--new-arrivals start -->
<section id="new-arrivals" class="new-arrivals">
    <div class="container">
        <div class="section-header">
            <h2>new arrivals</h2>
        </div><!--/.section-header-->
        <div class="new-arrivals-content">
            <div class="row" id="ListProductAll">
                <c:forEach var="pr" items='${requestScope["productList"]}'>
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
                                        <span class="lnr lnr-heart"></span>
                                        <span class="lnr lnr-frame-expand"></span>
                                    </p>
                                </div>
                            </div>
                            <h4><a href="#">${pr.name}</a></h4>
                            <p class="arrival-product-price">${pr.price}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="row" id="findByCategory_01">

            </div>
            <div class="row" id="findByCategory_02">

            </div>
        </div>
    </div>
    <!--/.container-->

    <script>
        let waiting = document.getElementById("ListProductAll");
        let history = document.getElementById("findByCategory_01");
        let cancelled = document.getElementById("findByCategory_02");

        let waitingT = document.getElementById("listProductAll-text");
        let historyT = document.getElementById("FindByCategory_01-text");
        let cancelledT = document.getElementById("FindByCategory_02-text");

        let ListAll = () => {
            waiting.style.display = "";
            waitingT.style.color = "black";
            historyT.style.color = "thistle";
            cancelledT.style.color = "thistle";
            history.style.display = "none";
            cancelled.style.display = "none";
        }

        let byCategory01 = () => {
            waiting.style.display = "none";
            history.style.display = "";
            waitingT.style.color = "thistle";
            historyT.style.color = "black";
            cancelledT.style.color = "thistle";
            cancelled.style.display = "none";
        }

        let byCategory02 = () => {
            waiting.style.display = "none";
            history.style.display = "none";
            cancelled.style.display = "";
            waitingT.style.color = "thistle";
            historyT.style.color = "thistle";
            cancelledT.style.color = "black";
        }

    </script>
</section>
<!--new-arrivals end -->
</body>
</html>
