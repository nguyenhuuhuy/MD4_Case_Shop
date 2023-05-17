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
</head>
<jsp:include page='/layout/header.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>
<body>
<h4 class="p-3">
    Your Cart
</h4>

<table border="1" width="100%" class="table table-striped table-hover" style="margin-top: 200px">
    <tr>
        <th>Image</th>
        <th>Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Remove</th>
    </tr>
    <c:forEach items="${requestScope['cart'].products}" var="pr">

        <tr>

            <td width="50">
                <img src="${pr.image}" alt="img" width="50" height="50">
            </td>

            <td>${pr.name}</td>

            <td>${pr.price}</td>

            <td>${pr.quantity}</td>

            <td>
                <a href="cart?action=remove&id=${pr.id}">
                    <button class="btn btn-danger">Remove</button>
                </a>
            </td>

        </tr>
    </c:forEach>
    <tr>
        <td colspan="5">
            <h4>
                Total: ${requestScope['cart'].getTotal()}
            </h4>
        </td>
    </tr>
    <tr></tr>
</table>


<a href="cart?action=order">
    <button class="btn btn-success"><i class="bi bi-bag-plus"></i> Order</button>
</a><br><br>
<a href="cart?action=history">
    <button class="btn btn-dark"><i class="bi bi-clock-history"></i> History</button>
</a><br><br>
</body>
</html>
<jsp:include page='/layout/footer.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>