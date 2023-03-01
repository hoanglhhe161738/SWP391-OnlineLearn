<%-- 
    Document   : changeuserprofile
    Created on : Mar 2, 2023, 1:47:21 AM
    Author     : Khangnekk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Assets/css/popup.css">
        <link rel="stylesheet" href="../Assets/css/userprofile.css">
        <link rel="stylesheet" href="../Assets/css/changeUserProfile.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Document</title>
    </head>
    <body style="background-color: #ffffff;">
        <div class="main">
            <!--nav bar-->
            <jsp:include page="../custom/nav.jsp"></jsp:include>
                <!--content-->

            <div class="content">
                <!--Ae code o day nha-->
                <!--            <div class="account" style="border:5px white solid;">
                        <div ><img src="../Assets/icon/icon (4).png" alt=""></div>
                        <div style="color: #00de7a;">
                            <li style="color: white; list-style: none;">Ly Hai Hoang</li>
                            <li style="color: white; list-style: none;">ID: 0000001</li>
                        </div>
                    </div>-->
                <div class="choose-change container">

                </div>
                <div class="container text-center" style="margin-top: 5%;">
                    <div class="container overflow-hidden text-center choose-change row gx-2">
                        <div style="margin-right: 2em;" class="choose-change-one col-md-2">
                            <a style="text-decoration: none;" href="./viewUserProfile"><p class="p-0">Xem thông tin</p></a>
                        </div>
                        <div class="choose-change-two col-md-2">
                            <a style="text-decoration: none;" href="./changeUserProfile"><p>Sửa thông tin</p></a>
                        </div>
                        <!-- <div class="row gx-5">
                            <div class="choose-change-one col-2">
                                <div class="p-3">Xem thông tin</div>
                            </div>
                            <div class="choose-change-two col">
                                <div class="p-3">Sửa thông tin</div>
                            </div>
                        </div> -->
                    </div>
                    <div class="profile row g-2">
                        <div class="profile-item col-5">
                            <div class="profile-item-unit p-3">
                                <div class="image-profile">
                                    <div class="image-in"><img src="" alt=""></div>
                                    <h5 style="margin: 20px; font-weight: bolder;">${sessionScope.account.username}</h5>
                                </div>
                                <div class="account-profile">
                                    <p style="margin-bottom: 0;">ID: ${sessionScope.user.user_id}</p>
                                    <p>Loại tài khoản: ${sessionScope.account.classify_account}</p>
                                </div>
                            </div>
                        </div>
                        <div class="profile-item col-7">
                            <div class="profile-item-unit p-3" style="height: 550px;">
                                <div class="information-content">
                                    <div class="information-user-left-change">
                                        <ul class="information-content-left-change">
                                            <li class="information-content-item-change"><input size="70em" style="border-radius: 5px;" type="text" placeholder="Password"></li>
                                            <li class="information-content-item-change"><input size="70em" style="border-radius: 5px;" type="text" placeholder="Họ và tên"></li>
                                            <li class="information-content-item-change-one" style="text-align: start; margin-left: 30px;">Giới tính: <label style="margin:0 10px 0 20px;">Nam</label><input style="border-radius: 50%;" type="radio" name="gender">
                                                <label style="margin:0 10px 0 20px;">Nữ</label><input style="border-radius: 50%;" type="radio" name="gender"></li>
                                            <li class="information-content-item-change"><input size="70em" style="border-radius: 5px;" type="text" placeholder="Họ và tên phụ huynh"></li>
                                            <li class="information-content-item-change"><input size="70em" style="border-radius: 5px;" type="text" placeholder="Email phụ huynh"></li>
                                            <li class="information-content-item-change"><input size="70em" style="border-radius: 5px;" type="text" placeholder="Số điện thoại phụ huynh"></li>
                                        </ul>
                                        <input style="margin: 1em 0 0 60%; background-color: #0081e2; color: #ffffff; font-weight: bolder; font-size: 1.3em; border-radius: 10px; width: 30%; height: 10%;"  class="save" type="button" value="Lưu thông tin">
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


    </body>
</html>