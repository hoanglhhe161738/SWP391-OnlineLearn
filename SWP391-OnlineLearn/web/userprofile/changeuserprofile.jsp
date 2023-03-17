<%-- 
    Document   : changeuserprofile
    Created on : Mar 2, 2023, 1:47:21 AM
    Author     : Khangnekk
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Assets/css/popup.css">
        <link rel="stylesheet" href="../Assets/css/userprofile.css">
        <link rel="stylesheet" href="../Assets/css/changeUserProfile.css">
        <link rel="icon" href="../Assets/icon/favicon.png"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>Sửa thông tin</title>
        <style>
            .text-box-input{
                width: 100%;
                margin: 1em 0;
                padding: 0.25em 0.5em;
                border-radius: 8px;
                border: 1px solid gray;
            }
            .change-panel{
                padding: 1em 2em;
            }
            .label-custom{
                margin-right:1em;
                font-weight: bold;
            }
            .save-btn{
                background-color: #0081e2;
                color: #ffffff;
                font-weight: bolder;
                font-size: 1.3em;
                border-radius: 10px;
                border: 1px solid #f2f2f2;
                padding: 0.25em 0.5em;
            }
            .content{
                background-image: url(../Assets/images/bg.png);
            }
            .passInput{
                text-decoration: none;
                color: #00de7a;
                font-size: 18px;
                font-weight: bold;
            }
            .failInput{
                text-decoration:none;
                color: red;
                font-size: 18px;
                font-weight: bold;
            }
        </style>
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
                                        <h5 style="margin: 20px; font-weight: bolder;">${sessionScope.user.full_name}</h5>
                                </div>
                                <div class="account-profile">
                                    <p style="margin-bottom: 0;"> ID: ${sessionScope.user.user_id}</p>
                                    <p> Loại tài khoản: <b>${sessionScope.account.classify_account}</b></p>
                                </div>
                            </div>
                        </div>
                        <div class="profile-item col-7">
                            <div class="profile-item-unit p-3" style="height: auto;">
                                <form action="./changeUserProfile" method="POST">
                                    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            var elements = $("input, select");
                                            for (var i = 0; i < elements.length; i++) {
                                                elements[i].oninvalid = function (e) {
                                                    e.target.setCustomValidity("");
                                                    if (!e.target.validity.valid) {
                                                        e.target.setCustomValidity(e.target.getAttribute("requiredmsg"));
                                                    }
                                                };
                                                elements[i].oninput = function (e) {
                                                    e.target.setCustomValidity("");
                                                };
                                            }
                                        });
                                    </script>
                                    <div class="change-panel">
                                        <label class="" style="display: flex;text-align: left">Họ và tên</label>
                                        <input class="text-box-input" pattern="(?=.*\S).{1,}" requiredmsg="Họ và tên không được để trống."required type="text" value="${sessionScope.user.full_name}" name="fullName" class="signup-input" placeholder="VD: Hứa Như Không">
                                        <!--<input class="text-box-input" name="fullName" type="text"  placeholder="Họ và tên"><br>-->
                                        <span class="text-box-input" style="margin-right: 0.5em; border: 1px solid #f2f2f2">
                                            <label class="label-custom">Giới tính: </label>
                                            <input type="radio" name="gender" value="true"
                                                   <c:if test="${sessionScope.user.gender}">
                                                       checked
                                                   </c:if>>
                                            <label style="margin-right: 1em">Nam</label>
                                            <input  type="radio" name="gender" value="false"
                                                    <c:if test="${!sessionScope.user.gender}">
                                                        checked
                                                    </c:if>>
                                            <label>Nữ</label>
                                        </span>
                                        <span class="text-box-input" style=" border: 1px solid #f2f2f2">
                                            <label class="label-custom">Ngày sinh: </label>
                                            <input type="date" name="dob" value="${sessionScope.user.dob}"
                                                   style="border-radius: 8px; padding: 0.15em 0.5em;border: 1px solid black">
                                        </span>
                                        <br>
                                        <label class="" style="display: flex;text-align: left">Họ và tên phụ huynh</label>
                                        <input  class="text-box-input" value="${sessionScope.user.parent_name}" type="text" name="parentName" class="signup-input" placeholder="VD: Hứa Xong Quên" pattern="(?=.*\S).{1,}" requiredmsg="Họ và tên không được để trống." required>
                                        <!--<input class="text-box-input" value="${sessionScope.user.parent_name}" name="parentName" type="text" placeholder="Họ và tên phụ huynh"><br>-->
                                        <label class="" style="display: flex;text-align: left">Email phụ huynh</label>
                                        <input class="text-box-input" value="${sessionScope.user.parent_email}" name="parentEmail" type="text" placeholder="Email phụ huynh"><br>
                                        <label class="" style="display: flex;text-align: left">Số điện thoại phụ huynh</label>
                                        <input class="text-box-input" value="${sessionScope.user.parent_phone_number}" maxlength="10" name="phoneNumber" type="text" placeholder="Số điện thoại phụ huynh"><br>
                                    </div>
                                    <div style="display: flex; justify-content: space-between;">
                                        <div style="margin: 0 1em; text-align: left">
                                            <c:if test="${requestScope.noti1 ne null}">
                                                <a class="failInput">${requestScope.noti1}</a>
                                            </c:if>
                                            <c:if test="${requestScope.noti2 ne null}">
                                                <br><a class="failInput">${requestScope.noti2}</a>
                                            </c:if>
                                            <c:if test="${requestScope.noti3 ne null}">
                                                <br><a class="passInput">${requestScope.noti3}</a>
                                            </c:if>
                                        </div>
                                        <div style="margin: 1em;">
                                            <input class="save-btn" type="submit" value="Lưu thông tin">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>