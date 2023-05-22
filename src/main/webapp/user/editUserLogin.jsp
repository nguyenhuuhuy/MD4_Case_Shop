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
    <title>Edit profile</title>
    <link rel="shortcut icon" type="image/icon" href="../../assets/logo/favicon.png"/>


    <style>
        body {
            margin: 0;
            padding-top: 40px;
            color: #2e323c;
            background: #f5f6fa;
            position: relative;
            height: 100%;
        }

        .account-settings .user-profile {
            margin: 0 0 1rem 0;
            padding-bottom: 1rem;
            text-align: center;
        }

        .account-settings .user-profile .user-avatar {
            margin: 0 0 1rem 0;
        }

        .account-settings .user-profile .user-avatar img {
            width: 90px;
            height: 90px;
            -webkit-border-radius: 100px;
            -moz-border-radius: 100px;
            border-radius: 100px;
        }

        .account-settings .user-profile h5.user-name {
            margin: 0 0 0.5rem 0;
        }

        .account-settings .user-profile h6.user-email {
            margin: 0;
            font-size: 0.8rem;
            font-weight: 400;
            color: #9fa8b9;
        }

        .account-settings .about {
            margin: 2rem 0 0 0;
            text-align: center;
        }

        .account-settings .about h5 {
            margin: 0 0 15px 0;
            color: #007ae1;
        }

        .account-settings .about p {
            font-size: 0.825rem;
        }

        .form-control {
            border: 1px solid #cfd1d8;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            font-size: .825rem;
            background: #ffffff;
            color: #2e323c;
        }

        .card {
            background: #ffffff;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            border: 0;
            margin-bottom: 1rem;
        }

    </style>

</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<%--Edit profile--%>
<div class="container" style="margin-top: 150px">
    <p style="font-weight: 500; color: black; font-size: 20px">Edit profile</p>
    <form method="post">
        <div class="row gutters">
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar">
                                    <img src="${requestScope['userEditLogin'].avatar}" alt="Maxwell Admin">
                                </div>
                                <h5 class="user-name">${requestScope['userEditLogin'].name}</h5>
                                <p style="font-size: 14px; text-transform: lowercase"
                                   class="user-email">${requestScope['userEditLogin'].email}</p>
                                <p>Your ID:</p>
                                <input type="text" value="${requestScope['userEditLogin'].id}" disabled>
                            </div>
                            <div class="about">
                                <h5>Change Avatar</h5>
                                <progress value="0" max="100" id="uploader">0%</progress>
                                <input type="file" value="upload" accept=".jpg" id="fileButton">
                                <input name="avatar" type="text" id="avatar" style="display: none"
                                       value="${requestScope['userEditLogin'].avatar}">
                                <div id="imgDiv"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mb-2 text-primary">Personal Details</h6>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" placeholder="Enter full name "
                                           name="nameLogin" value="${requestScope['userEditLogin'].name}" required>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="eMail">Email</label>
                                    <input type="email" class="form-control" id="eMail" placeholder="Enter email ID"
                                           name="emailLogin" value="${requestScope['userEditLogin'].email}" required>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="website">Password</label>
                                    <input type="text" class="form-control" id="website"
                                           placeholder="Enter New Password"
                                           name="passwordLogin" value="${requestScope['userEditLogin'].password}"
                                           required>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="text" class="form-control" id="phone" placeholder="Enter phone number">
                                </div>
                            </div>

                        </div>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mt-3 mb-2 text-primary">Address</h6>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="Street">Street</label>
                                    <input type="name" class="form-control" id="Street" placeholder="Enter Street">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="ciTy">City</label>
                                    <input type="name" class="form-control" id="ciTy" placeholder="Enter City">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="sTate">State</label>
                                    <input type="text" class="form-control" id="sTate" placeholder="Enter State">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="zIp">Zip Code</label>
                                    <input type="text" class="form-control" id="zIp" placeholder="Zip Code">
                                </div>
                            </div>
                        </div>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="text-right">
                                    <button type="button" class="btn btn-secondary">
                                        <a href="/home">
                                            <button type="button" class="btn btn-danger">
                                                Back
                                            </button>
                                        </a>
                                    </button>
                                    <button type="submit" id="submit" name="submit" class="btn btn-primary">Update
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</div>


<jsp:include page="../layout/footer.jsp"></jsp:include>

<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
<%--<script>--%>

<%--    //BE SURE TO PROTECT EVERYTHING IN THE CONFIG--%>
<%--    //DON'T COMMIT IT!!!--%>

<%--    // Initialize Firebase--%>
<%--    const firebaseConfig = {--%>
<%--        apiKey: "AIzaSyAHbXIdiO5i-nOweX-szmiNn4JSyrOjDi4",--%>
<%--        authDomain: "chinhbeo-18d3b.firebaseapp.com",--%>
<%--        databaseURL: "https://chinhbeo-18d3b.firebaseio.com",--%>
<%--        projectId: "chinhbeo-18d3b",--%>
<%--        storageBucket: "chinhbeo-18d3b.appspot.com",--%>
<%--        messagingSenderId: "197467443558",--%>
<%--        appId: "1:197467443558:web:7cccdbe875f827eb84b8a7",--%>
<%--        measurementId: "G-D375CXH5LG"--%>
<%--    };--%>
<%--    firebase.initializeApp(firebaseConfig);--%>
<%--</script>--%>

<script type="text/javascript">
    const firebaseConfig = {
        apiKey: "AIzaSyC_y3aZuI7I5OhhWg7z8rwFEKXUkTKUvzc",
        authDomain: "nguyendanhson-9374f.firebaseapp.com",
        projectId: "nguyendanhson-9374f",
        storageBucket: "nguyendanhson-9374f.appspot.com",
        messagingSenderId: "297043475039",
        appId: "1:297043475039:web:5c4884db43b2b24af7f9ea",
        measurementId: "G-1QMVSBZ3TM"
    };
    // const firebaseConfig = {
    //     apiKey: "AIzaSyBwdd6mWXQFS-UvzftRy-jhi4dmjUqhLhs",
    //     authDomain: "project-e0da8.firebaseapp.com",
    //     projectId: "project-e0da8",
    //     storageBucket: "project-e0da8.appspot.com",
    //     messagingSenderId: "8318937023",
    //     appId: "1:8318937023:web:ed060395d8cf0085d5630a",
    //     measurementId: "G-E8JNCH7Z5Q"
    // };
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
</body>
</html>
