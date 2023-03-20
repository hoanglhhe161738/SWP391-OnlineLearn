<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>--> 
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bài học</title>
    <link rel="stylesheet" href="../Assets/css/Style.css">
    <link rel="stylesheet" href="../Assets/css/course.css">
    <link rel="icon" href="../Assets/icon/favicon.png"/>
    <!-- link bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        .content{

        }
        .embed-style{
            display: flex;
            justify-content: right;
            margin: 1em 2em 0em 0em;
        }
        .info{
            background: white;
            margin: 1em 0em auto 1em;
            height: 568px;
            padding: 1em;
            border-radius: 10px;
        }
        .info h1{
            font-weight: bold;
            font-size: large;
            margin-top: 1em;
        }
        .info h2{
            /*font-weight: bold;*/
            font-size: large;
        }

        input[type="text"] {
            width: 100%;
            height: 30px;
            margin-bottom: 10px;
        }

        button {
            padding: 1px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #3e8e41;
        }

        .info ul {
            list-style: none;
            margin-top: 20px;
            padding: 0;
        }

        .info li {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
            white-space: pre-wrap;
        }

        .info li button {
        }

        .completed {
            text-decoration: line-through;
        }
    </style>
</head>

<body>
    <div class="main">
        <!--nav bar-->
        <jsp:include page="../custom/nav.jsp"></jsp:include>
            <!--content-->
            <div class="content">     
                <div class="title-lesson">  
                    <h1></h1>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="info">
                                <h1>Tiêu đề bài học:</h1>
                                <h2>${requestScope.video.video_title}</h2>
                            <h1 style="text-align: center; margin-top: 2em">Công cụ hỗ trợ học tập</h1>
                            <p style="font-size: 12px; color: red">(*) Lưu ý: Ghi chú sẽ không còn khi thoát trang này</p>
                            <!--<form>-->
                            <label for="task">Tạo ghi chú:</label><br>
                            <input type="text" id="task" name="task"><br>
                            <button type="button" onclick="addNote()">Thêm</button>
                            <!--</form>-->
                            <ul id="task-list" style="overflow: auto; height: 222px;"></ul>

                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="embed-style">
                            <iframe style="border-radius: 15px" width="1000" height="568" src="${requestScope.result}"                        
                                    frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; 
                                    picture-in-picture; web-share" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    var taskList = [];

    function addNote() {
        var taskInput = document.getElementById("task");
        var task = taskInput.value.trim();
        if (task !== "") {
            taskList.push(task);
            taskInput.value = "";
            renderTaskList();
        }
    }

    function completeTask(index) {
        taskList[index] = "<s>" + taskList[index] + "</s>";
        renderTaskList();
    }

    function deleteTask(index) {
        taskList.splice(index, 1);
        renderTaskList();
    }

    function renderTaskList() {
        var taskListElement = document.getElementById("task-list");
        taskListElement.innerHTML = "";
        for (var i = 0; i < taskList.length; i++) {
            var taskListItem = document.createElement("li");
            taskListItem.innerHTML = taskList[i] + " " +
                    "<br>" +
                    "<div style='text-align: center; margin-top:2px;'><button type='button'style='background: #33a1ff;' onclick='completeTask(" + i + ")'>Gạch bỏ</button>"
                    + "<button type='button' style='background:red; margin-left:10px;' onclick='deleteTask(" + i + ")'>Xóa ghi chú</button></div>";
            if (taskList[i].startsWith("<s>")) {
                taskListItem.classList.add("completed");
            }
            taskListElement.appendChild(taskListItem);
        }
    }
    var taskInput = document.getElementById("task");

    taskInput.addEventListener("keypress", function (event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            addNote();
        }
    });

</script>
</html>