<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nhà sách trực tuyến Karma</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="icon" type="image/x-icon" href="IMG/IMG_Logo/Karma-logo.png">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="css_public/base.css">
<link rel="stylesheet" href="css_private/sign_up.css">
</head>
<body>
	<jsp:include page="Header.jsp" />
	<!-- body -->
        <div class="body">
            <span class="sign_up__title">
                tạo tài khoản
            </span>
            <hr>
            <h3 style="color: red; text-align: center; display: block; margin-top: 30px;">${requestScope.error }</h3>
            <div class="sign_up__wrapper">
                <div class="sign_up__container">
                    <form action="register" class="form" id="form-1">
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="fullName">Tên đăng nhập</label>
                                <input type="text" name="fullName" id="fullName" placeholder="Tên">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="email">Email</label>
                                <input type="text" name="email" id="email" placeholder="Email">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="password">Mật khẩu</label>
                                <input type="password" name="password" id="password" placeholder="Mật khẩu">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="password_confirmation">Nhập lại mật khẩu</label>
                                <input type="password" name="password_confirmation" id="password_confirmation"
                                    placeholder="Nhập lại mật khẩu">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-input_submit">
                            <input type="submit" value="Đăng ký">
                        </div>
                    </form>
                    <div class="sign_in-link_return">
                        <a href="Sign_in.jsp">Quay về</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- body -->
	<jsp:include page="Footer.jsp" />

	<script src="javascript/Validator.js"></script>
	<script>
	Validator({
        form: `#form-1`,
        mesg: `.form-mesg`,
        formGroup: `.sign_up-infor-div`,
        rules: [
            required(`#fullName`, `Chưa nhập tên!`),
            required(`#email`, `Chưa nhập email!`),
            ruleEmail(`#email`, `Email không đúng định dạng!`),
            required(`#password`, `Chưa nhập password!`),
            rulePassword(`#password`, `Phải có chữ hoa, chữ thường, số, ký tự đặc biệt, tối thiểu 7 ký tự và tối đa 14 ký tự!`),
            required(`#password_confirmation`, `Chưa nhập xác nhận password!`),
            equalPassword(`#password_confirmation`, function () {
                return document.querySelector(`#form-1 #password`).value
            }, `Mật khẩu không trùng khớp!`),
        ],
    })
	</script>
</body>
</html>