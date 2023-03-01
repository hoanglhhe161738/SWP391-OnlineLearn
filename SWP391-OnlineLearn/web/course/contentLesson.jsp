<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Các lựa chọn</title>
    <link rel="stylesheet" href="../Assets/css/Style.css">
    <link rel="stylesheet" href="../Assets/css/course.css">
    <!-- link bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .content{
            background-image: none;
        }
    </style>
</head>

<body>
    <div class="main">
        <!--nav bar-->
        <jsp:include page="../custom/nav.jsp"></jsp:include>
            <!--content-->
            <div class="content">                
                <div>
                    <h2>${requestScope.contentTitle}</h2>
                </div>
                <div>
                ${requestScope.content}
                </div>
            </div>
    </div>
</body>

</html>