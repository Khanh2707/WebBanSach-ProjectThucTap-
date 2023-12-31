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
                thêm thể loại mới
            </span>
            <hr>
            <div class="sign_up__wrapper">
                <div class="sign_up__container">
                	<h3 style="color: red; text-align: center;">${requestScope.error }</h3>
                    <form action="add_category" class="form" id="form-1">
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="id_category">Id Category</label>
                                <input type="text" name="id" id="id_category" placeholder="Id Category">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="name_category">Name Category</label>
                                <input type="text" name="name" id="name_category" placeholder="Name Category">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-input_submit">
                            <input type="submit" value="Thêm thể loại">
                        </div>
                    </form>
                    <div class="sign_in-link_return">
                        <a href="list_category">Quay về</a>
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
					required(`#id_category`, `Chưa nhập Id!`),
					required(`#name_category`, `Chưa nhập Name!`),
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