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
<link rel="stylesheet" href="css_private/orderLine.css">
<style type="text/css">
	*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

a{
    text-decoration: none;
}

.container{
    margin: 0 160px;
    padding: 30px 15px;
    background: #ffffff;
}

.timeOrder{
    padding: 10px 15px;
    margin-bottom: 20px;
    font-size: 18px;
    color: #000000;
    text-transform: uppercase;
    border-bottom: 1px solid #e0e0e0;
    display: block;
    width: 100%;
}

.backToAccount{
    font-size: 14px;
    color: #131313;
    padding: 0 15px;
}

.backToAccount:hover{
    color: #01a14b;
   
}

.cart_header{
    display: flex;
    justify-content: space-around;
    align-items: center;
    padding: 20px 15px;
    font-size: 14px;
    color: #555555;;
    font-weight: 600;
    border-bottom: 1px solid #e0e0e0;
}



.cart_header span{
    flex: 1;
    text-align: center;
}

.cart_header span:first-child{
    flex: 3;
    text-align: left;
}

.cart_body{
    display: flex;
    justify-content: space-around;
    align-items: center;
    padding: 20px 15px;
    font-size: 14px;
    color: #555555;;
    border-bottom: 1px solid #e0e0e0;
    height: 40px;
}

.cart_body span{
    flex: 1;
    text-align: center;
}

.cart_body a{
    flex: 3;
    text-align: left;
}

.last_header{
    border-bottom:none;
}
</style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<c:set var="orderline" value="${requestScope.orderline }" />
	<c:set var="order" value="${requestScope.order }" />
	<div class="container">
        <span class="timeOrder">ĐƠN HÀNG: ${orderline[0].id_order }</span>
        <a href="List_Order_By_Account" class="backToAccount">Quay lại trang tài khoản</a>
        <div class="cart_header">
            <span>Sản phẩm</span>
            <span>Mã sản phẩm</span>
            <span>Giá</span>
            <span>Số lượng</span>
            <span>Tổng cộng</span>
        </div>
        <c:forEach items="${orderline }" var="o">
        <div class="cart_body">
            <a>[Flash Sale] Dã Thú Đô Thành - Default Title</a>
            <span>${o.id_book }</span>
            <c:set var="price" value="${o.price }" />
            <span class="status"><fmt:formatNumber value="${price }" /><ins>đ</ins></span>
            <span>${o.quantity }</span>
            <c:set var="priceXquantity" value="${o.quantity * o.price }" />
            <span><fmt:formatNumber value="${priceXquantity }" /><ins>đ</ins></span>
        </div>
        </c:forEach>
        <div class="cart_header">
            <span></span>
            <span></span>
            <span></span>
            <span>Giá sản phẩm	</span>
            <c:set var="totalMoney" value="${order.totalMoney }" />
            <span><fmt:formatNumber value="${totalMoney }" /><ins>đ</ins></span>
        </div>
        <div class="cart_header">
            <span></span>
            <span></span>
            <span></span>
            <span>Phí ship	</span>
            <span>20.000<ins>đ</ins></span>
        </div>
        <div class="cart_header last_header">
            <span></span>
            <span></span>
            <span></span>
            <span>Tổng tiền	</span>
            <span><fmt:formatNumber value="${totalMoney + 20000 }" /><ins>đ</ins></span>
        </div>
    </div>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>