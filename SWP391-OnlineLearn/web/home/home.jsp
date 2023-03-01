<%-- 
    Document   : home
    Created on : Mar 2, 2023, 12:04:32 AM
    Author     : Khangnekk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <link rel="stylesheet" href="../Assets/css/Style.css">
        <link rel="stylesheet" href="../Assets/css/popup.css">
        <!-- link bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
        <style>
            .close:hover {
                color: white;
            }

            .content {
                background-image: url('../Assets/images/bgNoBlur.png');
            }
            .account{
                height: auto;
                font-weight: bold;
            }
        </style>
    </head>

    <body>
        <div class="main">
            <!--nav bar-->
            <jsp:include page="../custom/nav.jsp"></jsp:include>
                <!--content-->

                <div class="content">
                    <!--Ae code o day nha-->
                    <div class="account" style="border:3px white solid; padding: 1em">
                        <div><img src="../Assets/icon/icon (4).png" alt=""></div>
                        <div style="color: #00de7a;">
                            <li style="color: white; list-style: none;">${sessionScope.user.full_name}</li>
                        <li style="color: white; list-style: none;">ID: ${sessionScope.user.user_id}</li>
                    </div>
                </div>
            </div>
        </div>
        <div id="xmas-popup" class="popup" href="#">
            <div class="popup-content" style="background-color: #00de7a; border-radius: 9px;height: 317px;">
                <div class="content1" style="margin-top: 1px;">
                    <h2 style="font-weight: bolder;">Thông báo</h2>
                </div>
                <div style="height: 258px; background-color: white; margin: 2px 5px 0 5px; border-radius: 8px">
                    <div class="content2">
                        Trang web được thiệt kế để sự dụng trên các màn hình có kích thước lớn, chúng tôi
                        khuyên bạn nên sử dụng các màn hình có kích thước từ 15 inch trở lên để có trải
                        nghiệm tốt nhất.
                    </div>
                    <div class="content3">
                        <img style="width: 70px;" src="../Assets/icon/icon (77).png" alt="">
                        <img src="../Assets/icon/icon (76).png" alt="">
                        <img src="../Assets/icon/icon (78).png" alt="">
                    </div>
                    <a href="#xmas-popup" class="close">
                        <p style="margin: 2px 0 0 0 ;">Đã Hiểu!</p>
                    </a>
                </div>
            </div>
        </div>
    </body>

</html>
