<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/16/2023
  Time: 11:55 AM
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
  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
      <!-- Topbar -->
      <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
        <!-- Sidebar Toggle (Topbar) -->
        <form class="form-inline">
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
        </form>
        <!-- Topbar Search -->
        <form
                class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
          <div class="input-group">
            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                   aria-label="Search" aria-describedby="basic-addon2">
            <div class="input-group-append">
              <button class="btn btn-primary" type="button">
                <i class="fas fa-search fa-sm"></i>
              </button>
            </div>
          </div>
        </form>

        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">

          <!-- Nav Item - Search Dropdown (Visible Only XS) -->
          <li class="nav-item dropdown no-arrow d-sm-none">
            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-search fa-fw"></i>
            </a>
            <!-- Dropdown - Messages -->
            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                 aria-labelledby="searchDropdown">
              <form class="form-inline mr-auto w-100 navbar-search">
                <div class="input-group">
                  <input type="text" class="form-control bg-light border-0 small"
                         placeholder="Search for..." aria-label="Search"
                         aria-describedby="basic-addon2">
                  <div class="input-group-append">
                    <button class="btn btn-primary" type="button">
                      <i class="fas fa-search fa-sm"></i>
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </li>

          <!-- Nav Item - Alerts -->
          <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-bell fa-fw"></i>
              <!-- Counter - Alerts -->
              <span class="badge badge-danger badge-counter">3+</span>
            </a>
            <!-- Dropdown - Alerts -->
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="alertsDropdown">
              <h6 class="dropdown-header">
                Alerts Center
              </h6>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                  <div class="icon-circle bg-primary">
                    <i class="fas fa-file-alt text-white"></i>
                  </div>
                </div>
                <div>
                  <div class="small text-gray-500">December 12, 2019</div>
                  <span class="font-weight-bold">A new monthly report is ready to download!</span>
                </div>
              </a>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                  <div class="icon-circle bg-success">
                    <i class="fas fa-donate text-white"></i>
                  </div>
                </div>
                <div>
                  <div class="small text-gray-500">December 7, 2019</div>
                  $290.29 has been deposited into your account!
                </div>
              </a>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="mr-3">
                  <div class="icon-circle bg-warning">
                    <i class="fas fa-exclamation-triangle text-white"></i>
                  </div>
                </div>
                <div>
                  <div class="small text-gray-500">December 2, 2019</div>
                  Spending Alert: We've noticed unusually high spending for your account.
                </div>
              </a>
              <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
            </div>
          </li>

          <!-- Nav Item - Messages -->
          <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-envelope fa-fw"></i>
              <!-- Counter - Messages -->
              <span class="badge badge-danger badge-counter">7</span>
            </a>
            <!-- Dropdown - Messages -->
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="messagesDropdown">
              <h6 class="dropdown-header">
                Message Center
              </h6>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="dropdown-list-image mr-3">
                  <img class="rounded-circle" src=""
                       alt="...">
                  <div class="status-indicator bg-success"></div>
                </div>
                <div class="font-weight-bold">
                  <div class="text-truncate">Hi there! I am wondering if you can help me with a
                    problem I've been having.
                  </div>
                  <div class="small text-gray-500">Emily Fowler · 58m</div>
                </div>
              </a>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="dropdown-list-image mr-3">
                  <img class="rounded-circle" src=""
                       alt="...">
                  <div class="status-indicator"></div>
                </div>
                <div>
                  <div class="text-truncate">I have the photos that you ordered last month, how
                    would you like them sent to you?
                  </div>
                  <div class="small text-gray-500">Jae Chun · 1d</div>
                </div>
              </a>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="dropdown-list-image mr-3">
                  <img class="rounded-circle" src=""
                       alt="...">
                  <div class="status-indicator bg-warning"></div>
                </div>
                <div>
                  <div class="text-truncate">Last month's report looks great, I am very happy with
                    the progress so far, keep up the good work!
                  </div>
                  <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                </div>
              </a>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <div class="dropdown-list-image mr-3">
                  <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                       alt="...">
                  <div class="status-indicator bg-success"></div>
                </div>
                <div>
                  <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                    told me that people say this to all dogs, even if they aren't good...
                  </div>
                  <div class="small text-gray-500">Chicken the Dog · 2w</div>
                </div>
              </a>
              <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
            </div>
          </li>

          <div class="topbar-divider d-none d-sm-block"></div>

          <!-- Nav Item - User Information -->
          <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
              <img class="img-profile rounded-circle"
                   src="">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="userDropdown">
              <a class="dropdown-item" href="#">
                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                Profile
              </a>
              <a class="dropdown-item" href="#">
                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                Settings
              </a>
              <a class="dropdown-item" href="#">
                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                Activity Log
              </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                Logout
              </a>
            </div>
          </li>

        </ul>

      </nav>
      <!-- End of Topbar -->

      <!-- Begin Page Content -->
      <div align="center">
        <h1>CREATE PRODUCT</h1>
        <form action="" method="post">
          <label>PRUDUCT NAME</label><br>
          <input type="text" name="name"><br>
          <label>CATEGORY</label><br>
          <input type="text" name="idCategory"><br>
          <label>PRICE</label><br>
          <input type="text" name="price"><br>
          <label>AVATAR</label><br>
          <img src="${requestScope["product"].getImage()}" alt="" style="width: 100px;height: 100px">
          <br>
          <progress value="0" max="100" id="uploader">0%</progress>
          <input type="file" value="upload" accept=".jpg" id="fileButton">
          <input name="image" type="text" id="avatar" style="display: none" >
          <div id="imgDiv"></div>
          <label>QUANTITY</label><br>
          <input type="text" name="qty"><br>
          <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
          </c:if> <br>
          <button type="submit">CREATE</button>
        </form>
        <script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
        <script type="text/javascript">
          const firebaseConfig = {
            apiKey: "AIzaSyBwdd6mWXQFS-UvzftRy-jhi4dmjUqhLhs",
            authDomain: "project-e0da8.firebaseapp.com",
            projectId: "project-e0da8",
            storageBucket: "project-e0da8.appspot.com",
            messagingSenderId: "8318937023",
            appId: "1:8318937023:web:ed060395d8cf0085d5630a",
            measurementId: "G-E8JNCH7Z5Q"
          };
          firebase.initializeApp(firebaseConfig);

          var image = '';
          // firebase bucket name
          // REPLACE WITH THE ONE YOU CREATE
          // ALSO CHECK STORAGE RULES IN FIREBASE CONSOLE
          var fbBucketName = 'images';

          // get elements
          var uploader = document.getElementById('uploader');
          var fileButton = document.getElementById('fileButton');

          // listen for file selection
          fileButton.addEventListener('change', function (e) {

            // what happened
            console.log('file upload event', e);

            // get file
            var file = e.target.files[0];

            // create a storage ref
            <%--var storageRef = firebase.storage().ref(`${fbBucketName}/${file.name}`);--%>
            const storageRef = firebase.storage().ref(file.name);
            // upload file
            var uploadTask = storageRef.put(file);

            // The part below is largely copy-pasted from the 'Full Example' section from
            // https://firebase.google.com/docs/storage/web/upload-files

            // update progress bar
            uploadTask.on(firebase.storage.TaskEvent.STATE_CHANGED, // or 'state_changed'
                    function (snapshot) {
                      // Get task progress, including the number of bytes uploaded and the total number of bytes to be uploaded
                      var progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                      uploader.value = progress;
                      console.log('Upload is ' + progress + '% done');
                      switch (snapshot.state) {
                        case firebase.storage.TaskState.PAUSED: // or 'paused'
                          console.log('Upload is paused');
                          break;
                        case firebase.storage.TaskState.RUNNING: // or 'running'
                          console.log('Upload is running');
                          break;
                      }
                    }, function (error) {

                      // A full list of error codes is available at
                      // https://firebase.google.com/docs/storage/web/handle-errors
                      switch (error.code) {
                        case 'storage/unauthorized':
                          // User doesn't have permission to access the object
                          break;

                        case 'storage/canceled':
                          // User canceled the upload
                          break;

                        case 'storage/unknown':
                          // Unknown error occurred, inspect error.serverResponse
                          break;
                      }
                    }, function () {
                      // Upload completed successfully, now we can get the download URL
                      // save this link somewhere, e.g. put it in an input field
                      var downloadURL = uploadTask.snapshot.downloadURL;
                      image = downloadURL;
                      console.log('downloadURL ===>', downloadURL);
                      let divLocation = document.getElementById("imgDiv");
                      let imgElement = document.createElement("img");
                      imgElement.src = downloadURL
                      imgElement.width = 100;
                      imgElement.height = 100;
                      console.log('pic ==', downloadURL)
                      divLocation.append(imgElement);
                      document.getElementById('avatar').value = downloadURL;
                    });

          });

          // function resultImage(){
          //   console.log('image resulte -->', image)
          //   return image;
          // }
        </script>

      </div>


      <!-- /.container-fluid -->
    </div>
    <!-- End of Main Content -->
    <!-- Footer -->
    <footer class="sticky-footer bg-white">
      <div class="container my-auto">
        <div class="copyright text-center my-auto">
          <span>Copyright &copy; Your Website 2020</span>
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
<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
        <a class="btn btn-primary" href="login.html">Logout</a>
      </div>
    </div>
  </div>
</div>
</body>
<jsp:include page="../library/bootstrap/bootstrapAdmin.jsp"></jsp:include>
</html>

