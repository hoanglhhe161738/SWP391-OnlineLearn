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
        <!-- link bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <div class="main">
            <!--nav bar-->
            <jsp:include page="../custom/nav.jsp"></jsp:include>
                <!--content-->
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                        <c:forEach items="${requestScope.courses}" var="co">
                            <div class="item-course col-md-5" style="margin: 1em 3.5em">
                                <h1>${co.course_name} lớp ${requestScope.class_id}</h1>
                                <p>Chương trình của môn ${co.course_name} lớp ${requestScope.class_id} trong course này được biên soạn dựa theo sách giáo khoa
                                    của nhà xuất bản Cánh Diều, chúc các bạn có 1 trải nghiệm học tập thật là bổ ích!</p>
                                <a href="./modules?course_id=${co.course_id}&class_id=${requestScope.class_id}">
                                    <button class="go-to-course-btn">
                                        Học ngay
                                    </button>
                                </a>
                            </div>
                        </c:forEach>                   
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
