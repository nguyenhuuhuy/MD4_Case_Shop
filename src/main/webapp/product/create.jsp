<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/16/2023
  Time: 11:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<h1>CREATE PRODUCT</h1>
<a href="/product/list.jsp">BACK</a>
<c:if test='${requestScope["message"] != null}'>
  <span class="message">${requestScope["message"]}</span>
</c:if>
<form action="" method="post">
  <label>product name</label>
  <input type="text" name="name"><br>
  <label>id category</label>
  <input type="text" name="idCategory"><br>
  <label>price</label>
  <input type="text" name="price"><br>
  <label>image</label>
  <input type="text" name="image"><br>
  <label>quantity</label>
  <input type="text" name="qty"><br>
  <button type="submit">creat product</button>
</form>
</body>
</html>
