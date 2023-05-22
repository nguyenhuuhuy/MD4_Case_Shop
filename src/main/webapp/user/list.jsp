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
    <title>Admin - Users</title>
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
                <span class="message" style="color: red; margin-left: 400px;">${requestScope["message"]}</span>
            </c:if>
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary">DataTables User Manage</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr align="center">
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>UserName</th>
                                    <th>Email</th>
                                    <th>Avatar</th>
                                    <th>Role</th>
                                    <th>Status</th>
                                    <th>Block</th>
                                    <th>Edit</th>
<%--                                    <th>Delete</th>--%>

                                </tr>
                                </thead>
                                <tfoot>
                                <tr align="center">
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>UserName</th>
                                    <th>Email</th>
                                    <th>Avatar</th>
                                    <th>Role</th>
                                    <th>Status</th>
                                    <th>Block</th>
                                    <th>Edit</th>
<%--                                    <th>Delete</th>--%>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items='${requestScope["listUser"]}' var="user">
                                    <tr align="center">
                                        <td>${user.id}</td>
                                        <td>${user.name}</td>
                                        <td>${user.username}</td>
                                        <td>${user.email}</td>
                                        <td>
                                            <img src="${user.avatar}" alt="avatar" width="40" height="40">
                                        </td>
                                        <td>
                                            <c:forEach items="${user.getRoleSet()}" var="Role"> ${Role.getName()}
                                            </c:forEach>
                                        </td>
                                        <td>${user.status == false ? "Unlock" :"Lock"}</td>
                                        <td>
                                            <a type='button' class='dropdown-item' data-toggle='modal'
                                               data-target='#blockUser${user.id}'>
                                                    ${user.status == false ? "<i class='fa-solid fa-shop-lock' style='color: #f5003d;'></i>" : "<i class='fa-solid fa-key' style='color: #2861c3'></i>"}
                                            </a>
                                        </td>
                                        <td>
                                            <a type="button" class="dropdown-item" data-toggle="modal"
                                               data-target="#editUser${user.id}">
                                                <i class="fa-sharp fa-solid fa-pen-to-square"
                                                   style="color: #2a65b2;"></i>
                                            </a>
                                        </td>
<%--                                        <td>--%>
<%--                                            <a type="button" class="dropdown-item" data-toggle="modal"--%>
<%--                                               data-target="#deleteUser${user.id}">--%>
<%--                                                <i class="fa-solid fa-trash" style="color: #ef4949"></i>--%>
<%--                                            </a>--%>
<%--                                        </td>--%>

                                    </tr>
                                    <!-- Block User-->
                                    <div class="modal fade" id="blockUser${user.id}" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <div style="display: flex ; justify-content: flex-start; color: #f5a106">
                                                    </div>
                                                    <button class="close" type="button" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true" style="color: red">x</span>
                                                    </button>
                                                </div>

                                                <div align="center">
                                                    <h1>BLOCK / UNLOCK USER</h1>
                                                    <p style="margin-bottom: 1px; margin-top: 8px">${user.name}</p>

                                                    <p style="margin-bottom: 1px; margin-top: 17px">
                                                        Are you sure you want to Block/unlock ?</p><br>
                                                    <a href="/user?action=block&id=${user.id}"
                                                       class="btn btn-danger m-2">
                                                        Submit
                                                    </a>
                                                    <button class="btn btn-secondary" type="button"
                                                            data-dismiss="modal">Cancel
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End BlockUser-->
                                    <!-- Edit Modal-->
                                    <div class="modal fade" id="editUser${user.id}" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">

                                                <div class="modal-header">
                                                    <div style="display: flex ; justify-content: flex-start; color: #f5a106">
                                                        <h1>EDIT USER</h1>
                                                    </div>
                                                    <button class="close" type="button" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true" style="color: red">x</span>
                                                    </button>
                                                </div>

                                                <div align="center">
                                                    <form action="/user?action=edit&id=${user.id}"
                                                          method="post">
                                                        <h2>
                                                            <c:if test='${requestScope["message"]!=null}'>
                                                                <h2 style="color: red">${requestScope["message"]}</h2>
                                                            </c:if>
                                                        </h2>
                                                        <p style="margin-bottom: 1px; margin-top: 8px">Id:</p>

                                                        <input type="text" name="id" value="${user.id}" disabled>

                                                        <p style="margin-bottom: 1px; margin-top: 8px">Name:</p>

                                                        <input type="text" name="name" value="${user.name}" required>

                                                        <p style="margin-bottom: 1px; margin-top: 8px">Email:</p>

                                                        <input type="email" name="email" value="${user.email}" required>

                                                        <p style="margin-bottom: 1px; margin-top: 8px">Password:</p>

                                                        <input type="text" name="password" value="${user.password}" required>

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
                                    <div class="modal fade" id="deleteUser${user.id}" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <div style="display: flex ; justify-content: flex-start; color: #f5a106">
                                                        <h1>DELETE USER</h1>
                                                    </div>
                                                    <button class="close" type="button" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true" style="color: red">x</span>
                                                    </button>
                                                </div>

                                                <div align="center">
                                                    <form action="/user?action=delete&id=${user.id}"
                                                          method="post">
                                                        <p style="margin-bottom: 1px; margin-top: 8px">Id:</p>

                                                        <input type="text" name="id" value="${user.id}" disabled>

                                                        <p style="margin-bottom: 1px; margin-top: 8px">Name:</p>

                                                        <input type="text" name="name" value="${user.name}" disabled>

                                                        <p style="margin-bottom: 1px; margin-top: 8px">Email:</p>

                                                        <input type="text" name="email" value="${user.email}" disabled>

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
