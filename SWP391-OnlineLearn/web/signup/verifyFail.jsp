<%-- 
    Document   : verifyFail
    Created on : Mar 8, 2023, 2:32:15 PM
    Author     : T490
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Fail</title>
    <style>
        .payment-successful-content {
            text-align: center;
            margin: 10% auto;
            width: 30%;
            height: 200px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .payment-item img {
            width: 15%;
        }

        .payment-item-one-list {
            display: flex; 
            
        }

        .payment-item-one-list-item {
            list-style: none;
            display: inline;
            padding-left: 40px;
        }
    </style>
</head>

<body style="background-color: #f1f1f1;">
    <div class="payment-successful">
        <div class="payment-successful-content">
            <div class="payment-item"><img src="../Assets/icon/icon (79).png" alt=""></div>
            <div class="payment-item" style="font-weight: bolder; font-size: 2rem; padding-top: 10px;">Đăng kí tài khoản thất bại!</div>
            <div class="payment-item" style="font-size: large; padding-top: 30px;">
                Mã xác nhận không đúng, ấn "Thử lại" để nhận mã xác nhận mới!
            </div>
            <div class="payment-item-one" style="padding-top: 40px;">
                <ul class="payment-item-one-list">
                    <li class="payment-item-one-list-item"><a href="./signupUser">
                                <button style="height: 2em; width: 8em; font-size: larger; font-weight: bolder; color: #fff; background-color: #32c671;
                                        border-radius: 10px; border: white; margin-left: -50px; cursor: pointer" type="button">
                                    Thử lại
                                </button>
                            </a></li>
                    <li class="payment-item-one-list-item"><a href="../home/homePage">
                                <button style="height: 2em; width: 8em; font-size: larger; font-weight: bolder; color: #fff; background-color: #da4453;
                                        border-radius: 10px; border: white; cursor: pointer" type="button">
                                    Hủy bỏ
                                </button>
                            </a></li>
                </ul>
            </div>
        </div>
    </div>
</body>

</html>
