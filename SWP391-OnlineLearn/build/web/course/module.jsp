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
                        <a href="./classes"><img src="../Assets/icon/icon (71).png"></a>
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
            <div class="container main-content">
                <div class="row">
                    <div>
                        <div class="col-md-12 module-item-type1 module-title">
                            <a style="cursor: pointer">${requestScope.module.module_name}</a>
                            <div class="process-module" style="float: left">
                                <div class="progress-bar-bg">
                                    <div class="progress-bar-custom" style="width:60%;">
                                        <p>60%</p>
                                    </div>	
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="lesion-items" >
                            <c:forEach items="${requestScope.lessions}" var="l">
                                <div class="lession-item">
                                    <img src="../Assets/icon/icon (74).png" height="30px" width="30px">
                                    <a href="#" style="padding: 1em;">${l.lession_name}</a>
                                </div>
                            </c:forEach>
                            <!--                            <div class="lession-item">
                                                            <img src="../Assets/icon/icon (74).png" height="30px" width="30px">
                                                            <a href="#">Lession 2: Chỗ này sẽ là cái tiêu đề của lession</a>
                                                        </div>
                                                        <div class="lession-item">
                                                            <img src="../Assets/icon/icon (74).png" height="30px" width="30px">
                                                            <a href="#">Lession 3: Chỗ này sẽ là cái tiêu đề của lession</a>
                                                        </div>
                                                        <div class="lession-item">
                                                            <img src="../Assets/icon/icon (75).png" height="30px" width="30px">
                                                            <a href="#">Lession 4: Chỗ này sẽ là cái tiêu đề của lession</a>
                                                        </div>
                                                        <div class="lession-item">
                                                            <img src="../Assets/icon/icon (75).png" height="30px" width="30px">
                                                            <a href="#">Lession 5: Chỗ này sẽ là cái tiêu đề của lession</a>
                                                        </div>-->
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</body>

</html>