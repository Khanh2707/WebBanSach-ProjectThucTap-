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
<link rel="stylesheet" href="css_private/cart.css">
</head>
<body>
	<jsp:include page="Header.jsp" />
	<!-- body -->
	<div class="body_bg">
		<div class="cart_interface__title">
			<span> GIỎ HÀNG </span> <span> (2 sản phẩm) </span>
		</div>
		<div class="body">
			<div class="cart_interface-container">
				<div class="cart_interface-container__checkbox_cart">
					<div class="checkbox_cart__navbar">
						<div>
							<input type="checkbox" name="" id="">
						</div>
						<span> Chọn tất cả (2 sản phẩm) </span> <span> Số lượng </span> <span>
							Thành tiền </span>
					</div>
					<div class="checkbox_cart__infor_product-container">
						<div class="checkbox_cart__infor_product">
							<div>
								<input type="checkbox" name="" id="">
							</div>
							<div class="checkbox_cart__infor_product-img">
								<a href=""><img
									src="IMG/IMG_Book/Trinh Thám - Kinh Dị/Núi Chuột Quét/nui_chuot_quet.jpg"
									alt=""></a>
							</div>
							<div class="checkbox_cart__infor_product-name_and_price">
								<a href=""
									class="checkbox_cart__infor_product-name"> Núi chuột quét
								</a>
								<div class="checkbox_cart__infor_product-price">
									<span class="checkbox_cart__infor_product-price-sale">
										150.000<ins>đ</ins>
									</span> <span class="checkbox_cart__infor_product-price-origin">
										<del>
											190.000
											<ins>đ</ins>
										</del>
									</span>
								</div>
							</div>
							<div class="checkbox_cart__infor_product-box-quantity">
								<span class="checkbox_cart__infor_product-box-quantity-down">
									- </span> <input type="text" name="" id="" value="1"> <span
									class="checkbox_cart__infor_product-box-quantity-up"> +
								</span>
							</div>
							<span class="checkbox_cart__infor_product-price-last">
								150.000<ins>đ</ins>
							</span>
							<div class="checkbox_cart__infor_product-trash">
								<i class="fa-regular fa-trash-can"></i>
							</div>
						</div>

						<div class="checkbox_cart__infor_product">
							<div>
								<input type="checkbox" name="" id="">
							</div>
							<div class="checkbox_cart__infor_product-img">
								<a href=""><img
									src="IMG/IMG_Book/Trinh Thám - Kinh Dị/Núi Chuột Quét/nui_chuot_quet.jpg"
									alt=""></a>
							</div>
							<div class="checkbox_cart__infor_product-name_and_price">
								<a href=""
									class="checkbox_cart__infor_product-name"> Núi chuột quét
								</a>
								<div class="checkbox_cart__infor_product-price">
									<span class="checkbox_cart__infor_product-price-sale">
										150.000<ins>đ</ins>
									</span> <span class="checkbox_cart__infor_product-price-origin">
										<del>
											190.000
											<ins>đ</ins>
										</del>
									</span>
								</div>
							</div>
							<div class="checkbox_cart__infor_product-box-quantity">
								<span class="checkbox_cart__infor_product-box-quantity-down">
									- </span> <input type="text" name="" id="" value="1"> <span
									class="checkbox_cart__infor_product-box-quantity-up"> +
								</span>
							</div>
							<span class="checkbox_cart__infor_product-price-last">
								150.000<ins>đ</ins>
							</span>
							<div class="checkbox_cart__infor_product-trash">
								<i class="fa-regular fa-trash-can"></i>
							</div>
						</div>
					</div>
				</div>

				<div class="cart_interface-container__pay_cart">
					<div class="pay_cart__capital_sum">
						<span> Tổng Số Tiền (gồm VAT) </span> <span> 0<ins>đ</ins>
						</span>
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
			window.location = "Pay_book.jsp";
		}
	</script>
</body>
</html>