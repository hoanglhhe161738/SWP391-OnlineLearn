<%-- 
    Document   : addQuiz.jsp
    Created on : Mar 8, 2023, 3:45:44 PM
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
            table{
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
                border: 2px solid #e1b7c5;
            }
            .custom-icon{
                font-size: 1.25em;
                padding: 0.25em;
                color: #4472c4;
            }
        </style>
        <title>Quiz</title>
        <title>Add quiz</title>
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
                        <li class="nav-information-text-content-item">Khang chi be</li>
                        <li class="nav-information-text-content-item">Admin</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="statis-quiz container-fluid" style="height: 100%; margin-top: 2em;">
            <div class="static-quiz-left">
                <div class="text">
                    <p>Đang thêm câu hỏi cho</p>
                </div>
                <div class="input-quiz">
                    <input type="text" value="Lớp ${sessionScope.class_id}">
                    <input type="text" value="${sessionScope.course.course_name} lớp ${sessionScope.class_id}">
                    <input type="text" value="${sessionScope.module.module_name}">
                    <input type="text" value="${sessionScope.lesson.lesson_name}">
                </div>
                <div class="statis-quiz-text">
                    <p>Số câu hỏi hiện có: ${sessionScope.questionSize}</p>
                </div>
                <div class="table-quiz">
                    <table style="width: 28em;">
                        <thead>
                        <td style="background-color: #4472c4;width: 4em;">Số câu</td>
                        <td colspan="2" style="background-color: #4472c4; width: 5em;">Hành động</td>

                        </thead>
                        <tbody style="height: 11em;">
                            <c:forEach items="${sessionScope.questions}" var="q">
                            <tr style="background-color: #cfd5ea;">
                                <td>${q.index}</td>
                                <td>
                                    <a href="#">
                                        <i class="fa-solid fa-pen-to-square custom-icon"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="#">
                                        <i class="fa-solid fa-trash custom-icon"></i>
                                    </a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div style="margin-top: 2em;"><button
                        style="width: 100%; color: #f2f2f2; font-size: large; background-color: #00de7a; padding: 0.5em 0 0.5em 0;border: white;">Thêm
                        câu hỏi</button></div>
            </div>

            <div class="static-quiz-right">
                <div style="padding-left: 1em;">
                    <h3>Câu 7</h3>
                </div>
                <div style="padding-left: 1em;">
                    <p>Tiêu đề câu hỏi</p>
                </div>
                <div><input type="text" style="height: 8em; width: 100%; border: 2px solid #e1b7c5;"></div>
                <div class="list-answer" style="width: 100%;">
                    <ul style="padding-left: 20px;">
                        <li class="list-item">
                            <label for="answer1">Đáp án thứ nhất:</label>
                            <input type="text">
                        </li>
                        <li class="list-item">
                            <label for="answer1">Đáp án thứ hai:</label>
                            <input type="text">
                        </li>
                        <li class="list-item">
                            <label for="answer1">Đáp án thứ ba:</label>
                            <input type="text">
                        </li>
                        <li class="list-item">
                            <label for="answer1">Đáp án thứ tư:</label>
                            <input type="text">
                        </li>
                        <li class="list-item">
                            <label for="answer1">Đáp án đúng:</label>
                            <select style="border: 2px solid #e1b7c5;">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </li>
                    </ul>
                </div>
                <div style="padding: 2em 0 0 70%;"><button style="width: 10em; height: 2em; background-color: #00de7a; color: #fff;
                                                           border: none; font-size: large; font-weight: bold; border-radius: 10px;">Hoàn tất</button></div>
            </div>
        </div>
    </body>

</html>