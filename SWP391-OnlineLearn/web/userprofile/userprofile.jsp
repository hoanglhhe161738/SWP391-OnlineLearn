<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>--> 
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../Assets/icon/favicon.png"/>
        <link rel="stylesheet" href="../Assets/css/popup.css">
        <link rel="stylesheet" href="../Assets/css/userprofile.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>User Profile</title>
    </head>

    <body style="background-color: #ffffff;">
        <div class="main">
            <!--nav bar-->
            <jsp:include page="../custom/nav.jsp"></jsp:include>
                <!--content-->
                <div class="content" style="background-image: url('../Assets/images/bg.png')">
                    <!--Ae code o day nha-->
                    <!--            <div class="account" style="border:5px white solid;">
                            <div ><img src="../Assets/icon/icon (4).png" alt=""></div>
                            <div style="color: #00de7a;">
                                <li style="color: white; list-style: none;">Ly Hai Hoang</li>
                                <li style="color: white; list-style: none;">ID: 0000001</li>
                            </div>
                        </div>-->
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
                                    <p style="margin-bottom: 0;">ID: ${sessionScope.user.user_id}</p>
                                    <p>Loại tài khoản: <b>${sessionScope.account.classify_account}</b></p>
                                </div>
                            </div>
                        </div>
                        <div class="profile-item col-7">
                            <div class="profile-item-unit p-3">
                                <div class="information-content">
                                    <div class="information-user-left">
                                        <ul class="information-content-left">
                                            <li class="information-content-item">Họ và tên:</li>
                                            <li class="information-content-item">Ngày sinh:</li>
                                            <li class="information-content-item">Giới tính:</li>
                                            <li class="information-content-item">Họ và tên phụ huynh:</li>
                                            <li class="information-content-item">Email phụ huynh:</li>
                                            <li class="information-content-item">SĐT phụ huynh:</li>
                                        </ul>
                                    </div>
                                    <div information-user-right>
                                        <ul class="information-content-right">
                                            <li class="information-content-item">${sessionScope.user.full_name}</li>
                                            <li class="information-content-item">${sessionScope.user.dob}</li>
                                            <li class="information-content-item">
                                                <c:if test="${sessionScope.user.gender}">
                                                    Nam
                                                </c:if>
                                                <c:if test="${!sessionScope.user.gender}">
                                                    Nữ
                                                </c:if>

                                            </li>
                                            <li class="information-content-item">${sessionScope.user.parent_name}</li>
                                            <li class="information-content-item">${sessionScope.user.parent_email}</li>

                                            <li class="information-content-item">${sessionScope.user.parent_phone_number}</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--<h2>Các khóa học đã đăng ký</h2>-->
                        <div class="course-com" style="overflow: auto; height: 270px">
                            <c:forEach items="${requestScope.registeredCourses}" var="rc">
                                <div class="profile-item col-12">
                                    <div class="profile-item-unit-two p-3">
                                        <h3>${rc.course_name} ${rc.classes.class_id}</h3>
                                        <p style="font-size: 1.2em">Hãy luôn tin tưởng vào khả năng của mình và đặt 
                                            mục tiêu cho bản thân. Dù cho có những thử thách 
                                            trong học tập, hãy kiên trì và cố gắng vượt qua chúng.
                                            Với sự nỗ lực và tinh thần chăm chỉ, bạn sẽ tiến bộ và 
                                            đạt được thành công trong học tập.</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>


</html>