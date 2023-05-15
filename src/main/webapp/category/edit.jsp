<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/15/2023
  Time: 9:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/category">Back menu</a>
<c:if test='${requestScope["message"]!= null}'>
    <span style="color:blue">${requestScope["message"]}</span>
</c:if>
<form method="post">
    <label>PLEASE NAME EDIT</label><br>
    <input type="text" name="name" value="${requestScope["category"].getcName()}">
    <button>Edit</button>
</form>
</body>
</html>
