<%-- 
    Document   : EncodeEmail
    Created on : Mar 13, 2023, 5:16:25 PM
    Author     : Khangnekk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Encode your email</title>
        <link rel="stylesheet" href="../Assets/css/Style.css">
        <link rel="stylesheet" href="../Assets/css/encode.css">
        <link rel="icon" href="../Assets/icon/favicon.png"/>
        <!-- link bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
        <!-- <style>
            .close:hover {
                color: white;
            }
    
            .content {
                background-image: url('../Assets/images/bgNoBlur.png');
            }
        </style> -->
    </head>

    <body>
        <div class="main">
            <!--nav bar-->
            <jsp:include page="../custom/nav.jsp"></jsp:include>
            <!--content-->
            <div class="content">
                <div class="encode">
                    <div class="encode-content">
                        <div encode-content item-pay>
                            <img src="../Assets/images/bag.png" alt="">
                        </div>
                        <div encode-ontent-accept>
                            <p style="font-weight: bolder; font-size: 2rem; color: #00de79;">Xác nhận thanh toán</p>
                        </div>
                        <div encode-ontent-para style="padding: 0 20px; text-align: start;">
                            <p style="font-size: large;">Chúng tôi vừa gửi 1 mã xác nhận bao gồm 6 chữ số vào
                                email bạn vừa nhập, vui lòng kiểm tra email và nhập mã xác nhận đó vào phần bên
                                dưới rồi bấm hoàn tất để hoàn tất giao dịch.</p>
                        </div>
                        <form action="./verifyCode">
                            <div encode-ontent encode-pay style="padding: 20px;"><input maxlength="7" id="verify-code-input"
                                                                                        style="height: 2.5em; width: 40%; border: 2px solid black;" name="verifyCode" type="text"
                                                                                        placeholder="XXX-XXX"></div>
                            <div encode-ontent note-pay
                                 style="font-size: 15px; text-align: start; margin-top: 5%; padding-left: 20px;">
                                <p>(*) Lưu ý: Mã xác nhận chỉ có hiệu lực trong vòng 2 phút</p>
                                <div style="margin: -7% 0 0 70%;"><input style="font-weight: bolder; font-size: larger; width: 80%; padding: 5px 0 5px 0; color: #fff; background-color: #00de79;
                                                                         border-radius: 10px; border: #fff;" type="submit" value="Hoàn tất"></div>
                            </div>
                        </form>                   
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        const input = document.getElementById("verify-code-input");
        input.addEventListener("input", () => input.value = formatNumber(input.value.replaceAll("-", "")));

        const formatNumber = (number) => number.split("").reduce((seed, next, index) => {
                if (index !== 0 && !(index % 3))
                    seed += "-";
                return seed + next;
            }, "");
    </script>
</html>