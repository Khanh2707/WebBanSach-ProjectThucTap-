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
<link rel="stylesheet" href="css_private/sign_up.css">
</head>
<body>
	<div class="body">
            <span class="sign_up__title">
                Hóa đơn chi tiết
            </span>
            <hr>
            <div class="sign_up__wrapper">
                <div class="sign_up__container">
                	<h3 style="color: red; text-align: center;">${requestScope.error }</h3>
                	<c:set var="order" value="${requestScope.order }" />
                	<c:set var="orderline" value="${requestScope.orderline }" />
                    <form action="update_order" method="post" class="form" id="form-1">
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="id_order">Id Order</label>
                                <input type="text" name="id" id="id_order" placeholder="Id Order" value="${order.id }" readonly="readonly">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="date">Date</label>
                                <input type="text" name="date" id="date" placeholder="Date" value="${order.date }" readonly="readonly">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="username_account">Username</label>
                                <input type="text" name="username" id="username_account" placeholder="Username" value="${order.id_account }" readonly="readonly">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="total_money">Total money</label>
                                <input type="text" name="total_money" id="total_money" placeholder="Total money" value="${order.totalMoney }" readonly="readonly">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
	                            <label for="id_book" style="display: block; margin-bottom: 10px;">
	                                Id Book
	                            </label>
	                            
	                            <select name="id_book" id="id_book" style="height: 40px; width: 308px; text-align: center;">
	                                <c:forEach items="${requestScope.orderline }" var="o">
		                                <option>
		                                	<c:set var="price_formmat" value="${o.price }" />
		                                    ${o.quantity } - ${o.id_book } - <fmt:formatNumber value="${price_formmat }" />
		                                </option>
	                                </c:forEach>
	                            </select>
	                            <br>
	                            <span class="form-mesg">
	
	                            </span>
	                    </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="phone">Phone</label>
                                <input type="text" name="phone" id="phone" placeholder="Phone" value="${orderline[0].phone }" readonly="readonly">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="address">Address</label>
                                <input type="text" name="address" id="address" placeholder="Address" value="${orderline[0].address }" readonly="readonly">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="method_pay">Method pay</label>
                                <input type="text" name="method_pay" id="method_pay" placeholder="Method pay" value="${orderline[0].method_pay }" readonly="readonly">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                    </form>
                    <div class="sign_in-link_return">
                        <a href="list_order">Quay về</a>
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