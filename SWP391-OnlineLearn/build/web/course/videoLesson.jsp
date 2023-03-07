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
        .title-lesson{
            display: flex;
            justify-content: center;
            padding-left: 3em;
            background-image: linear-gradient(to right, #00de7a,#195de2);
            color: #fff;
            font-weight: bold
        }
        .title-lesson h1{
            font-size: 30px;
            padding: 5px;
        }
        .embed-style{
            display: flex;
            justify-content: center;
            margin: 2em auto 0em auto;
        }
        .glow-on-hover a{
            text-decoration: none;
            color: white;
            font-size: 20px;
            padding: 2em 1em 1em 1em;
            font-weight: bold;
        }
        .glow-on-hover {
            border: none;
            outline: none;
            color: #fff;
            background: #111;
            cursor: pointer;
            position: relative;
            z-index: 0;
            border-radius: 10px;
        }

        .glow-on-hover:before {
            content: '';
            background: linear-gradient(45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000);
            position: absolute;
            top: -2px;
            right:-2px;
            background-size: 400%;
            z-index: -1;
            filter: blur(5px);
            width: calc(100% + 4px);
            height: calc(100% + 4px);
            animation: glowing 20s linear infinite;
            opacity: 0;
            transition: opacity .3s ease-in-out;
            border-radius: 10px;
        }

        .glow-on-hover:active {
            color: #000
        }

        .glow-on-hover:active:after {
            background: transparent;
        }

        .glow-on-hover:before {
            opacity: 1;
        }

        .glow-on-hover:after {
            z-index: -1;
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            background: #111;
            left: 0;
            top: 0;
            border-radius: 10px;
        }

        @keyframes glowing {
            0% {
                background-position: 0 0;
            }
            50% {
                background-position: 400% 0;
            }
            100% {
                background-position: 0 0;
            }
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
                    <h1>${requestScope.video.video_title}</h1>
            </div>
            <div class="embed-style">
                <iframe style="border-radius: 15px" width="1000" height="568" src="${requestScope.result}"                        
                        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; 
                        picture-in-picture; web-share" allowfullscreen></iframe>
            </div>
            <div style="text-align: right; margin: 0.8em  2em">
                <button class="glow-on-hover"><a href="../game/matchgame?lession_id=49&lession_name=${requestScope.lesson.lesson_name}">Game</a></button>
                <button class="glow-on-hover"><a href="./quiz?lession_id=${requestScope.lesson.lesson_id}">Làm bài tập</a></button>
                <button class="glow-on-hover""><a href="#">Đánh dấu là đã học xong</a></button>
            </div>
        </div>
    </div>
</body>

</html>