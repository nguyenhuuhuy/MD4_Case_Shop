<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/15/2023
  Time: 9:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<c:if test='${requestScope["message"]!= null}'>
  <span style="color:blue">${requestScope["message"]}</span>
</c:if>
<form method="post">
  <label>Name</label><br>
  <p value="${requestScope["category"].getcName()}"></p><br>
  <p>ARE YOU SURE DELETE</p>
  <a href="/"></a><button>YES</button>
</form>
<a href="category"><button>NO / BACK</button></a>
</body>
</html>
