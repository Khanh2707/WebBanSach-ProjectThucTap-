<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="css_private/info_account.css">
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<div class="container">
        <div class="title">
            <span class="yourAccout">Tài khoản của bạn</span>
            <a href="exit" class="exit">
                <svg xmlns="IMG/IMG_Icon/right-from-bracket-solid.svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#f46716}</style><path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"/></svg>
                <span>Thoát</span>
            </a>
        </div>
        <div class="cart_header">
            <span>Mã đơn hàng</span>
            <span>Ngày đặt</span>
            <span>Trạng thái thanh toán</span>
            <span>Vận chuyển</span>
            <span>Tổng tiền</span>
        </div>
        <div class="cart_body">
            <a>#IPM249010</a>
            <span>Thg 4 17, 2023</span>
            <span class="status">Đã hoàn tất</span>
            <span>Đã giao hàng cho vận chuyển</span>
            <span>25,500₫</span>
        </div>
        <div class="cart_body">
            <a>#IPM235184</a>
            <span>Thg 4 17, 2023</span>
            <span class="status">Đã hoàn tất</span>
            <span>Đã giao hàng cho vận chuyển</span>
            <span>0₫</span>
        </div>
        <div class="cart_body">
            <a>#IPM235183</a>
            <span>Thg 4 17, 2023</span>
            <span class="status">Đã hoàn tất</span>
            <span>Đã giao hàng cho vận chuyển</span>
            <span>0₫</span>
        </div>
        <div class="cart_body">
            <a>#IPM235181</a>
            <span>Thg 4 17, 2023</span>
            <span class="status">Đã hoàn tất</span>
            <span>Đã giao hàng cho vận chuyển</span>
            <span>32,400₫</span>
        </div>
        <div class="cart_body">
            <a>#IPM235181</a>
            <span>Thg 4 17, 2023</span>
            <span class="status">Đã hoàn tất</span>
            <span>Đã giao hàng cho vận chuyển</span>
            <span>32,400₫</span>
        </div>
        <div class="cart_body">
            <a>#IPM235181</a>
            <span>Thg 4 17, 2023</span>
            <span class="status">Đã hoàn tất</span>
            <span>Đã giao hàng cho vận chuyển</span>
            <span>32,400₫</span>
        </div>  
       

        <div class="infor">
            <h1>Trần Khánh</h1>
            <p>nthtpk7h7i@gmail.com</p>
            <p>số nhà 25, ngách 2/113, phố Bằng B</p>
            <p>Vietnam</p>
            <p>0865308698</p>
            <a href="">Xem địa chỉ</a>
        </div>
    </div>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>