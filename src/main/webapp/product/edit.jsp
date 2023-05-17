<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 5/16/2023
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Form edit Product</h1>
<c:if test='${requestScope["message"] != null}'>
    <span style="color: blue" class="message">${requestScope["message"]}</span>
</c:if>
<a href="/product">back menu</a>
<form method="post">
    <label>Name</label><br>
    <input type="text" name="name" value="${requestScope["product"].getName()}" ><br>
    <label>category</label><br>
    <input type="text" name="idCategory" value="${requestScope["product"].category.cId}" ><br>
    <label>price</label><br>
    <input type="text" name="price" value="${requestScope["product"].getPrice()}" ><br>
    <label>image</label><br>
    <img src="${requestScope["product"].getImage()}" alt="" style="width: 100px;height: 100px">
    <br>
    <progress value="0" max="100" id="uploader">0%</progress>
    <input type="file" value="upload" accept=".jpg" id="fileButton">
    <input name="image" type="text" id="avatar" style="display: none" >
    <div id="imgDiv"></div>
    <label>quantity</label><br>
    <input type="text" name="qty" value="${requestScope["product"].getQuantity()}" ><br>
    <button>Edit</button>
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
</body>
</html>
