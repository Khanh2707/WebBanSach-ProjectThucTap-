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
<link rel="stylesheet" href="css_private/cart.css">
</head>
<body>
    <script type="text/javascript">
		function doDetail_book(id, id_author) {
			window.location = "detailbook?id="+id+"&id_author="+id_author
		}
	</script>
	<jsp:include page="Header.jsp" />
	<!-- body -->
	<c:set var="o" value="${requestScope.cart }" />
	<div class="body_bg">
		<div class="cart_interface__title">
			<span> GIỎ HÀNG </span> 
			<span> (${sessionScope.size } sản phẩm) </span>
		</div>
		<div class="body">
			<div class="cart_interface-container">
				<div class="cart_interface-container__checkbox_cart">
					<div class="checkbox_cart__navbar">
						<div>
							<input type="checkbox" name="" id="">
						</div>
						<span> Chọn tất cả (${sessionScope.size } sản phẩm) </span> 
						<span> Số lượng </span> 
						<span> Thành tiền </span>
					</div>
					<form action="process" method="post" name="formTrash">
					<div class="checkbox_cart__infor_product-container">
						<c:forEach items="${o.items }" var="i">
						<div class="checkbox_cart__infor_product">
							<div>
								<input type="checkbox" name="" id="">
							</div>
							<div class="checkbox_cart__infor_product-img">
								<a href="#" onclick ="doDetail_book('${i.book.id}', '${i.book.author.id}')"><img
									src="${i.book.img }"
									alt="">
								</a>
							</div>
							<div class="checkbox_cart__infor_product-name_and_price">
								<a href="#" onclick ="doDetail_book('${i.book.id}', '${i.book.author.id}')" class="checkbox_cart__infor_product-name"> 
									${i.book.name }
								</a>
								<div class="checkbox_cart__infor_product-price">
									<c:set var="sale_price" value="${((100 - i.book.ratio_sale) * i.book.origin_price) / 100 }" />
		                            <c:set var="origin_price" value="${i.book.origin_price }" />
									<span class="checkbox_cart__infor_product-price-sale">
										<fmt:formatNumber value="${sale_price }" /><ins>đ</ins>
									</span> 
									<span class="checkbox_cart__infor_product-price-origin">
										<del>
											<fmt:formatNumber value="${origin_price }" /><ins>đ</ins>
										</del>
									</span>
								</div>
							</div>
							<div class="checkbox_cart__infor_product-box-quantity">
								<a href="process?num=-1&id=${i.book.id }" 
								class="checkbox_cart__infor_product-box-quantity-down"
								style="text-decoration: none">
									- 
								</a> 
								<input type="text" name="" id="" value="${i.quantity }"> 
								<a href="process?num=1&id=${i.book.id }" 
								class="checkbox_cart__infor_product-box-quantity-up"
								style="text-decoration: none"> 
									+
								</a>
							</div>
							<span class="checkbox_cart__infor_product-price-last">
								<c:set var="priceXquantity" value="${(i.price * i.quantity) }" />
								<fmt:formatNumber value="${priceXquantity }" /><ins>đ</ins>
							</span>
							<div class="checkbox_cart__infor_product-trash">
								
									<input type="hidden" name="id" value="${i.book.id }">
									<i class="fa-regular fa-trash-can" onclick="Trash()"></i>

							</div>
						</div>
						</c:forEach>
					</div>
					</form>
				</div>

				<div class="cart_interface-container__pay_cart">
					<div class="pay_cart__capital_sum">
						<span> Tổng Số Tiền (gồm VAT) </span> 
						<c:set var="totalMoney" value="${o.totalMoney }" />
						<span> <fmt:formatNumber value="${totalMoney }" /><ins>đ</ins> </span>
					</div>
					<button class="pay_cart__button_pay" type="submit" onclick="Pay()">
						<span> Thanh toán </span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- body -->
	<jsp:include page="Footer.jsp" />
	<script type="text/javascript">
		function Pay() {
			window.location = "checkpay";
		}
	</script>
	<script type="text/javascript">
		function Trash() {
			document.formTrash.submit();
		}
	</script>
</body>
</html>