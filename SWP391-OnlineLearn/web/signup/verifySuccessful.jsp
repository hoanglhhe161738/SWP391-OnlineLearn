<%-- 
    Document   : verifySuccessful
    Created on : Mar 8, 2023, 2:25:16 PM
    Author     : T490
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment Successful</title>
  <style>
    .payment-successful-content{
      text-align: center;
      margin: 10% auto;
      width: 30%;
      height: 200px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
    .payment-item img{
      width: 15%;
    }
     
  </style>
</head>

<body style="background-color: #f1f1f1;">
  <div class="payment-successful">
    <div class="payment-successful-content">
      <div class="payment-item"><img src="../Assets/icon/icon (74).png" alt=""></div>
      <div class="payment-item" style="font-weight: bolder; font-size: 2rem; padding-top: 10px;">Đăng kí tài khoản thành công</div>
      <div class="payment-item" style="font-size: large; padding-top: 30px;">Bạn đã đăng kí tài khoản thành công, chúc bạn có một trải nghiệm học tập hiệu quả
      </div>
      <div class="payment-item" style="padding-top: 40px;"><a href="../home/homePage">
                        <button style="height: 2em; width: 10em; font-size: larger; font-weight: bolder; color: #fff; background-color: #32c671;
                                border-radius: 10px; border: white; cursor: pointer" type="button">
                            Về trang chủ
                        </button>
                    </a></div>
    </div>
  </div>
</body>

</html>