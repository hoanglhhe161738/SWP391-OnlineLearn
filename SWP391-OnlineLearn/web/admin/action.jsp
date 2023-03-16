<%-- 
    Document   : action.jsp
    Created on : Mar 8, 2023, 8:22:29 PM
    Author     : Khangnekk
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Assets/css/action.css">
        <link rel="icon" href="../Assets/icon/favicon.png"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
              integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            .custom-icon{
                font-size: 4em;
                margin-bottom: 0.3em;
                color: white;
            }
            .choiceAction-colum{
                cursor: pointer;
            }
            .choiceAction-colum a{
                text-decoration: none;
                font-weight: bold;
            }
        </style>
        <title>Admin</title>
    </head>

    <body>
        <jsp:include page="../custom/navForAdmin.jsp"></jsp:include>
        <div class="choiceAction container text-center" style="padding: 2em">
            <div class="choiceAction-content row row-cols-2 row-cols-lg-3 g-2 g-lg-3">
                <div class="choiceAction-colum col">
                    <a href="./choiceClassToAddQuiz">
                        <div class="choiceAction-colum-item p-3" style="background-color: #ff0000;">
                            <div><i class="custom-icon fa-solid fa-circle-question"></i></div>
                            <p>Quản lý câu hỏi</p>
                        </div>
                    </a>
                </div>
                <div class="choiceAction-colum col">
                    <a href="./ChoiceClassToAddGameImage">
                        <div class="choiceAction-colum-item p-3" style="background-color: #0081e2;">
                            <div><i class="custom-icon fa-solid fa-gamepad"></i></div>
                            <p>Quản lý trò chơi</p>
                        </div>
                    </a>
                </div>
                <div class="choiceAction-colum col">
                    <a href="./choiceClassToAddVideo">
                        <div class="choiceAction-colum-item p-3" style="background-color: #00ed7a;">
                            <div><i class="custom-icon fa-solid fa-circle-play"></i></div>
                            <p>Quản lý video</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="choiceAction-content row row-cols-5 row-cols-lg-3 g-2 g-lg-3" style="margin-top: 0.5em;">
                <div class="choiceAction-colum col">
                    <a href="./ChoiceClassToAddContent">
                        <div class="choiceAction-colum-item p-3" style="background-color: #ffa500;">
                            <div><i  class="custom-icon fa-solid fa-bars"></i></div>
                            <p>Quản lý content</p>
                        </div>
                    </a>
                </div>
                <div class="choiceAction-colum col">
                    <a href="./userManagement">
                        <div class="choiceAction-colum-item p-3" style="background-color: #9400D3;">
                            <div><i class="custom-icon fa-solid fa-user"></i></div>
                            <p>Quản lý người dùng</p>
                        </div>
                    </a>
                </div>
                <div class="choiceAction-colum col">
                    <a href="./ChoiceClassToAddModule">
                        <div class="choiceAction-colum-item p-3" style="background-color: #FF4500;">
                            <div><i class="custom-icon fa-solid fa-chalkboard-user"></i></div>
                            <p>Thêm/Sửa chương</p>
                        </div>
                    </a>
                </div>

            </div>
            <div class="choiceAction-content row row-cols-5 row-cols-lg-3 g-2 g-lg-3" style="margin-top: 0.5em;">
                <div class="choiceAction-colum col">
                    <a href="./ChoiceClassToAddLession">
                        <div class="choiceAction-colum-item p-3" style="background-color: #008080;">
                            <div><i class="custom-icon fa-solid fa-person-chalkboard"></i></div>
                            <p>Thêm/Sửa bài học</p>
                        </div>
                    </a>
                </div>

            </div>
        </div>
    </body>

</html>