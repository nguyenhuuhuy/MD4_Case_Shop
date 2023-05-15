<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/15/2023
  Time: 9:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <title>Title</title>
</head>
<body>

<%--<jsp:include page="../layout/footer.jsp"></jsp:include>--%>

<a href="category?action=create" type="text" class="btn btn-success m-3">  CREATE CATEGORY  </a>
<form method="post">

    <div class="d-flex align-items-center">
        <input type="text" name="search" placeholder="Search Category and By Name" style="height: 37px" class="ms-3 rounded">
        <button type="submit" class="btn btn-secondary mx-3">Search</button>
        <a href="" type="button" class="btn btn-danger">Back</a>
    </div>

</form>
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">NAME</th>
        <th scope="col">EDIT</th>
        <th scope="col">DELETE</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="cate" items='${requestScope["categoryList"]}'>
        <tr>
            <td >${cate.cId}</td>
            <td>${cate.cName}</td>
            <td>
                <a type="button" class="btn btn-success" href="category?action=edit&id=${cate.cId}"><i class="bi bi-pencil-square"></i></a>

            </td>
            <td>
                <a type="button" class="btn btn-danger" href="category?action=delete&id=${cate.cId}"><i class="bi bi-trash3-fill"></i></a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>

