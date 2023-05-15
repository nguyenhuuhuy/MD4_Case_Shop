<%--
  Created by IntelliJ IDEA.
  User: huycb
  Date: 5/15/2023
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table">
    <thead>
    <tr>
        <th>id</th>
        <th>name</th>
        <th>username</th>
        <th>email</th>
        <th>password</th>
        <th>avatar</th>
        <th>role</th>
        <th>edit</th>
        <th>delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items='${requestScope["listUser"]}' var="user">
        <tr align="center">
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.password}</td>
            <td>
                <img src="${user.avatar}" alt="avatar" width="40" height="40">
            </td>
            <td>${user.roleSet}</td>
            <td>
                <a href="user?action=edit&id=${user.id}">Edit</a>
            </td>
            <td>
                <a href="user?action=delete&id=${user.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
