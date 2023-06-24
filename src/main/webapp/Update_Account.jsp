<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div class="body">
            <span class="sign_up__title">
                Sửa thông tin tài khoản
            </span>
            <hr>
            <div class="sign_up__wrapper">
                <div class="sign_up__container">
                	<h3 style="color: red; text-align: center;">${requestScope.error }</h3>
                	<c:set var="account" value="${requestScope.account }" />
                    <form action="update_account" method="post" class="form" id="form-1">
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="fullname_account">Fullname</label>
                                <input type="text" name="fullname" id="fullname_account" placeholder="Fullname" value="${account.fullname }" readonly="readonly">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="username_account">Username</label>
                                <input type="text" name="username" id="username_account" placeholder="Username" value="${account.username }">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="password_account">Password</label>
                                <input type="text" name="password" id="password_account" placeholder="Password" value="${account.password }">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="amount_account">Amount</label>
                                <input type="text" name="amount" id="amount_account" placeholder="Amount" value="${account.amount }" readonly="readonly">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div invalid">
                            <label for="" style="display: block; margin-bottom: 10px;">
                                Role:
                            </label>
                            <label for="role_1">Role 1</label>
                            <input ${account.role == 1 ? 'checked' : '' } type="radio" name="role" value="1" id="role_1" style="margin-right: 20px;">
                            <label for="role_0">Role 0</label>
                            <input ${account.role == 0 ? 'checked' : '' } type="radio" name="role" value="0" id="role_0">
                            <br>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-input_submit">
                            <input type="submit" value="Thay đổi">
                        </div>
                    </form>
                    <div class="sign_in-link_return">
                        <a href="list_account">Quay về</a>
                    </div>
                </div>
            </div>
        </div>
    <script src="javascript/Validator.js"></script>
	<script>
		Validator({
			form : `#form-1`,
			mesg : `.form-mesg`,
			formGroup : `.sign_up-infor-div`,
			rules : [
					required(`#fullname_account`, `Chưa nhập Fullname!`),
					required(`#username_account`, `Chưa nhập Username!`),
					required(`#password_account`, `Chưa nhập Password!`),
					required(`#amount_account`, `Chưa nhập Amount!`),
					required(`input[name="role"]`, `Chưa chọn Role!`),
					],
			/*
			submitSuccess : function(data) {
				console.log(data)
			}
			*/
		})
	</script>
</body>
</html>