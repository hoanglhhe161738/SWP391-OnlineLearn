<%-- 
    Document   : CompletePayment
    Created on : Feb 17, 2023, 1:23:19 PM
    Author     : Khangnekk
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Complete Payment</title>
        <link rel="stylesheet" href="../Assets/css/Style.css">
        <link rel="stylesheet" href="../Assets/css/completePayment.css">
        <link rel="icon" href="../Assets/icon/favicon.png"/>
        <!-- link bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <style>
            .payment-successful{
                position: absolute;
                left: 50%;
                top:50%;
                transform: translateX(-50%) translateY(-50%);
                text-align: center;
                padding: 1.5em;
                background: white;
                border-radius: 10px;
            }
            .payment-successful-content{

            }
            .payment-item img{
                width: 15%;
            }
            .payment-item{
                font-size: larger;
                padding: 0 3em;
                margin-top:2em;
            }
            button{
                height: 2em;
                width: 10em;
                font-size: larger;
                font-weight: bolder;
                color: #fff;
                background-color: #32c671;
                border-radius: 10px;
                border: white;
            }
        </style>
    </head>

    <body>
        <div class="main">
            <!--nav bar-->
            <jsp:include page="../custom/nav.jsp"></jsp:include>
                <!--content-->

                <div class="content container-fluid">
                    <!--Ae code o day nha-->
                <c:if test="${sessionScope.account.classify_account eq requestScope.normal}">
                    <div class="complete-payment-box row">
                        <div class="main-payment col-md-6">
                            <form action="./completePayment" method="POST">
                                <div class="radio-btn">
                                    <input type="radio" name="type-card" checked> Th??? t??n d???ng ho???c th??? ghi n???<br>
                                    <img src="../Assets/images/card2.png" height="30">
                                </div>
                                <div class="radio-btn">
                                    <input type="radio" name="type-card"> Paypal<br>
                                    <img src="../Assets/images/paypal.png" height="30">
                                </div>
                                <br>
                                <label>S??? th???</label>
                                <c:if test="${requestScope.noti1 ne null}">
                                    <a style="color: red">( ${requestScope.noti1} )</a>
                                </c:if>
                                <br>
                                <input class="input-data" id="credit-card-input" type="text"
                                       maxlength="19" name="creditCardNum" placeholder="0000 0000 0000 0000"> <br>

                                <label>Ng??y h???t h???n</label>
                                <c:if test="${requestScope.noti2 ne null}">
                                    <a style="color: red">( ${requestScope.noti2} )</a>
                                </c:if>
                                <br>
                                <input id="dateInput" onkeyup="addSlashes(this)" maxlength=5
                                       class="input-data" type="text" name="mmyyNum" placeholder="MM/YY"><br> 

                                <label>M?? b???o m???t</label>
                                <c:if test="${requestScope.noti3 ne null}">
                                    <a style="color: red">( ${requestScope.noti3} )</a>
                                </c:if>
                                <br>
                                <input class="input-data" maxlength=4 type="text" name="ccvNum" placeholder="CCV"><br>       

                                <input class="btn-pay" type="submit" value="Thanh to??n">
                            </form>
                        </div>
                        <div class="detail-payment col-md-6">
                            <h2>Ho??n t???t giao d???ch</h2>
                            <div class="price">
                                250.000 VN??/N??m<br><br>
                                Gi??: 250.000 VN??<br>
                                VAT: 25.000 VN?? (10% c???a gi?? ti???n)<br>
                                T???ng: 275.000 VND<br>
                            </div>
                            <div>
                                <h4>?????c quy???n t??i kho???n premium</h4>
                                <div class="detail-benefit">
                                    <ul>
                                        <li>H???c c??c b??i h???c vip</li>
                                        <li>L??m b??i t???p b???ng c??c tr?? ch??i vui nh???n</li>
                                        <li>L??m b??i t???p b???ng c??c tr?? ch??i vui nh???n</li>
                                    </ul>
                                    <p  class="note">(*) Ng??n h??ng c???a b???n c?? th??? t??nh ph?? x??? l?? giao d???ch t???i n?????c ngo??i h???c ph?? giao d???ch h???i ??o??i. </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.account.classify_account eq requestScope.premium}">
                    <div class="payment-successful">
                        <div class="payment-successful-content">
                            <div class="payment-item"><img src="../Assets/icon/icon (53).png" alt=""></div>
                            <div class="payment-item" style=""><h1>T??i kho???n c???a b???n hi???n ??ang l?? t??i kho???n premium<h1></div>
                                        <div class="payment-item" style="">Ba??n ??a?? n??ng c????p tha??nh c??ng ta??i khoa??n premium, chu??c ba??n co?? m????t tra??i nghi????m ho??c t????p hi????u qua??
                                        </div>
                                        <div class="payment-item" style="">
                                            <a href="../home/homePage">
                                                <button style="cursor: pointer" type="button">
                                                    V???? trang chu??
                                                </button>
                                            </a>
                                        </div>
                                        </div>
                                        </div>
                                    </c:if>
                                    </div>
                                    </div>
                                    </body>
                                    <script>
                                        const input = document.getElementById("credit-card-input");
                                        input.addEventListener("input", () => input.value = formatNumber(input.value.replaceAll(" ", "")));

                                        const formatNumber = (number) => number.split("").reduce((seed, next, index) => {
                                                if (index !== 0 && !(index % 4))
                                                    seed += " ";
                                                return seed + next;
                                            }, "");

                                        function addSlashes(element) {

                                            let ele = document.getElementById(element.id);
                                            ele = ele.value.split('/').join('');    // Remove slash (/) if mistakenly entered.
                                            if (ele.length < 4 && ele.length > 0) {
                                                let finalVal = ele.match(/.{1,2}/g).join('/');

                                                document.getElementById(element.id).value = finalVal;
                                            }
                                        }
                                    </script>
                                    </html>