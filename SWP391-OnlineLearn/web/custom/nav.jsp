<%-- 
    Document   : nav
    Created on : Feb 23, 2023, 2:49:43 PM
    Author     : Khangnekk
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="nav" style="z-index: 100">
    <div class="nav-bar">
        <ul class="items">
            <li class="item">
                <a href="../home/homePage#xmas-popup"><img src="../Assets/icon/icon (69).png"></a>
            </li>
            <!--                    <li class="item">
                <a href="../ranking/ranking.html"><img src="../Assets/icon/icon (44).png"></a>
            </li>-->
            <li class="item">
                <a href="../course/classes"><img src="../Assets/icon/icon (71).png"></a>
            </li>
            <li class="item">
                <a href="../payment/completePayment"><img src="../Assets/icon/icon (51).png"></a>
            </li>
            <li class="item">
                <a href="../ranking/rankingPage"><img src="../Assets/icon/icon (43).png"></a>
            </li>
            <li class="item avt-btn" style="list-style: none;">
                <!-- <a href="../"><img src="../Assets/icon/icon (4).png">
                </a> -->
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false"
                            style="background-color: white; width: 3.2em; height: 3.2em; padding: 0 20px 20px 0; border-radius: 50%; border: 2px solid #ccc;;">
                        <img src="../Assets/icon/icon (4).png">
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="../userprofile/viewUserProfile">Hồ sơ thông tin</a>
                        </li>
                        <li><a class="dropdown-item" href="../userprofile/changePassword">Đổi mật khẩu</a></li>
                        <li><a class="dropdown-item" href="../logout">Đăng xuất</a></li>
                        <c:if test="${sessionScope.user.username eq sessionScope.admin}">
                        <li><a class="dropdown-item" href="../admin/action">Xem với tư cách admin</a></li>
                        </c:if>
                    </ul>
                </div>
            </li>
        </ul>

    </div>
</div>