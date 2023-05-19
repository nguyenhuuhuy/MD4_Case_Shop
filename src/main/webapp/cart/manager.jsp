<%--
  Created by IntelliJ IDEA.
  User: son
  Date: 5/15/2023
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin - ListOrder</title>
    <link rel="shortcut icon" type="image/icon" href="../../assets/logo/favicon.png"/>
    <link rel="stylesheet" href="../../assets/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../../assets/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../../assets/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <jsp:include page="../pages/admin/adminSidebar.jsp"></jsp:include>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <!-- Topbar -->
            <jsp:include page="../pages/admin/adminTopbar.jsp"></jsp:include>
            <!-- End of Topbar -->
            <c:if test='${requestScope["message"] != null}'>
                <span class="message">${requestScope["message"]}</span>
            </c:if>
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div>
                        <div class="card-header py-3" style="display: flex; justify-content: space-between;">
                            <h4 class="m-0 font-weight-bold text-primary">
                                DataTables ListOrder Manage</h4>
                            <a href="category?action=create" type="text" class="btn btn-success m-0"
                            > Create Category </a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover table-striped " id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr align="center">
                                    <th scope="col">ID</th>
                                    <th scope="col">User Name</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Detail</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr align="center">
                                    <th scope="col">ID</th>
                                    <th scope="col">User Name</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Detail</th>
                                </tr>
                                </tfoot>
                                <tbody>

                                <c:forEach items="${requestScope['cartList']}" var="cart">
                                    <tr>
                                        <td>${cart.id}</td>
                                        <td>${cart.user.name}</td>
                                        <td>${cart.getTotal()}</td>
                                        <td><a href="cart?action=detail&id=${cart.id}">
                                            <button class="btn btn-success">Detail</button>
                                        </a></td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->
        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Designed And Developed By CHS</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->
    </div>
    <!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

</table>
</body>
<jsp:include page="../library/bootstrap/bootstrapAdmin.jsp"></jsp:include>
</html>
