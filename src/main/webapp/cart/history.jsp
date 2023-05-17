<%--
  Created by IntelliJ IDEA.
  User: huycb
  Date: 5/17/2023
  Time: 9:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        .custom {
            color: thistle;
        }

        .custom:hover {
            color: black;
            cursor: pointer;
        }
    </style>
</head>
<jsp:include page='/layout/header.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>
<body>
<div style="margin-top: 200px">
    <h4 class="p-2">
        <span class="custom" style="color: black;" onclick="displayWaiting()" id="waiting-text">Waiting</span>
        <span class="custom" onclick="displayHistory()" id="history-text">History</span>
        <span class="custom" onclick="displayCancelled()" id="cancelled-text">Cancelled</span>
    </h4>

</div>
<div id="waiting">
    <table class="table table-striped table-hover">
        <tr>
            <th>ID</th>
            <th>Created</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Retrieve</th>
        </tr>
<%--            <c:forEach items="${requestScope['orderedCarts'].products}" var="pr">--%>
<%--                <p>${pr.quantity}</p>--%>
<%--            </c:forEach>--%>
        <c:forEach items="${requestScope['orderedCarts']}" var="cart">
                <tr>
                    <td>${cart.id}</td>
                    <td>${cart.created}</td>
                    <td>${cart.getTotal()}</td>
                    <td>
                        <a href="cart?action=removeUserCart&id=${cart.id}">
                            <button class="btn btn-danger">Retrieve</button>
                        </a>
                    </td>
                </tr>
        </c:forEach>
    </table>
</div>

<div style="display: none" id="history">
    <table class="table table-striped table-hover">
        <tr>
            <th>ID</th>
            <th>Time confirmed</th>
            <th>Total</th>
        </tr>
        <c:forEach items="${requestScope['confirmedCarts']}" var="cart">
            <tr>
                <td>${cart.id}</td>
                <td>${cart.changed}</td>
                <td>${cart.getTotal()}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<div style="display: none" id="cancelled">
    <table class="table table-striped table-hover">
        <tr>
            <th>ID</th>
            <th>Time confirmed</th>
            <th>Total</th>
        </tr>
        <c:forEach items="${requestScope['cancelledCarts']}" var="cart">
            <tr>
                <td>${cart.id}</td>
                <td>${cart.changed}</td>
                <td>${cart.getTotal()}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<script>
    let waiting = document.getElementById("waiting");
    let history = document.getElementById("history");
    let cancelled = document.getElementById("cancelled");

    let waitingT = document.getElementById("waiting-text");
    let historyT = document.getElementById("history-text");
    let cancelledT = document.getElementById("cancelled-text");

    let displayWaiting = () => {
        waiting.style.display = "";
        waitingT.style.color = "black";
        historyT.style.color = "thistle";
        cancelledT.style.color = "thistle";
        history.style.display = "none";
        cancelled.style.display = "none";
    }

    let displayHistory = () => {
        waiting.style.display = "none";
        history.style.display = "";
        waitingT.style.color = "thistle";
        historyT.style.color = "black";
        cancelledT.style.color = "thistle";
        cancelled.style.display = "none";
    }

    let displayCancelled = () => {
        waiting.style.display = "none";
        history.style.display = "none";
        cancelled.style.display = "";
        waitingT.style.color = "thistle";
        historyT.style.color = "thistle";
        cancelledT.style.color = "black";
    }

</script>
</body>
</html>
<jsp:include page='/layout/footer.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>