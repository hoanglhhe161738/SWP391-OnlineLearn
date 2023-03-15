<%-- 
    Document   : addVideo
    Created on : Mar 13, 2023, 6:42:01 PM
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
            table thead td {
                border: 2px solid white;
                color: white;
            }

            td {
                border: 2px solid white;
            }

            table {
                text-align: center;
            }

            .table-quiz {
                height: 11em;
                overflow: auto;
                overflow-x: hidden;
                overflow-y: auto;
            }

            .input-quiz {
                display: flex;
                flex-direction: column;

            }

            .statis-quiz {
                display: flex;
                justify-content: space-between;
                padding: 0 3em 0;
            }

            .static-quiz-right {

                flex: 1;
                margin-left: 2em;
                /* flex: 2; */
            }

            .static-quiz-left {
                background-color: #f2f2f2;
                padding: 0 2em 2em 2em;
            }

            .input-quiz input {
                margin-top: 0.5em;
                width: 28em;
                border: white;
            }

            .text {
                padding: 1em 0 0 0;
                font-weight: bold;
            }

            .statis-quiz-text {
                padding: 1em 0 0 0;
                font-weight: bold;
            }

            .list-item label {
                min-width: 150px;
            }

            .list-item {
                list-style: none;
                display: flex;
                margin-top: 1em;
            }

            .list-item input {
                flex: 1;
                border: 1px solid black;
            }
        </style>

        <title>Add Video</title>
    </head>

    <body>
        <jsp:include page="../custom/navForAdmin.jsp"></jsp:include>

            <div class="statis-quiz container-fluid" style="height: 100%; margin-top: 2em;">
                <div class="static-quiz-left">
                    <div class="text">
                        <p>Đang thêm video cho</p>
                    </div>
                    <div class="input-quiz">
                        <input disabled type="text" value="Lớp ${sessionScope.class_id}">
                    <input disabled type="text" value="${sessionScope.course.course_name} lớp ${sessionScope.class_id}">
                    <input disabled type="text" value="${sessionScope.module.module_name}">
                    <input disabled type="text" value="${sessionScope.lesson.lesson_name}">
                </div>


                <div style="margin-top: 2em;">

                    <a href="./actionVideo?action=add"
                       <c:if test="${sessionScope.video ne null}">
                           data-bs-toggle="modal" data-bs-target="#exampleModal"
                       </c:if>                     
                       >
                        <button
                            style="width: 100%; color: #f2f2f2; font-size: large; background-color: #00de7a; padding: 0.5em 0 0.5em 0;border: white;">
                            Thêm video</button>
                    </a>

                    <a href="./actionVideo?action=edit"
                       <c:if test="${sessionScope.video eq null}">
                           data-bs-toggle="modal" data-bs-target="#exampleModal2"
                       </c:if>
                       >
                        <button
                            style="width: 100%;margin-top: 1em; color: #f2f2f2; font-size: large; background-color: #005aff; padding: 0.5em 0 0.5em 0;border: white;">
                            Sửa video</button>
                    </a>
                    <a href="./choiceClassToAddVideo">
                        <button
                            style="width: 100%; color: #f2f2f2; margin-top: 1em; font-size: large; background-color: red; padding: 0.5em 0 0.5em 0;border: white;">
                            Trở lại trang chọn bài học</button>
                    </a>
                    <c:if test="${requestScope.alert ne null}">
                        <div style=" margin-top: 1em">
                            <a style="font-size: 20px; font-weight: bold; margin-right: 1em">
                                <i class="fa-solid fa-bell"></i>
                            </a> 
                            <a style="color: #00de7a; font-size: 20px; font-weight: bold;">
                                ${requestScope.alert}
                            </a>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel" style="align-items: center">
                                <i class="fa-sharp fa-solid fa-bell"></i> Thông báo từ hệ thống                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div style="font-size: 20px;">Video đã tồn tại, không thể thêm 2 video cho 1 bài giảng</div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đồng ý</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel" style="align-items: center">                       
                                <i class="fa-sharp fa-solid fa-bell"></i> Thông báo từ hệ thống
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div style="font-size: 20px;">Hiện tại không có thông tin của video để sửa, bạn cần thêm video trước</div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đồng ý</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="static-quiz-right">
                <c:if test="${requestScope.action != -1}">
                    <c:if test="${sessionScope.video eq null}">
                        <form action="./actionVideo" method="POST">
                            <input hidden name="action" value="add">
                            <div class=" list-answer" style="width: 100%;">
                                <ul style="padding-left: 20px;">
                                    <li class="list-item">
                                        <label for="answer1">Tiêu đề video:</label>
                                        <input type="text" name="title">
                                    </li>
                                    <li class="list-item">
                                        <label for="answer1">URL video:</label>
                                        <input type="text" name="url">
                                    </li>

                                </ul>
                            </div>
                            <div style="padding: 2em 0 0 70%;">
                                <input style="width: 10em; height: 2em; background-color: #00de7a; color: #fff;border: none; font-size: large; font-weight: bold; border-radius: 10px;" type="submit" value="Hoàn tất">
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.video ne null}">
                        <form action="./actionVideo" method="POST">
                            <input hidden name="action" value="edit">
                            <div class=" list-answer" style="width: 100%;">
                                <ul style="padding-left: 20px;">
                                    <li class="list-item">
                                        <label for="answer1">Tiêu đề video:</label>
                                        <input type="text" name="title" value="${sessionScope.video.video_title}">
                                        <input hidden name="video_id" value="${sessionScope.video.video_id}">
                                    </li>
                                    <li class="list-item">
                                        <label for="answer1">URL video:</label>
                                        <input type="text" name="url" value="${sessionScope.originURL}">
                                    </li>

                                </ul>
                            </div>
                            <div style="padding: 2em 0 0 70%;">
                                <input style="width: 10em; height: 2em; background-color: #00de7a; color: #fff;border: none; font-size: large; font-weight: bold; border-radius: 10px;" type="submit" value="Hoàn tất">
                            </div>
                        </form>
                    </c:if>
                </c:if>
                <c:if test="${requestScope.action eq -1}">

                </c:if>
            </div>
        </div>
    </body>

</html>