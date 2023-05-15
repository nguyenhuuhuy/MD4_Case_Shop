<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html >
<jsp:include page='/layout/header.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%--home--%>
<jsp:include page="/pages/home/home.jsp"></jsp:include>
<%--home--%>
<h1>Test huy</h1>
<%--alo--%>
</body>
</html>
<jsp:include page='/layout/footer.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>