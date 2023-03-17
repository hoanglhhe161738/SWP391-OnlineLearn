<%-- 
    Document   : EmailAcception
    Created on : Mar 13, 2023, 5:16:15 PM
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
        <style>
            .encode{
                height: auto;
                padding: 1em 0.25em;
            }
            #loading {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 9999;
            }
        </style> 
    </head>

    <body>
        <div id="loading">
            <img src="https://img.pikbest.com/png-images/20190918/cartoon-snail-loading-loading-gif-animation_2734139.png!bw700" 
                 style="position: fixed;
                 z-index: 10000;
                 top: 50%;
                 left: 50%;
                 width: 200px;
                 height: 200px;
                 background: wheat;
                 border-radius: 15px;
                 transform: translateX(-50%) translateY(-50%)">
        </div>
        <div class="main">
            <!--nav bar-->
            <jsp:include page="../custom/nav.jsp"></jsp:include>
            <!--content-->
            <div class="content">
                <div class="encode">
                    <div class="encode-content">
                        <form action="./sendEmail" id="myForm" method="POST">
                            <div encode-ontent-para style="text-align: start;">
                                <p style="font-size: large; text-align: center; font-size: 1.5rem; padding-top: 1rem; font-weight: bolder;">Nhập địa chỉ email xác nhận thanh toán:</p>
                            </div>
                            <div encode-ontent encode-pay style="padding: 0.5em"><input name="email"
                                                                                        style="height: 2.5em;
                                                                                        width: 40%;
                                                                                        border: 1px solid black;
                                                                                        width: 80%;
                                                                                        padding: 0.25em 0.5em;
                                                                                        border-radius: 8px;
                                                                                        "
                                                                                        type="text"
                                                                                        placeholder="abc@gmail.com"></div>
                            <div encode-ontent note-pay
                                 style="font-size: 15px; text-align: start; padding-left: 20px;">
                                <p style="padding: 0 12% 0 12%;">(*) Sau khi bấm gửi, hệ thống sẽ gửi cho bạn một mã code 6 chữ số để xác nhận</p>
                                <div style="padding-left: 70%;">
                                    <input style="font-weight: bolder; font-size: larger; width: 50%; padding: 5px 0 5px 0; color: #fff; background-color: #00de79;
                                           border-radius: 10px; border: #fff;" type="submit" value="Gửi">
                                </div>
                            </div>
                        </form>                    
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        // Lấy đối tượng giao diện loading và form
        const loading = document.getElementById("loading");
        const form = document.getElementById("myForm");

        // Gán sự kiện cho form
        form.addEventListener("submit", function () {
            // Hiển thị giao diện loading
            loading.style.display = "block";
        });
    </script>
</html>