<%--
  Created by IntelliJ IDEA.
  User: icom
  Date: 5/15/2023
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
  <!-- Custom fonts for this template -->
  <link rel="stylesheet" href="../../assets/css/all.min.css">
  <link
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../../assets/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="../../assets/css/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
  <jsp:include page="../pages/admin/adminSidebar.jsp"></jsp:include>


  <!-- Begin Page Content -->
  <form method="post" style="margin-left: 400px">
    <p>Id:</p>
    <input type="text" name="id" value="${requestScope['userEdit'].id}" disabled>
    <p>Name:</p>
    <input type="text" name="name" value="${requestScope['userEdit'].name}">
    <p>Email:</p>
    <input type="text" name="email" value="${requestScope['userEdit'].email}">
    <p>Password:</p>
    <input type="text" name="password" value="${requestScope['userEdit'].password}">
    <br><br>
    <button type="submit" class="btn btn-success m-3">Submit</button>
    <a href="user">
      <button type="button" class="btn btn-danger">
        Back
      </button>
    </a>
  </form>


</body>
<jsp:include page="../library/bootstrap/bootstrapAdmin.jsp"></jsp:include>
</html>
