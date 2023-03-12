<%-- 
    Document   : fillin4
    Created on : Feb 15, 2023, 2:39:36 PM
    Author     : T490
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Assets/css/styleSignup.css" />
        <link rel="icon" href="../Assets/icon/favicon.png"/>
<!--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
              integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Thông tin tài khoản</title>
        <style>
            .signup-label{
                color: black;
            }
            .fillin4{
                background-color: white;
                max-width: 60%;
                border-radius: 15px;
            }
            .signup-input{
                border-radius: 8px;
                font-size: 15px;
            }
            .modal-backdrop.show {
                opacity: unset;
            }
            .modal-backdrop {
                position: unset;
            }
        </style>
    </head>

    <body>
        <div class="bg" style="margin-bottom: 200px">
        </div>
        <div class="fillin4">
            <h1 class="signup-heading">Thông tin tài khoản</h1>
            <!-- <button class="signup-social">
                  <img class="fa fa-google signup-social-icon" src="/img/logoGG.png">
                  <span class="signup-social-text">Đăng kí bằng tài khoản Google</span>
                </button> -->
            <form id="myForm" action="./fillin4" class="signup-form" method="POST">


                <label for="fullName" class="signup-label">Họ và tên</label>
                <input pattern="(?=.*\S).{1,}" title="Họ và tên không được để trống." required type="text" name="fullName" class="signup-input" placeholder="VD: Hứa Như Không">

                <!-- dob -->
                <label for="dob" class="signup-label">Ngày sinh</label>
                <input type="date" id="myDateInput" name="dob" class="signup-input" pattern="\d{4}-\d{2}-\d{2}" title="Vui lòng nhập ngày dưới dạng yyyy-mm-dd" required>

                <!-- gender -->
                <label for="gender" class="signup-label">Giới tính: Nam <input type="radio" value="true" name="gender" checked> | Nữ <input
                        type="radio" value="false" name="gender"> <br></label> <br>
                <br>

                <!-- parentName -->
                <label for="prentName" class="signup-label">Họ và tên phụ huynh</label>
                <input  type="text" name="parentName" class="signup-input" placeholder="VD: Hứa Xong Quên" pattern="(?=.*\S).{1,}" title="Họ và tên không được để trống." required>

                <!-- parentEmail -->
                <label for="parentEmail" class="signup-label">Email của phụ huynh</label>
                <input type="email" name="parentEmail" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" required class="signup-input" placeholder="VD: ThangSunXiTrai@gmail.com">

                <!-- parentPhoneNumber  -->
                <label for="parentPhoneNumber" class="signup-label">Sđt của phụ huynh</label>
                <input type="text" name="parentPhoneNumber" pattern="^\+?(?:84|0)(?:\d{9})$" class="signup-input" placeholder="VD: 0941142465">

                <input class="signup-submit" style="margin-top:2em" type="submit" value="Hoàn tất">
            </form>
            <div class="modal fade" data-bs-backdrop="unset" id="myModal" tabindex="-1" aria-hidden="true" style="z-index: 9999">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content" >
                        <div class="modal-header" style="padding: 0.5em; background: orange; ">
                            <h5 class="modal-title"><i class="fa-solid fa-triangle-exclamation"></i> Thông báo</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p id="modal-message">Giá trị của trường input date không được lớn hơn ngày hiện tại</p>
                        </div>
                        <div class="modal-footer" style="padding: 0.1em">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>


            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script>
                var myDateInput = document.getElementById('myDateInput');

                myDateInput.addEventListener('change', function (event) {
                    var selectedDate = new Date(event.target.value);
                    var today = new Date();

                    // Kiểm tra xem ngày được chọn có lớn hơn hoặc bằng ngày hiện tại không
                    if (selectedDate >= today) {
                        // Hiển thị thông báo bằng modal
                        var myModal = document.getElementById('myModal');
                        var modalMessage = document.getElementById('modal-message');
                        modalMessage.innerHTML = 'Ngày bạn chọn phải nhỏ hơn ngày hiện tại.';
                        var myModalInstance = new bootstrap.Modal(myModal, {
                            backdrop: true,
                            keyboard: true,
                            focus: true
                        });
                        myModalInstance.show();

                        // Thiết lập lại giá trị của thẻ input date thành ngày hiện tại
                        myDateInput.value = today.toISOString().slice(0, 10);
                    }
                });
                var myModal = new bootstrap.Modal(document.getElementById('myModal'), {});
                myModal.hide();
            </script>
            <p class="signup-already" style="margin: 0">
                <a  href="./signupUser" class="cancel signup-submit">Hủy bỏ</a>
            </p>
        </div>
    </body>
</html>
