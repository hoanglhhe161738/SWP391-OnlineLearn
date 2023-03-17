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
    <link rel="icon" href="../Assets/icon/favicon.png"/>
    <!-- link bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        .content{
            background-image: none;
        }
        .reading_content{
            max-width: 60%;
            text-align: justify;
            font-size: 18px;
            margin: 3em auto;
            /*justify-content: center;*/
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
            <c:if test="${requestScope.content.reading_content eq null}">
                <div class="reading_content">
                    <h2 style="text-align: center; margin-bottom: 1em;">Học phần này không có lý thuyết</h2>
                </div>
            </c:if>
            <c:if test="${requestScope.content.reading_content ne null}">                
                <div class="reading_content">
                    <h2 style="text-align: center; margin-bottom: 1em;">Tiêu đề lý thuyết</h2>
                    ${requestScope.content.reading_content}
                </div>
            </c:if>
        </div>
    </div>
</body>

</html>