<%-- 
    Document   : choiceGameLession
    Created on : Mar 10, 2023, 4:25:17 PM
    Author     : Acer
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
        <title>Match Game</title>
        <style>
            .change-quiz {
                display: flex;
                background-color: #f2f2f2;
                width: 50%;
                margin: 8% auto;
                flex-direction: column;
                padding-bottom: 20px;
            }

            .change-quiz-medium {
                display: flex;
                flex-direction: column;
                justify-content: space-around;
                padding: 2em;
            }

            .quiz-label {
                display: flex;
                margin: 0.5em;
            }

            .quiz-label-choice {
                flex: 1;
                border: #f2f2f2;
            }

            .quiz-label-name {
                min-width: 120px;
            }

            .change-quiz-top {
                background-color: #ff0000;
                color: #f2f2f2;
                font-size: 1.5rem;
                text-align: center;
                font-weight: bold;
                padding-top: 1em;
                border-radius: 10px 10px 0 0;
            }

            .change-quiz-bottom button {
                background-color: #00b050;
                padding: 5px 40px 5px 40px;
                color: #f2f2f2;
                font-size: 1rem;
                border: #f2f2f2;
                border-radius: 20px;
            }

            .change-quiz-bottom {
                margin: auto;
            }
        </style>
    </head>

    <body>
        <div class="nav-information">
            <div class="nav-information-item" style="padding-top: 0.2em;">
                <div class="nav-information-image">
                    <div
                        style="height: 0.8em; width: 0.8em; border: 3px solid #fff; margin-left: 2em;margin-top: 2em; border-radius: 50%; background-color: #00b050;">
                    </div>

                </div>
                <div class="nav-information-text">
                    <ul class="nav-information-text-content">
                        <li class="nav-information-text-content-item">Khanh chi to</li>
                        <li class="nav-information-text-content-item">Admin</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="change-quiz ">
            <div class="change-quiz-top" style="background-color: #0081e2">
                <div class="quiz-text" >
                    <p>Chọn bài học sẽ thêm ảnh của game</p>
                </div>
            </div>
            <div class="change-quiz-medium">
                <div class="quiz-label">
                    <label class="quiz-label-name" for="grade">Chọn Lớp: </label>
                    <form action="ChoiceClassToAddGameImage" method="POST">
                        <select class="quiz-label-choice" onchange="this.form.submit()" name="grade" id="">
                            <option  value="-1">-- Chọn lớp --</option>
                            <c:forEach items="${sessionScope.classesToAddGame}" var="cl">
                                <option "
                                        <c:if test="${sessionScope.class_id_game eq cl.class_id}">
                                            selected="selected"

                                        </c:if>
                                        value="${cl.class_id}">
                                    ${cl.class_name}
                                </option>
                            </c:forEach>
                        </select>
                    </form>
                </div>
                <div class="quiz-label">
                    <label class="quiz-label-name" for="course">Chọn Khóa học: </label>
                    <form action="ChoiceCourseToAddGameImage"  method="GET">
                        <select class="quiz-label-choice" onchange="this.form.submit()" name="course" id="">
                            <option  value="-1">-- Chọn course --</option>
                            <c:forEach items="${sessionScope.coursesToAddGame}" var="co">
                                <option "
                                        <c:if test="${sessionScope.course_game.course_id eq co.course_id}">
                                            selected="selected"

                                        </c:if>
                                        value="${co.course_id}">
                                    ${co.course_name} Lớp ${sessionScope.class_id_game}
                                </option>
                            </c:forEach>
                        </select>
                    </form>
                </div>
                <div class="quiz-label">
                    <label class="quiz-label-name" for="module">Chọn Chương: </label>
                    <form action="ChoiceCourseToAddGameImage"   method="POST">
                        <select class="quiz-label-choice" onchange="this.form.submit()" name="module" id="">
                            <option  value="-1">-- Chọn Chương --</option>
                            <c:forEach items="${sessionScope.modulesToAddGame}" var="mo">
                                <option "
                                        <c:if test="${sessionScope.module_game.module_id eq mo.module_id}">
                                            selected="selected"

                                        </c:if>
                                        value="${mo.module_id}">
                                    ${mo.module_name} 
                                </option>
                            </c:forEach>
                        </select>
                    </form>
                </div>
                <div class="quiz-label">
                    <label class="quiz-label-name" for="lession">Chọn bài học: </label>
                    <form action="AddImageOfMatchGame"   method="POST">
                        <select class="quiz-label-choice" onchange="this.form.submit()" name="lession">
                            <option  value="-1">-- Chọn Bài --</option>
                            <c:forEach items="${sessionScope.lessonsToAddGame}" var="l">
                                <option "
                                        <c:if test="${sessionScope.lesson.lesson_id eq l.lesson_id}">
                                            selected="selected"

                                        </c:if>
                                        value="${l.lesson_id}">
                                    ${l.lesson_name} 
                                </option>
                            </c:forEach>
                        </select>
                    </form>
                </div>
            </div>
            <div class="change-quiz-bottom">
                <button><a href="./AddImageOfMatchGame" style="text-decoration: none; font-size: 1em; color: white">Tiếp tục</a></button>
            </div>
        </div>

    </body>

</html>

