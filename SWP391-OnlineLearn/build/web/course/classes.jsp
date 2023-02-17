<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>--> 
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Các lớp học</title>
    <link rel="stylesheet" href="../Assets/css/Style.css">
    <link rel="stylesheet" href="../Assets/css/course.css">
    <!-- link bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
    <div class="main">
        <div class="nav">
            <div class="nav-bar">
                <ul class="items">
                    <li class="item">
                        <a href="#"><img src="../Assets/icon/icon (69).png"></a>
                    </li>
                    <li class="item">
                        <a href="#"><img src="../Assets/icon/icon (44).png"></a>
                    </li>
                    <li class="item">
                        <a href="#"><img src="../Assets/icon/icon (71).png"></a>
                    </li>
                    <li class="item">
                        <a href="#"><img src="../Assets/icon/icon (51).png"></a>
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
            <div class="container-fluid">
                <ul class="row items-class">
                    <c:forEach items="${requestScope.classes}" var="cl">
                        <li class="col-md-3 item-class">
                            <a href="./class_course?class_id=${cl.class_id}">${cl.class_name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>

        </div>
    </div>
</body>

</html>