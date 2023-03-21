<%-- 
    Document   : addMatchGame
    Created on : Mar 10, 2023, 9:48:41 PM
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
                padding: 0 0.5em;
                border: 1px solid #000000;
            }
            .custom-icon{
                font-size: 1.25em;
                padding: 0.25em;
                color: #4472c4;
            }
        </style>
        <title>Match Game</title>
        <title>Add images</title>
    </head>

    <body>
        <jsp:include page="../custom/navForAdmin.jsp"></jsp:include>

        <div class="statis-quiz container-fluid" style="height: 100%; margin-top: 2em;">
            <div class="static-quiz-left">
                <div class="text">
                    <p>Thêm/Sửa cặp ảnh cho game</p><span style="color: red">Tối đa 8 cặp ảnh</span>
                </div>
                <div class="input-quiz">
                    <input type="text" value="Lớp ${sessionScope.class_id_game}">
                    <input type="text" value="${sessionScope.course_game.course_name} lớp ${sessionScope.class_id_game}">
                    <input type="text" value="${sessionScope.module_game.module_name}">
                    <input type="text" value="${sessionScope.lesson.lesson_name}">
                </div>
                <div class="statis-quiz-text">
                    <p>Số cặp ảnh hiện có: ${sessionScope.numberofpairs}</p>
                </div>
                <div class="table-quiz">
                    <table style="width: 28em;">
                        <thead>
                        <td style="background-color: #4472c4;width: 4em;">Số cặp ảnh</td>
                        <td colspan="2" style="background-color: #4472c4; width: 5em;">Hành động</td>

                        </thead>
                        <tbody style="height: 11em;">
                            <c:forEach items="${sessionScope.image_pairs}" var="i" >
                                <tr style="background-color: #cfd5ea;">
                                    <td>${i.index}</td>
                                    <td>
                                        <a href="./actionMatchGame?action=edit&index=${i.index}&match_game_id=${i.match_game_id}">
                                            <i class="fa-solid fa-pen-to-square custom-icon"></i>
                                        </a>
                                    </td>
                                    
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div style="margin-top: 2em;">
                    <c:if test="${sessionScope.numberofpairs < 8}">
                    <a href="./actionMatchGame?action=add&index=-1&match_game_id=-1">
                        <button
                            style="width: 100%; color: #f2f2f2; font-size: large; background-color: #00de7a; padding: 0.5em 0 0.5em 0;border: white;">Thêm
                            cặp ảnh</button>
                    </a>
                    </c:if>
                    
                    <a href="./ChoiceClassToAddGameImage">
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

            <c:if test="${(requestScope.action ne sessionScope.add) 
                          or (requestScope.action ne sessionScope.edit)
                          }">
            </c:if>
           
            <c:if test="${requestScope.action eq sessionScope.add}">
                <div class="static-quiz-right">
                    <form action="actionMatchGame" id="form1" method="POST">
                        <input hidden name="action" value="add">
                        <div style="padding-left: 1em;">
                            <h3>Cặp ${sessionScope.numberofpairs+1}</h3>
                            <input hidden name="indexAdd" value="${sessionScope.numberofpairs+1}">
                        </div>
                        
                        
                        <div class="list-answer" style="width: 100%;">
                            <ul style="padding-left: 20px;">
                                <li class="list-item">
                                    <label for="answer1">Tên ảnh 1</label>
                                    <input type="text" name="img_name" id="option1Input">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">Link ảnh 1</label>
                                    <input type="text" name="img_url" id="option2Input">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">Tên ảnh 2</label>
                                    <input type="text" name="ans_img_name" id="option3Input">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">Link ảnh 2</label>
                                    <input type="text" name="ans_img_url" id="option4Input">
                                </li>
                                
                                   
                            </ul>
                        </div>
                        <div style="padding: 2em 0 0 70%;">
                            <input style="width: 10em; height: 2em; background-color: #00de7a; color: #fff;border: none; font-size: large; font-weight: bold; border-radius: 10px;" type="submit" value="Hoàn tất">
                        </div>
                        
                    </form>
                </div>
            </c:if> 
            <c:if test="${requestScope.action eq sessionScope.edit}">
                <div class="static-quiz-right">
                    <form action="actionMatchGame" id="form1" method="POST">
                        <input hidden name="action" value="edit">
                        <div style="padding-left: 1em;">
                            <h3>Cặp ${requestScope.index}</h3>
                            <input hidden name="index" value="${requestScope.index}">
                        </div>
                        
                        <div>
                            <input hidden name="match_game_id" value="${requestScope.pair.match_game_id}">
                            <input hidden name="img_id" value="${requestScope.img.img_id}">
                            <input hidden name="ans_img_id" value="${requestScope.ans_img.ans_img_id}">
                        </div>
                        <div class="list-answer" style="width: 100%;">
                            <ul style="padding-left: 20px;">
                                <li class="list-item">
                                    <label for="answer1">Tên ảnh 1:</label>
                                    <input type="text" name="img_name" value="${requestScope.img.img_name}">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">Link ảnh 1</label>
                                    <input type="text" name="img_url" value="${requestScope.img.img_url}"><br>
                                    <img src="${requestScope.img.img_url}" alt="${requestScope.img.img_url}" width="200px" height="150px">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">Tên ảnh 2</label>
                                    <input type="text" name="ans_img_name" value="${requestScope.ans_img.ans_img_name}">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">Link ảnh 2</label>
                                    <input type="text" name="ans_img_url" value="${requestScope.ans_img.ans_img_url}"><br>
                                    <img src="${requestScope.ans_img.ans_img_url}" alt="${requestScope.ans_img.ans_img_name}" width="200px" height="150px">
                                </li>
                               
                            </ul>
                        </div>
                        <div style="padding: 2em 0 0 70%;">
                            <input style="width: 10em; height: 2em; background-color: #00de7a; color: #fff;border: none; font-size: large; font-weight: bold; border-radius: 10px;" type="submit" value="Hoàn tất">
                        </div>
                    </form>
                </div>
            </c:if> 
                
           
        </div>
    </body>

</html>