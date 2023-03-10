<%-- 
    Document   : home
    Created on : Mar 2, 2023, 12:04:32 AM
    Author     : Khangnekk
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" 
              integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.js"></script><!-- comment -->
        <link href="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.css" rel="stylesheet">
        <style>
            .close:hover {
                color: white;
            }

            .content {
                background-image: none;
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
                color: white;
            }
            .element-title{
                margin: 1em;
            }
            .image-decor{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .image-decor img{
                width: 80%;
                margin: 1em;
                border-radius: 9px;
            }
            .signup-login:hover{
                transform: scale(1.15);
                transition: all ease 0.5s;
            }
            .signup-login{
                transition: all ease 0.5s;
                margin: 1em;
                font-weight: bold;
            }
            .signup-login a{
                text-decoration: none;
                border-radius: 40px;
                font-size: 1.25em;
                border: 2px solid white;
                background: #00de7a;
                padding: 0.25em 1em;
                color: #ECEFF1;
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
                                <h3 style="top:35%">H???c m?? ch??i, ch??i m?? h???c</h3>
                            <c:if test="${sessionScope.account eq null}">
                                <div style="margin-top: 1em">
                                    <span class="signup-login" style="margin-top: 1em">
                                        <a href="../login/loginUser">????ng nh???p   </a>
                                    </span>
                                    <span class="signup-login" style="margin-top: 1em">
                                        <a href="../signup/signupUser">????ng k?? ngay</a>
                                    </span>
                                </div>
                            </c:if>
                        </div>
                        <img style="width: 90%; border-radius: 10px" src="../Assets/images/bg.jpg" alt="alt"/>
                    </div>
                    <div data-aos="zoom-in" data-aos-duration="1000" class="part">
                        <h2 class="intro-title">C??C T??NH N??NG N???I B???T</h2>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="element-part" style="background: red">
                                        <i class="custom-icon fa-solid fa-circle-question"></i><br>
                                        <h3 class="element-title">H???c v???i quiz</h3>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="element-part" style="background: #0081e2">
                                        <i class="custom-icon fa-solid fa-gamepad"></i>
                                        <h3 class="element-title">H???c v???i game</h3>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="element-part" style="background: #00ed7a">
                                        <i class="custom-icon fa-sharp fa-solid fa-circle-play"></i>
                                        <h3 class="element-title">H???c v???i video</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="part">
                        <h2 class="intro-title">T???i sao h???c online l???i c???n thi???t</h2>
                        <div class="container">
                            <div class="row">
                                <div data-aos="fade-right" data-aos-duration="1000" class="col-md-6">
                                    <p style="text-align: justify; padding: 0 1em; font-size: 1.5em">Trong th???i ?????i c??ng ngh??? s??? ng??y nay, h???c online 
                                        ??ang tr??? th??nh xu h?????ng ph??? bi???n v?? ???????c nhi???u 
                                        ng?????i l???a ch???n. Vi???c h???c online kh??ng ch??? ti???t 
                                        ki???m th???i gian v?? chi ph??, m?? c??n gi??p cho ch??ng 
                                        ta c?? th??? h???c b???t c??? l??c n??o v?? ??? b???t c??? ????u m?? 
                                        kh??ng b??? gi??n ??o???n b???i nh???ng r??o c???n ?????a l?? hay th???i gian. 
                                        Ngo??i ra, h???c online c??n cung c???p cho ch??ng ta m???t ph???m vi
                                        ki???n th???c ??a d???ng v?? phong ph?? t??? nhi???u ngu???n t??i li???u kh??c nhau,
                                        gi??p cho ch??ng ta c?? th??? h???c t???p hi???u qu??? h??n v?? n??ng cao ki???n 
                                        th???c c???a m??nh. Do ????, h???c online ??ang l?? l???a ch???n th??ng minh 
                                        v?? ????ng ????? c??c b???n h???c sinh, sinh vi??n v?? nh???ng ng?????i mu???n 
                                        n??ng cao tr??nh ????? c???a m??nh l???a ch???n.</p>
                                </div>
                                <div data-aos-duration="1000" data-aos="flip-left" class="col-md-6">
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
                        <h2 class="intro-title">M???t s??? h??nh ???nh ch???p m??n h??nh</h2>
                        <div class="container">
                            <div class="row">
                                <div data-aos="flip-left" data-aos-duration="1000" class="col-md-6">
                                    <div class="image-decor">
                                        <div>
                                            <img src="../Assets/images/img-decor-2.png" alt="alt"/>
                                        </div>
                                    </div>
                                </div>
                                <div data-aos="flip-left" data-aos-duration="1000" class="col-md-6">
                                    <div class="image-decor">
                                        <div>
                                            <img src="../Assets/images/img-decor-3.png" alt="alt"/>
                                        </div>
                                    </div>
                                </div>
                                <div data-aos="flip-left" data-aos-duration="1000" class="col-md-6">
                                    <div class="image-decor">
                                        <div>
                                            <img src="../Assets/images/img-decor-4.png" alt="alt"/>
                                        </div>
                                    </div>
                                </div>
                                <div data-aos="flip-left" data-aos-duration="1000" class="col-md-6">
                                    <div class="image-decor">
                                        <div>
                                            <img src="../Assets/images/img-decor-5.png" alt="alt"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="part">
                        <h2 class="intro-title">V??? ch??ng t??i</h2>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d11739.607889410667!2d105.53223593938294!3d21.011071602123394!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2s!4v1678124934353!5m2!1sen!2s" 
                                            width="100%" height="100%" style="border:0;" allowfullscreen="" 
                                            loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                </div>
                                <div class="col-md-6">
                                    <p style="text-align: justify; padding: 0 1em; font-size: 1.25em">
                                        - Nguy???n L????ng Khang<br>
                                        - L?? H???i Ho??ng<br>
                                        - Phan M???nh Th???ng<br>
                                        - Phan Trung Ki??n<br>
                                        - Nguy???n Qu???c Kh??nh<br><br>
                                        Ch??ng m??nh l?? m???t nh??m sinh vi??n n??m 3 Chuy??n ng??nh K??? Thu???t Ph???n M???m
                                        thu???c tr?????ng ?????i H???c FPT H?? N???i. V???i c??ng chung m???t ni???m ??am m?? trong vi???c h???c
                                        c??ch ph??t tri???n v?? x??y d???ng website. V?? th??? th??ng qua d??? ??n n??y,
                                        ch??ng m??nh mu???n bi???n nh???ng ??am m?? ???? c??ng v???i kinh nghi???m trong su???t qu?? tr??nh
                                        h???c t???p v?? nhi???t huy???t c???a tu???i tr??? th??nh th??? c?? th??? mang l???i nh???ng gi?? tr??? th???c
                                        c?? ??ch cho x?? h???i.
                                    </p>
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
                                        <span>K???t n???i v???i ch??ng t??i th??ng qua m???ng x?? h???i:</span>
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
                                                <p style="text-align: justify">
                                                    Trang web n??y x??y d???ng ra ????? gi??p c??c em h???c sinh ti???u h???c
                                                    t??? h???c ????? trau d???i th??m ki???n th???c ngo??i nh???ng gi??? h???c truy???n
                                                    th???ng nh?? tr??n tr?????ng h???c
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
                                                    <a href="#!" class="text-dark">Link here</a>
                                                </p>
                                                <p>
                                                    <a href="#!" class="text-dark">Link here</a>
                                                </p>
                                                <p>
                                                    <a href="#!" class="text-dark">Link here</a>
                                                </p>
                                                <p>
                                                    <a href="#!" class="text-dark">Link here</a>
                                                </p>
                                            </div>
                                            <!-- Grid column -->

                                            <!-- Grid column -->
                                            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                                                <!-- Links -->
                                                <h6 class="text-uppercase fw-bold">LI??N H???</h6>
                                                <hr
                                                    class="mb-4 mt-0 d-inline-block mx-auto"
                                                    style="width: 60px; background-color: #7c4dff; height: 2px"
                                                    />
                                                <p><i class="fas fa-home mr-3"></i> Th???ch Th???t, H?? N???i</p>
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
                                    ?? 2023 Copyright:
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
                    <h2 style="font-weight: bolder;">Th??ng ba??o</h2>
                </div>
                <div style="height: 258px; background-color: white; margin: 2px 5px 0 5px; border-radius: 8px">
                    <div class="content2">
                        Trang web ????????c thi????t k???? ?????? s???? du??ng tr??n ca??c ma??n hi??nh co?? ki??ch th??????c l????n, chu??ng t??i
                        khuy??n ba??n n??n s???? du??ng ca??c ma??n hi??nh co?? ki??ch th??????c t???? 15 inch tr???? l??n ?????? co?? tra??i
                        nghi????m t????t nh????t.
                    </div>
                    <div class="content3">
                        <img style="width: 70px;" src="../Assets/icon/icon (77).png" alt="">
                        <img src="../Assets/icon/icon (76).png" alt="">
                        <img src="../Assets/icon/icon (78).png" alt="">
                    </div>
                    <a href="#xmas-popup" class="close">
                        <p style="margin: 2px 0 0 0 ;">??a?? Hi????u!</p>
                    </a>
                </div>
            </div>
        </div>
    </body>
    <script>
        AOS.init();
    </script>
</html>
