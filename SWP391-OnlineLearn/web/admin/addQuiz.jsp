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
                padding: 0 0.5em;
                border: 1px solid #000000;
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
        <jsp:include page="../custom/navForAdmin.jsp"></jsp:include>

        <div class="statis-quiz container-fluid" style="height: 100%; margin-top: 2em;">
            <div class="static-quiz-left">
                <div class="text">
                    <p>??ang th??m c??u ho??i cho</p>
                </div>
                <div class="input-quiz">
                    <input type="text" value="L????p ${sessionScope.class_id}">
                    <input type="text" value="${sessionScope.course.course_name} l????p ${sessionScope.class_id}">
                    <input type="text" value="${sessionScope.module.module_name}">
                    <input type="text" value="${sessionScope.lesson.lesson_name}">
                </div>
                <div class="statis-quiz-text">
                    <p>S???? c??u ho??i hi????n co??: ${sessionScope.questionSize}</p>
                </div>
                <div class="table-quiz">
                    <table style="width: 28em;">
                        <thead>
                        <td style="background-color: #4472c4;width: 4em;">S???? c??u</td>
                        <td colspan="2" style="background-color: #4472c4; width: 5em;">Ha??nh ??????ng</td>

                        </thead>
                        <tbody style="height: 11em;">
                            <c:forEach items="${sessionScope.questions}" var="q">
                                <tr style="background-color: #cfd5ea;">
                                    <td>${q.index}</td>
                                    <td>
                                        <a href="./actionQuiz?action=edit&index=${q.index}&question_id=${q.question_id}">
                                            <i class="fa-solid fa-pen-to-square custom-icon"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="./actionQuiz?action=delete&index=${q.index}&question_id=${q.question_id}">
                                            <i class="fa-solid fa-trash custom-icon"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div style="margin-top: 2em;">
                    <a href="./actionQuiz?action=add&index=-1&question_id=-1">
                        <button
                            style="width: 100%; color: #f2f2f2; font-size: large; background-color: #00de7a; padding: 0.5em 0 0.5em 0;border: white;">Th??m
                            c??u ho??i</button>
                    </a>
                    <a href="./choiceClassToAddQuiz">
                        <button
                            style="width: 100%; color: #f2f2f2; margin-top: 1em; font-size: large; background-color: red; padding: 0.5em 0 0.5em 0;border: white;">
                            Tr??? l???i trang ch???n b??i h???c</button>
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
                          or (requestScope.action ne sessionScope.delete)}">

            </c:if>
            <c:if test="${requestScope.action eq sessionScope.delete}">
                <div class="static-quiz-right">
                    <input hidden name="action" value="edit">
                    <div style="padding-left: 1em;">
                        <h3>C??u ${requestScope.index}</h3>
                        <input hidden name="index" value="${requestScope.index}">
                    </div>
                    <div style="padding-left: 1em;">
                        <p>Ti??u ?????? c??u ho??i</p>
                    </div>
                    <div>
                        <input hidden name="question_id" value="${requestScope.question.question_id}">
                        <textarea disabled name="question" id="textareaEdit" style="height: 8em; width: 100%; border: 1px solid #000000;">${requestScope.question.question}
                        </textarea>
                        <script>
                            var textare0a = document.getElementById("textareaEdit");
                            textarea.value = "${requestScope.question.question}";

                        </script>
                    </div>
                    <div class="list-answer" style="width: 100%;">
                        <ul style="padding-left: 20px;">
                            <li class="list-item">
                                <label for="answer1">??a??p a??n th???? nh????t:</label>
                                <input type="text" name="option1" disabled value="${requestScope.question.option1}">
                            </li>
                            <li class="list-item">
                                <label for="answer1">??a??p a??n th???? hai:</label>
                                <input type="text" name="option2" disabled value="${requestScope.question.option2}">
                            </li>
                            <li class="list-item">
                                <label for="answer1">??a??p a??n th???? ba:</label>
                                <input type="text" name="option3" disabled value="${requestScope.question.option3}">
                            </li>
                            <li class="list-item">
                                <label for="answer1">??a??p a??n th???? t??:</label>
                                <input type="text" name="option4" disabled value="${requestScope.question.option4}">
                            </li>
                            <li class="list-item">
                                <label for="answer1">??a??p a??n ??u??ng:</label>
                                <select style="border: 1px solid #000000;" name="trueAnswer" disabled>
                                    <option value="${requestScope.question.option1}">??a??p a??n 1</option>
                                    <option value="${requestScope.question.option2}">??a??p a??n 2</option>
                                    <option value="${requestScope.question.option3}">??a??p a??n 3</option>
                                    <option value="${requestScope.question.option4}">??a??p a??n 4</option>
                                </select>
                            </li>
                        </ul>
                    </div>
                    <div style="padding: 2em 0 0 70%;">        
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            X??c nh???n v?? x??a
                        </button>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel" style="align-items: center">
                                        <i class="fa-solid fa-triangle-exclamation custom-icon" style="color: orange"></i>
                                        C???nh b??o t??? h??? th???ng
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div style="font-size: 20px;">Sau khi b???n b???m n??t x??a, c??u h???i n??y s??? kh??ng th??? kh??i ph???c l???i</div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <form action="actionQuiz" method="POST">
                                        <input hidden name="action" value="delete">
                                        <input hidden name="question_id" value="${requestScope.question.question_id}">
                                        <input type="submit" class="btn btn-primary" value="X??c nh???n">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${requestScope.action eq sessionScope.add}">
                <div class="static-quiz-right">
                    <form action="actionQuiz" id="form1" method="POST">
                        <input hidden name="action" value="add">
                        <div style="padding-left: 1em;">
                            <h3>C??u ${sessionScope.questionSize+1}</h3>
                            <input hidden name="indexAdd" value="${sessionScope.questionSize+1}">
                        </div>
                        <div style="padding-left: 1em;">
                            <p>Ti??u ?????? c??u ho??i</p>
                        </div>
                        <div>
                            <textarea name="question" style="height: 8em; width: 100%; border: 2px solid #000000;"></textarea>
                        </div>
                        <div class="list-answer" style="width: 100%;">
                            <ul style="padding-left: 20px;">
                                <li class="list-item">
                                    <label for="answer1">??a??p a??n th???? nh????t:</label>
                                    <input type="text" name="option1" id="option1Input">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">??a??p a??n th???? hai:</label>
                                    <input type="text" name="option2" id="option2Input">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">??a??p a??n th???? ba:</label>
                                    <input type="text" name="option3" id="option3Input">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">??a??p a??n th???? t??:</label>
                                    <input type="text" name="option4" id="option4Input">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">??a??p a??n ??u??ng:</label>
                                    <select name="trueAnswer" style="border: 1px solid #000000;">
                                        <option value="" id="option1Add">??a??p a??n th???? nh????t</option>
                                        <option value="" id="option2Add">??a??p a??n th???? hai</option>
                                        <option value="" id="option3Add">??a??p a??n th???? ba</option>
                                        <option value="" id="option4Add">??a??p a??n th???? t??</option>
                                    </select>
                                    <script>
                                        var option1Add = document.getElementById("option1Add");
                                        var option1Input = document.getElementById("option1Input");
                                        var option2Add = document.getElementById("option2Add");
                                        var option2Input = document.getElementById("option2Input");
                                        var option3Add = document.getElementById("option3Add");
                                        var option3Input = document.getElementById("option3Input");
                                        var option4Add = document.getElementById("option4Add");
                                        var option4Input = document.getElementById("option4Input");

                                        option1Input.addEventListener("input", function () {
                                            option1Add.value = option1Input.value;
                                        });
                                        option2Input.addEventListener("input", function () {
                                            option2Add.value = option2Input.value;
                                        });
                                        option3Input.addEventListener("input", function () {
                                            option3Add.value = option3Input.value;
                                        });
                                        option4Input.addEventListener("input", function () {
                                            option4Add.value = option4Input.value;
                                        });
                                    </script>
                                </li>
                            </ul>
                        </div>
                        <div style="padding: 2em 0 0 70%;">
                            <input style="width: 10em; height: 2em; background-color: #00de7a; color: #fff;border: none; font-size: large; font-weight: bold; border-radius: 10px;" type="submit" value="Hoa??n t????t">
                        </div>
                    </form>
                </div>
            </c:if> 
            <c:if test="${requestScope.action eq sessionScope.edit}">
                <div class="static-quiz-right">
                    <form action="actionQuiz" id="form1" method="POST">
                        <input hidden name="action" value="edit">
                        <div style="padding-left: 1em;">
                            <h3>C??u ${requestScope.index}</h3>
                            <input hidden name="index" value="${requestScope.index}">
                        </div>
                        <div style="padding-left: 1em;">
                            <p>Ti??u ?????? c??u ho??i</p>
                        </div>
                        <div>
                            <input hidden name="question_id" value="${requestScope.question.question_id}">
                            <textarea name="question" id="textareaEdit" style="height: 8em; width: 100%; border: 1px solid #000000;">${requestScope.question.question}
                            </textarea>
                            <script>
                                var textare0a = document.getElementById("textareaEdit");
                                textarea.value = "${requestScope.question.question}";

                            </script>
                        </div>
                        <div class="list-answer" style="width: 100%;">
                            <ul style="padding-left: 20px;">
                                <li class="list-item">
                                    <label for="answer1">??a??p a??n th???? nh????t:</label>
                                    <input type="text" name="option1" value="${requestScope.question.option1}">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">??a??p a??n th???? hai:</label>
                                    <input type="text" name="option2" value="${requestScope.question.option2}">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">??a??p a??n th???? ba:</label>
                                    <input type="text" name="option3" value="${requestScope.question.option3}">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">??a??p a??n th???? t??:</label>
                                    <input type="text" name="option4" value="${requestScope.question.option4}">
                                </li>
                                <li class="list-item">
                                    <label for="answer1">??a??p a??n ??u??ng:</label>
                                    <select style="border: 1px solid #000000;" name="trueAnswer">
                                        <option value="${requestScope.question.option1}">??a??p a??n 1</option>
                                        <option value="${requestScope.question.option2}">??a??p a??n 2</option>
                                        <option value="${requestScope.question.option3}">??a??p a??n 3</option>
                                        <option value="${requestScope.question.option4}">??a??p a??n 4</option>
                                    </select>
                                </li>
                            </ul>
                        </div>
                        <div style="padding: 2em 0 0 70%;">
                            <input style="width: 10em; height: 2em; background-color: #00de7a; color: #fff;border: none; font-size: large; font-weight: bold; border-radius: 10px;" type="submit" value="Hoa??n t????t">
                        </div>
                    </form>
                </div>
            </c:if> 
        </div>
    </body>

</html>