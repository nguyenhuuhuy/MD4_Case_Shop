<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/16/2023
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Form delete Product</h1>

<c:if test='${requestScope["message"] != null}'>
    <span style="color: blue" class="message">${requestScope["message"]}</span>
</c:if>
<form method="post">
    <label>Name</label><br>
    <input type="text" name="name" value="${requestScope["product"].getName()}" ><br>
    <label>category</label><br>
    <input type="text" name="idCategory" value="${requestScope["product"].category.cId}" ><br>
    <label>price</label><br>
    <input type="text" name="price" value="${requestScope["product"].getPrice()}" ><br>
    <label>image</label><br>
    <input type="text" name="image" value="${requestScope["product"].getImage()}" ><br>
    <label>quantity</label><br>
    <input type="text" name="qty" value="${requestScope["product"].getQuantity()}" ><br>
    <p>ARE YOU SURE DELETE ?</p>
    <a href=""></a><button>YES</button>
</form>
<a href="product"><button>NO / BACK </button></a>
</body>
</html>

