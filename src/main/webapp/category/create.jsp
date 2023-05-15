<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/15/2023
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
</head>
<body>

<a href="category" type="button" class="btn btn-danger">Back</a>

<c:if test='${requestScope["message"] != null}'>
  <span class="message">${requestScope["message"]}</span>
</c:if>
<h1>CREATE CATEGORY</h1>
<form action="" method="post">
  <label>Category name</label>
  <input type="text" name="name"><br>
  <button type="submit" class="btn btn-secondary mx-3">Create</button>
</form>
</body>
</html>
