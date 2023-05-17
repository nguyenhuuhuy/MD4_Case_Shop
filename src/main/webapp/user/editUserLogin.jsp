<%--
  Created by IntelliJ IDEA.
  User: huycb
  Date: 5/16/2023
  Time: 11:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" style="margin-left: 400px">
    <p>Id:</p>
    <input type="text" name="idLogin" value="${requestScope['userEditLogin'].id}" disabled>
    <p>Name:</p>
    <input type="text" name="nameLogin" value="${requestScope['userEditLogin'].name}">
    <p>Email:</p>
    <input type="text" name="emailLogin" value="${requestScope['userEditLogin'].email}">
    <p>Password:</p>
    <input type="text" name="passwordLogin" value="${requestScope['userEditLogin'].password}">
    <br><br>
    <button type="submit" class="btn btn-success m-3">Submit</button>
    <a href="/home">
        <button type="button" class="btn btn-danger">
            Back
        </button>
    </a>
</form>
</body>
</html>
