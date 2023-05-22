<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/16/2023
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin - Products</title>
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
            <script>
                const firebaseConfig = {
                    apiKey: "AIzaSyC_y3aZuI7I5OhhWg7z8rwFEKXUkTKUvzc",
                    authDomain: "nguyendanhson-9374f.firebaseapp.com",
                    projectId: "nguyendanhson-9374f",
                    storageBucket: "nguyendanhson-9374f.appspot.com",
                    messagingSenderId: "297043475039",
                    appId: "1:297043475039:web:5c4884db43b2b24af7f9ea",
                    measurementId: "G-1QMVSBZ3TM"
                };
            </script>
            <div class="container-fluid">
                <!-- DataTales Example -->
                <div class="card shadow mb-1">
                    <div>
                        <div class="card-header py-3" style="display: flex; justify-content: space-between;">
                            <h4 class="m-0 font-weight-bold text-primary">
                                DataTables Product Manage</h4>
                            <a href="product?action=create" type="button" class="btn btn-success m-0">Create Product</a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr align="center">
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Image</th>
                                    <th>Quantity</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr align="center">
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Image</th>
                                    <th>Quantity</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                                </tfoot>
                                <tbody>

                                <c:forEach var="pr" items='${requestScope["productList"]}'>
                                    <tr align="center">
                                        <td>${pr.id}</td>
                                        <td><a href="product?action=detail&id=${pr.id}">${pr.name}</a></td>
                                        <td>${pr.category.cName}</td>
                                        <td>${pr.price}</td>
                                        <td><img width="80" height="80" src="${pr.image}" alt=""></td>
                                        <td>${pr.quantity}</td>

                                        <td>
                                            <button type="button" class="btn " data-toggle="modal"
                                                    data-target="#editProduct${pr.id}" data-whatever="${pr.id}">
                                                <i class="fa-sharp fa-solid fa-pen-to-square"
                                                   style="color: #2a65b2;"></i>
                                            </button>
                                        </td>

                                        <td>
                                            <a type="button" class="dropdown-item" data-toggle="modal"
                                               data-target="#deleteProduct${pr.id}">
                                                <i class="fa-solid fa-trash" style="color: #ef4949"></i>
                                            </a>
                                        </td>

                                    </tr>
                                    <!-- Edit Modal-->
                                    <div class="modal fade" id="editProduct${pr.id}" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel1"
                                         aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">

                                                <div class="modal-header">
                                                    <div style="display: flex ; justify-content: flex-start; color: #f5a106">
                                                        <h1>EDIT PRODUCT</h1>
                                                    </div>
                                                    <button class="close" type="button" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true" style="color: red">x</span>
                                                    </button>
                                                </div>

                                                <div align="center">
                                                    <form action="product?action=edit&id=${pr.id}"
                                                          method="post">

                                                            <%--avatar--%>
                                                        <img width="80" height="80" src="${pr.image}" alt="">
                                                        <input type="text" name="avatar" value="${pr.image}"
                                                               hidden>
                                                        <jsp:include page='../uploadFileImg/upload_avatar.jsp'>
                                                            <jsp:param name="articleId" value="${pr.id}"/>
                                                        </jsp:include>
                                                            <%--avatar--%>
                                                        <hr width="80%">
                                                            <%--ID--%>
                                                        <label style="margin-bottom: 1px; margin-top: 19px">Id:</label>
                                                        <input type="text" name="id" value="${pr.id}" disabled>
                                                            <%--ID--%>

                                                            <%--Name--%>
                                                        <label style="margin-bottom: 1px; margin-top: 19px">Name:</label>
                                                        <input type="text" name="name" value="${pr.name}">
                                                            <%--Name--%>

                                                            <%--Category--%>
                                                        <label style="margin-bottom: 1px; margin-top: 19px">Category
                                                            select:</label>
                                                        <select class="custom-select" name="idCategory"
                                                                style="width: 300px">
                                                            <option value="${pr.category.cId}"
                                                                    hidden="">${pr.category.cName}</option>
                                                            <c:forEach var="cr" items='${requestScope["categoryList"]}'>
                                                                <option value="${cr.cId}">${cr.cName}</option>
                                                            </c:forEach>
                                                        </select>
                                                            <%--Category--%>
                                                        <div>
                                                                <%--Price--%>
                                                            <p style="margin-bottom: 1px; margin-top: 8px">Price:</p>
                                                            <input type="text" name="price" value="${pr.price}">
                                                                <%--Price--%>

                                                                <%--Quantity--%>
                                                            <p style="margin-bottom: 1px; margin-top: 8px">Quantity:</p>
                                                            <input type="text" name="qty" value="${pr.quantity}">
                                                                <%--Quantity--%>
                                                        </div>
                                                        <button type="submit" class="btn btn-success m-3">
                                                            EDIT
                                                        </button>
                                                        <button class="btn btn-secondary" type="button"
                                                                data-dismiss="modal">Cancel
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Edit Modal-->

                                    <!-- Delete Modal-->
                                    <div class="modal fade" id="deleteProduct${pr.id}" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel3"
                                         aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <div style="display: flex ; justify-content: flex-start; color: #f5a106">
                                                        <h1>DELETE PRODUCT</h1>
                                                    </div>
                                                    <button class="close" type="button" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true" style="color: red">x</span>
                                                    </button>
                                                </div>

                                                <div align="center">

                                                    <form action="/product?action=delete&id=${pr.id}"
                                                          method="post">
                                                        <p style="margin-bottom: 1px; margin-top: 8px">Id:</p>

                                                        <input type="text" name="id" value="${pr.id}" disabled>

                                                        <p style="margin-bottom: 1px; margin-top: 8px">Name:</p>

                                                        <input type="text" name="name" value="${pr.name}" disabled>


                                                        <p style="margin-bottom: 1px; margin-top: 8px">Category:</p>

                                                        <input type="text" name="name" value="${pr.category.cName}"
                                                               disabled>

                                                        <br>
                                                        <p style="margin-bottom: 1px; margin-top: 17px">
                                                            Are you sure you want to delete ?</p><br>
                                                        <button type="submit" class="btn btn-danger m-2">
                                                            Delete
                                                        </button>
                                                        <button class="btn btn-secondary" type="button"
                                                                data-dismiss="modal">Cancel
                                                        </button>

                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Delete Modal-->

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


<!-- Topbar Navbar -->
<%--<form--%>
<%--        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"--%>
<%--        method="post">--%>
<%--    <div class="input-group">--%>
<%--        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."--%>
<%--               aria-label="Search" aria-describedby="basic-addon2" name="search">--%>
<%--        <div class="input-group-append">--%>
<%--            <button class="btn btn-primary" type="submit">--%>
<%--                <i class="fas fa-search fa-sm"></i>--%>
<%--            </button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</form>--%>


</body>


<jsp:include page="../library/bootstrap/bootstrapAdmin.jsp"></jsp:include>
</html>
