<%-- 
    Document   : navForAdmin
    Created on : Mar 12, 2023, 12:18:17 AM
    Author     : Khangnekk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="nav-information" style="justify-content: space-between">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="../admin/action">Trang chủ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../logout">Đăng xuất</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="nav-information-item" style="padding-top: 0.1em;">
                <div class="nav-information-image">
                    <div
                        style="height: 0.8em; width: 0.8em; border: 3px solid #fff; margin-left: 2em;margin-top: 2em; border-radius: 50%; background-color: #00b050;">
                    </div>

                </div>
                <div class="nav-information-text">
                    <ul class="nav-information-text-content">
                        <li class="nav-information-text-content-item">${sessionScope.user.full_name}</li>
                        <li class="nav-information-text-content-item">Admin</li>
                    </ul>
                </div>
            </div>
        </div>