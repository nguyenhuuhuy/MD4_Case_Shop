<%--
  Created by IntelliJ IDEA.
  User: huycb
  Date: 5/19/2023
  Time: 8:53 AM
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
    <c:if test='${requestScope["detail"] != null}'>
        <p>${requestScope["detail"].id}</p>
        <p>${requestScope["detail"].name}</p>
        <p>${requestScope["detail"].category}</p>
        <p>${requestScope["detail"].price}</p>
        <p>${requestScope["detail"].quantity}</p>
        <form method="post" action="/home?action=comment">
            <c:if test='${requestScope["userLogin"]!=null}'>
                <input type="text" name="userId" value="${requestScope["userLogin"].id}">
            </c:if>
            <input type="text" name="productId" value="${requestScope["detail"].id}"><br>
            <p>comment</p>
        <input type="text" name="comment" value="">
            <button type="submit">add</button>
        </form>
    </c:if>
</body>
<jsp:include page='/layout/footer.jsp'>
  <jsp:param name="articleId" value=""/>
</jsp:include>
</html>
