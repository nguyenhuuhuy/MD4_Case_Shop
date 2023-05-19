<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
<head>
    <title>Title</title>
</head>
<body>

<%--<form method="post">--%>

<%--<h1>upload file: ${param.articleId}</h1>--%>
<h5>Change avatar</h5>
<progress value="0" max="100" id="uploader+${param.articleId}" hidden>0%</progress>
<input type="file" value="${param.image}." accept=".jpg" id="fileButton+${param.articleId}">
<input name="avatar${param.articleId}" type="text" id="avatar+${param.articleId}" style="display: none">
<div id="imgDiv+${param.articleId}"></div>

<%--  <button type="submit">Upload</button>--%>
<%--</form>--%>
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

    firebase.initializeApp(firebaseConfig);
    console.log('goi config')
    // var image = '';
    // firebase bucket name
    // REPLACE WITH THE ONE YOU CREATE
    // ALSO CHECK STORAGE RULES IN FIREBASE CONSOLE
    var fbBucketName = 'images';

    // get elements
    var uploader = document.getElementById('uploader+${param.articleId}');
    var fileButton = document.getElementById('fileButton+${param.articleId}');
    console.log('uploader --->', uploader)

    console.log('fileButton -->', fileButton)
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
                let divLocation = document.getElementById("imgDiv+${param.articleId}");
                let imgElement = document.createElement("img");
                imgElement.src = downloadURL
                imgElement.width = 100;
                imgElement.height = 100;
                console.log('pic ==', downloadURL)
                divLocation.append(imgElement);
                document.getElementById('avatar+${param.articleId}').value = downloadURL;
                console.log('id avatar ------------------>', document.getElementById('avatar+${param.articleId}').value)
            });

    });


</script>
</body>
</html>