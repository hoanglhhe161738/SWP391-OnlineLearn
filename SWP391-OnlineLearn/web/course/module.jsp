<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Module</title>
    <link rel="stylesheet" href="../Assets/css/Style.css">
    <link rel="stylesheet" href="../Assets/css/course.css">
    <link rel="icon" href="../Assets/icon/favicon.png"/>
    <!-- link bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

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
                                <h1>${requestScope.module.module_name}</h1>                  
                            <div class="col-m-12">
                                <div class="process-module" style="margin: 2rem">
                                    <div class="progress-bar-bg" style="margin-left: -2em;">
                                        <div class="progress-bar-custom" style="width:${requestScope.percent}%;">
                                            <p>${requestScope.percent}%</p>
                                        </div>	
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="lesson-items " style="margin-left: 0">
                            <c:forEach items="${requestScope.lessons}" var="l">
                                <div class="lesson-item" style="line-height: 1.6em;">
                                    <c:if test="${l.status eq true}">
                                        <img src="../Assets/icon/icon (74).png" height="30px" width="30px">
                                    </c:if>
                                    <c:if test="${l.status ne true}">
                                        <img src="../Assets/icon/icon (75).png" height="30px" width="30px">
                                    </c:if>
                                    <a href="./lessonChoice?lesson_id=${l.lesson_id}" style="padding: 1em;">${l.lesson_name}</a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</body>

</html>