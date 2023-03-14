<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modules of course</title>
    <link rel="stylesheet" href="../Assets/css/Style.css">
    <link rel="stylesheet" href="../Assets/css/course.css">
    <link rel="icon" href="../Assets/icon/favicon.png"/>
    <!-- link bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>

<body>
    <div class="main">
        <!--nav bar-->
        <jsp:include page="../custom/nav.jsp"></jsp:include>
            <!--content-->
            <div class="content">
                <div class="container main-content">
                    <div class="row">
                        <div>
                            <div class="col-m-12 item-course">                       
                                <h1>${requestScope.course.course_name} lớp ${requestScope.class_id}</h1>
                            <p style="font-size: 18px; font-weight: bold">Khổ luyện thành tài, miệt mài mới giỏi. 
                                Hãy kiên trì và nỗ lực các bạn nhé, thành quả sẽ đến ngay thôi</p>                      

                            <div class="col-m-12">
                                <div class="process-module" style="margin: 2rem 0">
                                    <div class="progress-bar-bg">
                                        <div class="progress-bar-custom" style="width:${requestScope.percent}%;">
                                            <p>${requestScope.percent}%</p>
                                        </div>	
                                    </div>
                                </div>
                            </div>
                            <c:if test="${requestScope.unregistered eq 1}">
                                <form action="modules" method="POST">
                                        <input hidden name="user_id" value="${sessionScope.user.user_id}">
                                        <input hidden name="class_id" value="${requestScope.class_id}">
                                        <input hidden name="course_id" value="${requestScope.course.course_id}">
                                        <button type="submit" style="font-weight: bold" class="btn btn-light">Đăng kí học phần</button>           
                                </form> 
                            </c:if>
                            <c:if test="${requestScope.unregistered eq 0}">
                                <button type="button" style="font-weight: bold" class="btn btn-light">Học phần đã được đăng ký</button> 
                            </c:if>
                        </div>
                        <div class="col-md-12 module">
                            <% int i = 1;%>
                            <ul class="module-items">   
                                <c:forEach items="${requestScope.modules}" var="m">
                                    <c:if test="${m.status}">
                                        <li class="module-item-type1">
                                        </c:if>
                                        <c:if test="${!m.status}">
                                        <li class="module-item-type2">
                                        </c:if>
                                        <a href="./module?module_id=${m.module_id}">
                                            Chương <%=i%>
                                        </a>
                                    </li>
                                    <%i++;%>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>

</html>