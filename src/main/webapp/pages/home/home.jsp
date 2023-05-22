<%--
  Created by IntelliJ IDEA.
  User: son
  Date: 5/12/2023
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<jsp:include page='/layout/header.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>
<body>
<%--banner--%>
<jsp:include page="/pages/home/banner.jsp"></jsp:include>
<%--banner--%>
<%--arrivals--%>
<jsp:include page="/pages/home/arrivals.jsp"></jsp:include>
<%--arrivals--%
<%--collection--%>
<jsp:include page="/pages/home/collection.jsp"></jsp:include>
<%--collection--%>
<%--best--%>
<jsp:include page="/pages/home/best.jsp"></jsp:include>
<%--best--%>
<%--featuredProducts--%>
<jsp:include page="/pages/home/featuredProducts.jsp"></jsp:include>
<%--featuredProducts--%>
<%--blog--%>
<jsp:include page="/pages/home/blog.jsp"></jsp:include>
<%--blog--%>
<%--clients--%>
<jsp:include page="/pages/home/clients.jsp"></jsp:include>
<%--clients--%>
</body>
</html>
<jsp:include page='/layout/footer.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>