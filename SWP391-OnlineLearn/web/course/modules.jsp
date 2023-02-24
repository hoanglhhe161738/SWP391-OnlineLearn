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
    <!-- link bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
    <div class="main">
<<<<<<< HEAD
        <div class="nav">
            <div class="nav-bar">
                <ul class="items">
                    <li class="item">
                        <a href="../home/homePage"><img src="../Assets/icon/icon (69).png"></a>
                    </li>
                    <li class="item">
                        <a href="#"><img src="../Assets/icon/icon (44).png"></a>
                    </li>
                    <li class="item">
                        <a href="./classes"><img src="../Assets/icon/icon (71).png"></a>
                    </li>
                    <li class="item">
                        <a href="../payment/CompletePayment.jsp"><img src="../Assets/icon/icon (51).png"></a>
                    </li>
                    <li class="item">
                        <a href="#"><img src="../Assets/icon/icon (45).png"></a>
                    </li>
                    <li class="item avt-btn">
                        <a href="#"><img src="../Assets/icon/icon (4).png">
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="content">
            <div class="container main-content">
                <div class="row">
                    <div>
                        <div class="col-m-12 item-course">                       
                            <h1>${requestScope.course.course_name} lớp ${requestScope.class_id}</h1>
=======
        <!--nav bar-->
        <jsp:include page="../custom/nav.jsp"></jsp:include>
            <!--content-->
            <div class="content">
                <div class="container main-content">
                    <div class="row">
                        <div>
                            <div class="col-m-12 item-course">                       
                                <h1>${requestScope.course.course_name} lớp ${requestScope.class_id}</h1>
>>>>>>> main
                            <p style="font-size: 18px; font-weight: bold">Khổ luyện thành tài, miệt mài mới giỏi. 
                                Hãy kiên trì và nỗ lực các bạn nhé, thành quả sẽ đến ngay thôi</p>                      
                        </div>
                        <div class="col-m-12">
                            <div class="process-module">
                                <div class="progress-bar-bg">
                                    <div class="progress-bar-custom" style="width:${requestScope.percent}%;">
                                        <p>${requestScope.percent}%</p>
                                    </div>	
                                </div>
                            </div>
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