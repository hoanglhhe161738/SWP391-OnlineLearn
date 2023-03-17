<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <%-- 
    Document   : course
    Created on : Feb 1, 2023, 12:06:56 AM
    Author     : Khangnekk
--%> -->

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Các khóa học</title>
        <link rel="stylesheet" href="../Assets/css/Style.css">
        <link rel="stylesheet" href="../Assets/css/course.css">
        <link rel="icon" href="../Assets/icon/favicon.png"/>
        <!-- link bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
            crossorigin="anonymous"></script>
        <style>
            .course-items{
                width: 100%;
                justify-content: center;
                position: fixed;
                left: 50%;
                top: 50%;
                transform: translateX(-50%) translateY(-50%);
            }
            .course-item{
                position: relative;
                border-radius: 8px;
                width: 16em;
                height: 20em;
                margin: 1em 4em;
                background-size: cover;
                padding: 0;
                transition: all ease-in 0.3s;
            }
            .course-item:hover{
                transform: scale(1.2);
            }
            .course-title{
                position: absolute;
                text-align: center;
                width: 16em;
                height: 6em;
                bottom: 0;
                padding: 0.5em;
                border-radius: 0 25px 8px 8px;
            }
            .title-item{
                font-size: 25px;
                font-weight: bold;
                text-decoration: none;
                color: white;
            }
            .title-item:hover{
                color: white;
            }
            .course-item button{
                border: none;
                width: 8em;
                height: 2em;
                border-radius: 6px;
                background: white;
                font-weight: bold;
                font-size: 18px;
                color: black;
                margin-top: 5px;
            }
            .content{
                position: fixed;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <!--nav bar-->
            <jsp:include page="../custom/nav.jsp"></jsp:include>
                <!--content-->
                <div class="content"></div>
                    <div class="container-fluid">
                        <div class="course-items row">
                        <c:forEach items="${requestScope.courses}" var="co">
                            <c:if test="${co.course_name eq requestScope.math}">
                                <div class="course-item col-md-4" style=" background-image: url(../Assets/images/math.jpg);">
                            </c:if>
                            <c:if test="${co.course_name eq requestScope.literature}">
                                <div class="course-item col-md-4" style=" background-image: url(../Assets/images/lit.png);">
                            </c:if>
                            <c:if test="${co.course_name eq requestScope.english}">
                                <div class="course-item col-md-4" style=" background-image: url(../Assets/images/eng.jpg);">
                            </c:if>
                                    <div class="course-title"
                                    <c:if test="${co.course_name eq requestScope.math}">
                                        style="background: #00b050"
                                    </c:if>
                                    <c:if test="${co.course_name eq requestScope.literature}">
                                        style="background: #3f47cc"
                                    </c:if>
                                    <c:if test="${co.course_name eq requestScope.english}">
                                        style="background: #ff7f27"
                                    </c:if>     
                                    >
                                        <a class="title-item">Lớp ${requestScope.class_id}</a><br>
                                        <a href="./modules?course_id=${co.course_id}&class_id=${requestScope.class_id}"><button>${co.course_name}</button></a>
                                    </div>
                                </div>
                        </c:forEach>                   
                        </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
