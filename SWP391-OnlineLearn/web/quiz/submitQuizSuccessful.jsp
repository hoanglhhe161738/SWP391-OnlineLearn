<%-- 
    Document   : submitQuizSuccessful.jsp
    Created on : Mar 16, 2023, 5:19:05 PM
    Author     : Khangnekk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Điểm bài học</title>
        <link rel="icon" href="../Assets/icon/favicon.png">
        <!-- link bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
        <style>
            .center {
                border-radius: 10px;
                padding: 3em 10em;
                text-align: center;
                background-color: #f2f2f2;
                font-family: sans-serif;
            }
            h1 {
                font-size: 36px;
                margin-bottom: 0.5em;
            }

            h2 {
                font-size: 24px;
                margin-top: 0;
            }
        </style>
    </head>
    <body>
        <div style="display: flex;
             flex-direction: column;
             justify-content: center;
             align-items: center;
             height: 100vh;">
            <div class="center">
                <img src="../Assets/images/cup.png" style="width: 30%">
                <h1>CHÚC MỪNG BẠN HOÀN THÀNH BÀI HỌC</h1>
                <h2>Điểm số </h2>
                <p>${requestScope.userRank.points}</p>
                <h3 style="font-size: 3em; font-weight: bold;color: #745bde">${requestScope.points}</h3>
                
                <a class="btn btn-success" href="./classes">
                    Tiếp tục
                </a>
            </div>
        </div>
    </body>
</html>
