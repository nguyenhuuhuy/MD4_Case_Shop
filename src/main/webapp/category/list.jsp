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
    <title>Admin - Category</title>
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
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div>
                        <div class="card-header py-3" style="display: flex; justify-content: space-between;">
                            <h4 class="m-0 font-weight-bold text-primary">
                                DataTables Category Manage
                            </h4>
                            <div style="color: #1cc88a; margin-top: 10px">
                                <c:if test='${requestScope["message"] != null}'>
                                    <marquee class="message">${requestScope["message"]}</marquee>
                                </c:if>
                            </div>
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
                                    <th scope="col">NAME</th>
                                    <th scope="col">EDIT</th>
                                    <th scope="col">DELETE</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr align="center">
                                    <th scope="col">STT</th>
                                    <th scope="col">NAME</th>
                                    <th scope="col">EDIT</th>
                                    <th scope="col">DELETE</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="cate" items='${requestScope["categoryList"]}'>
                                    <tr align="center">
                                        <td>${cate.cId}</td>
                                        <td>${cate.cName}</td>
                                        <td>
                                            <a type="button" class="dropdown-item" data-toggle="modal"
                                               data-target="#logoutModal9${cate.cId}">
                                                <i class="fa-sharp fa-solid fa-pen-to-square"
                                                   style="color: #2a65b2;"></i>
                                            </a>
                                        </td>
                                        <td>
                                                <%--                                            <a type="button"--%>
                                                <%--                                               href="category?action=delete&id=${cate.cId}">--%>
                                                <%--                                                <i class="fa-solid fa-trash" style="color: #ef4949"></i>--%>
                                                <%--                                            </a>--%>
                                            <a type="button" class="dropdown-item" data-toggle="modal"
                                               data-target="#logoutModal2${cate.cId}">
                                                <i class="fa-solid fa-trash" style="color: #ef4949"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <!-- Edit Modal-->
                                    <div class="modal fade" id="logoutModal9${cate.cId}" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel9"
                                         aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">

                                                <div class="modal-header">
                                                    <div style="display: flex ; justify-content: flex-start; color: #f5a106">
                                                        <h5 class="modal-title" id="exampleModalLabel9">
                                                            Edit category :
                                                        </h5>
                                                        <h5 class="modal-body" style="padding: 4px">ID ${cate.cId}
                                                            ?</h5>
                                                    </div>
                                                    <button class="close" type="button" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true" style="color: red">x</span>
                                                    </button>
                                                </div>
                                                <div align="center">
                                                    <h1>EDIT CATEGORY</h1>
                                                    <form action="/category?action=edit&id=${cate.cId}"
                                                          method="post" class="was-validated">
                                                        <label>Category name</label>&ensp;
                                                        <input type="text" name="name" value="${cate.cName}" required>
                                                        <br>
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
                                    <div class="modal fade" id="logoutModal2${cate.cId}" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel2"
                                         aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <div style="display: flex ; justify-content: flex-start; color: #f5a106">
                                                        <h5 class="modal-title" id="exampleModalLabel2">
                                                            Delete Category :
                                                        </h5>
                                                        <h5 class="modal-body" style="padding: 4px">ID ${cate.cId}
                                                            ?</h5>
                                                    </div>
                                                    <button class="close" type="button" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true" style="color: red">x</span>
                                                    </button>
                                                </div>

                                                <div align="center">
                                                    <h1>DELETE CATEGORY</h1>
                                                    <form action="/category?action=delete&id=${cate.cId}"
                                                          method="post">
                                                        <p style="margin-bottom: 1px; margin-top: 8px">Id:</p>

                                                        <input type="text" name="id" value="${cate.cId}" disabled>

                                                        <p style="margin-bottom: 1px; margin-top: 8px">Name:</p>

                                                        <input type="text" name="name" value="${cate.cName}" disabled>

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

</body>

<jsp:include page="../library/bootstrap/bootstrapAdmin.jsp"></jsp:include>
</html>


