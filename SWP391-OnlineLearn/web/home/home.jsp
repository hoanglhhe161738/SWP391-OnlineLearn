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
        <link rel="icon" href="../Assets/icon/favicon.png"/>
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
            .banner{
                margin-top: 1em;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .text {
                color: #fff;
                position: absolute;
                text-align: center;
            }
            .part{
                margin: 3em;
                text-align: center;
            }
            .intro-title{
                margin: 2em;
                font-size: 3em;
            }
            .custom-icon{
                font-size: 6em;
            }
            .element-part{
                padding: 1em;
                border: 1px solid #ccc;
                border-radius: 10px;
            }
            .element-title{
                margin: 1em;
            }
            .image-decor{
                display: flex;
                justify-content: center;
                align-items: center;
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
                        <div class="banner">
                            <div class="text">                                
                                <h2 style="top: 30%; font-size: 50px;">SWP391 ONLINE LEARN</h2>
                                <h3 style="top:35%">Học mà chơi, chơi mà học</h3>
                            </div>
                            <img style="width: 90%; border-radius: 10px" src="../Assets/images/bg.jpg" alt="alt"/>
                        </div>
                        <div class="part">
                            <h2 class="intro-title">CÁC TÍNH NĂNG NỔI BẬT</h2>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="element-part">
                                            <i class="custom-icon fa-solid fa-circle-question"></i><br>
                                            <h3 class="element-title">Học với quiz</h3>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="element-part">
                                            <i class="custom-icon fa-solid fa-gamepad"></i>
                                            <h3 class="element-title">Học với game</h3>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="element-part">
                                            <i class="custom-icon fa-sharp fa-solid fa-circle-play"></i>
                                            <h3 class="element-title">Học với video</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="part">
                            <h2 class="intro-title">Tại sao học online lại cần thiết</h2>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p style="text-align: justify; padding: 0 1em; font-size: 1.5em">Trong thời đại công nghệ số ngày nay, học online 
                                            đang trở thành xu hướng phổ biến và được nhiều 
                                            người lựa chọn. Việc học online không chỉ tiết 
                                            kiệm thời gian và chi phí, mà còn giúp cho chúng 
                                            ta có thể học bất cứ lúc nào và ở bất cứ đâu mà 
                                            không bị gián đoạn bởi những rào cản địa lý hay thời gian. 
                                            Ngoài ra, học online còn cung cấp cho chúng ta một phạm vi
                                            kiến thức đa dạng và phong phú từ nhiều nguồn tài liệu khác nhau,
                                            giúp cho chúng ta có thể học tập hiệu quả hơn và nâng cao kiến 
                                            thức của mình. Do đó, học online đang là lựa chọn thông minh 
                                            và đáng để các bạn học sinh, sinh viên và những người muốn 
                                            nâng cao trình độ của mình lựa chọn.</p>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="image-decor">
                                            <div>
                                                <img style="width: 80%" src="../Assets/images/img-decor.png" alt="alt"/>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="part">
                            <h2 class="intro-title">Một số hình ảnh minh họa</h2>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="image-decor">
                                            <div>
                                                <img style="width: 80%" src="../Assets/images/img-decor-2.png" alt="alt"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="image-decor">
                                            <div>
                                                <img style="width: 80%" src="../Assets/images/img-decor-3.png" alt="alt"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="container-fluid my-5">
                                <!-- Footer -->
                                <footer
                                    class="text-center text-lg-start text-dark"
                                    style="background-color: #ECEFF1"
                                    >
                                    <!-- Section: Social media -->
                                    <section
                                        class="d-flex justify-content-between p-4 text-white"
                                        style="background-color: #21D192"
                                        >
                                        <!-- Left -->
                                        <div class="me-5">
                                            <span>Kết nối với chúng tôi thông qua mạng xã hội:</span>
                                        </div>
                                        <!-- Left -->

                                        <!-- Right -->
                                        <div>
                                            <a href="" class="text-white me-4">
                                                <i class="fab fa-facebook-f"></i>
                                            </a>
                                            <a href="" class="text-white me-4">
                                                <i class="fab fa-twitter"></i>
                                            </a>
                                            <a href="" class="text-white me-4">
                                                <i class="fab fa-google"></i>
                                            </a>
                                            <a href="" class="text-white me-4">
                                                <i class="fab fa-instagram"></i>
                                            </a>
                                            <a href="" class="text-white me-4">
                                                <i class="fab fa-linkedin"></i>
                                            </a>
                                            <a href="" class="text-white me-4">
                                                <i class="fab fa-github"></i>
                                            </a>
                                        </div>
                                        <!-- Right -->
                                    </section>
                                    <!-- Section: Social media -->

                                    <!-- Section: Links  -->
                                    <section class="">
                                        <div class="container text-center text-md-start mt-5">
                                            <!-- Grid row -->
                                            <div class="row mt-3">
                                                <!-- Grid column -->
                                                <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                                                    <!-- Content -->
                                                    <h6 class="text-uppercase fw-bold">SWP391 ONLINE LEARN</h6>
                                                    <hr
                                                        class="mb-4 mt-0 d-inline-block mx-auto"
                                                        style="width: 60px; background-color: #7c4dff; height: 2px"
                                                        />
                                                    <p>
                                                        trang web này xây dựng ra để giúp các em học sinh tiểu học
                                                        tự học để trau dồi thêm kiến thức ngoài những giờ học truyền
                                                        thống như trên trường học
                                                    </p>
                                                </div>
                                                <!-- Grid column -->

                                                <!-- Grid column -->
                                                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                                                    <!-- Links -->
                                                    <h6 class="text-uppercase fw-bold">Useful links</h6>
                                                    <hr
                                                        class="mb-4 mt-0 d-inline-block mx-auto"
                                                        style="width: 60px; background-color: #7c4dff; height: 2px"
                                                        />
                                                    <p>
                                                        <a href="#!" class="text-dark">Your Account</a>
                                                    </p>
                                                    <p>
                                                        <a href="#!" class="text-dark">Become an Affiliate</a>
                                                    </p>
                                                    <p>
                                                        <a href="#!" class="text-dark">Shipping Rates</a>
                                                    </p>
                                                    <p>
                                                        <a href="#!" class="text-dark">Help</a>
                                                    </p>
                                                </div>
                                                <!-- Grid column -->

                                                <!-- Grid column -->
                                                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                                                    <!-- Links -->
                                                    <h6 class="text-uppercase fw-bold">LIÊN HỆ</h6>
                                                    <hr
                                                        class="mb-4 mt-0 d-inline-block mx-auto"
                                                        style="width: 60px; background-color: #7c4dff; height: 2px"
                                                        />
                                                    <p><i class="fas fa-home mr-3"></i> Thạch Thất, Hà Nội</p>
                                                    <p><i class="fas fa-envelope mr-3"></i> info@example.com</p>
                                                    <p><i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
                                                    <p><i class="fas fa-print mr-3"></i> + 01 234 567 89</p>
                                                </div>
                                                <!-- Grid column -->
                                            </div>
                                            <!-- Grid row -->
                                        </div>
                                    </section>
                                    <!-- Section: Links  -->

                                    <!-- Copyright -->
                                    <div
                                        class="text-center p-3"
                                        style="background-color: rgba(0, 0, 0, 0.2)"
                                        >
                                        © 2023 Copyright:
                                        <a class="text-dark" style="text-decoration: none" href="https://mdbootstrap.com/"
                                           >SWP391 ONLINE LEARN</a
                                        >
                                    </div>
                                    <!-- Copyright -->
                                </footer>
                                <!-- Footer -->
                            </div>
                        </div>
                    </div>
                    <!--Ae code o day nha-->
                    <!--                    <div class="account" style="border:3px white solid; padding: 1em">
                                            <div><img src="../Assets/icon/icon (4).png" alt=""></div>
                                            <div style="color: #00de7a;">
                                                <li style="color: white; list-style: none;">${sessionScope.user.full_name}</li>
                                            <li style="color: white; list-style: none;">ID: ${sessionScope.user.user_id}</li>
                                        </div>
                                    </div>-->

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
