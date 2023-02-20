<%-- 
    Document   : CompletePayment
    Created on : Feb 17, 2023, 1:23:19 PM
    Author     : Khangnekk
--%>

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
            <div class="nav">
                <div class="nav-bar">
                    <ul class="items">
                        <li class="item">
                            <a href="../home/homePage"><img src="../Assets/icon/icon (69).png"></a>
                        </li>
                        <li class="item">
                            <a href="../ranking/ranking.html"><img src="../Assets/icon/icon (44).png"></a>
                        </li>
                        <li class="item">
                            <a href="../course/classes"><img src="../Assets/icon/icon (71).png"></a>
                        </li>
                        <li class="item">
                            <a href="../payment/Payment.html"><img src="../Assets/icon/icon (51).png"></a>
                        </li>
                        <li class="item">
                            <a href="../"><img src="../Assets/icon/icon (45).png"></a>
                        </li>
                        <li class="item avt-btn">
                            <a href="../"><img src="../Assets/icon/icon (4).png">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="content container-fluid">
                <!--Ae code o day nha-->
                <div class="complete-payment-box row">
                    <div class="main-payment col-md-6">
                        <form action="" method="POST">
                            <div class="radio-btn">
                                <input type="radio" name="type-card" checked> Thẻ tín dụng hoặc thẻ ghi nợ<br>
                                <img src="../Assets/images/card2.png" height="30">
                            </div>
                            <div class="radio-btn">
                                <input type="radio" name="type-card"> Paypal<br>
                                <img src="../Assets/images/paypal.png" height="30">
                            </div>
                            <br>
                            <label>Số thẻ</label><br>
                            <input class="input-data" type="text" name="cardNumber" placeholder="0000 - 0000 - 0000 - 0000"> <br>
                            <label>Ngày hết hạn</label><br>
                            <input class="input-data" type="text" name="cardNumber" placeholder="MM/YY"><br>                            
                            <label>Mã bảo mật</label><br>
                            <input class="input-data" type="text" name="cardNumber" placeholder="CCV"><br>                            
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

</html>