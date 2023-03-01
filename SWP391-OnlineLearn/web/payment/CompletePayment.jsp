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
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Complete Payment</title>
        <link rel="stylesheet" href="../Assets/css/Style.css">
        <link rel="stylesheet" href="../Assets/css/completePayment.css">
        <!-- link bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>

    <body>
        <div class="main">
            <!--nav bar-->
            <jsp:include page="../custom/nav.jsp"></jsp:include>
                <!--content-->

                <div class="content container-fluid">
                    <!--Ae code o day nha-->
                    <div class="complete-payment-box row">
                        <div class="main-payment col-md-6">
                            <form action="./completePayment" method="POST">
                                <div class="radio-btn">
                                    <input type="radio" name="type-card" checked> Thẻ tín dụng hoặc thẻ ghi nợ<br>
                                    <img src="../Assets/images/card2.png" height="30">
                                </div>
                                <div class="radio-btn">
                                    <input type="radio" name="type-card"> Paypal<br>
                                    <img src="../Assets/images/paypal.png" height="30">
                                </div>
                                <br>
                                <label>Số thẻ</label>
                            <c:if test="${requestScope.noti1 ne null}">
                                <a style="color: red">( ${requestScope.noti1} )</a>
                            </c:if>
                            <br>
                            <input class="input-data" id="credit-card-input" type="text"
                                   maxlength="19" name="creditCardNum" placeholder="0000 0000 0000 0000"> <br>

                            <label>Ngày hết hạn</label>
                            <c:if test="${requestScope.noti2 ne null}">
                                <a style="color: red">( ${requestScope.noti2} )</a>
                            </c:if>
                            <br>
                            <input id="dateInput" onkeyup="addSlashes(this)" maxlength=5
                                   class="input-data" type="text" name="mmyyNum" placeholder="MM/YY"><br> 

                            <label>Mã bảo mật</label>
                            <c:if test="${requestScope.noti3 ne null}">
                                <a style="color: red">( ${requestScope.noti3} )</a>
                            </c:if>
                            <br>
                            <input class="input-data" maxlength=4 type="text" name="ccvNum" placeholder="CCV"><br>       

                            <input class="btn-pay" type="submit" value="Thanh toán">
                        </form>
                    </div>
                    <div class="detail-payment col-md-6">
                        <h2>Hoàn tất giao dịch</h2>
                        <div class="price">
                            250.000 VNÐ/Năm<br><br>
                            Giá: 250.000 VNÐ<br>
                            VAT: 25.000 VNÐ (10% của giá tiền)<br>
                            Tổng: 275.000 VND<br>
                        </div>
                        <div>
                            <h4>Ðặc quyền tài khoản premium</h4>
                            <div class="detail-benefit">
                                <ul>
                                    <li>Học các bài học vip</li>
                                    <li>Làm bài tập bằng các trò chơi vui nhộn</li>
                                    <li>Làm bài tập bằng các trò chơi vui nhộn</li>
                                </ul>
                                <p  class="note">(*) Ngân hàng của bạn có thể tính phí xử lý giao dịch tại nước ngoài học phí giao dịch hối đoái. </p>
                            </div>
                        </div>
                    </div>
                </div>
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