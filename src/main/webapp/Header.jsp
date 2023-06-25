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
<link rel="stylesheet" href="css_public/header.css">
</head>
<body>
	<c:if test="${sessionScope.account.fullname != null && sessionScope.account.fullname == 'sa'}">
		<script type="text/javascript">
			window.onload = function () {
				let log = document.getElementsByClassName('header__navbar-login')[0];
				log.classList.remove('header__navbar-login--not_login');
				log.classList.add('header__navbar-login--are_login');
				document.getElementById("tqlmn").setAttribute("style","display: block");
			}
		</script>
	</c:if>
	
	<c:if test="${sessionScope.account.fullname != null && sessionScope.account.fullname != 'sa'}">
		<script type="text/javascript">
			window.onload = function () {
				let log = document.getElementsByClassName('header__navbar-login')[0];
				log.classList.remove('header__navbar-login--not_login');
				log.classList.add('header__navbar-login--are_login');
			}
		</script>
	</c:if>
	
	<script type="text/javascript">
		
	</script>
	
	<c:if test="${sessionScope.account.fullname == null}">
		<script type="text/javascript">
			window.onload = function () {
				let log = document.getElementsByClassName('header__navbar-login')[0];
				log.classList.remove('header__navbar-login--are_login');
				log.classList.add('header__navbar-login--not_login');
			}
		</script>
	</c:if>
	<script type="text/javascript">
		function doSearch() {
			document.getElementById("formSearch").submit();
		}
	</script>
	<script type="text/javascript">
		
		function hasLogin() {
			let log = document.getElementsByClassName('header__navbar-login')[0];
			log.classList.remove('header__navbar-login--not_login');​
		}
	</script>
	<!-- header -->
	<header class="header">

		<!-- header__navbar -->
		<div class="header__navbar-bg">
			<div class="header__navbar-container">
				<div class="header__navbar-title">
					<span>Nhà sách trực tuyến Karma</span>
				</div>
				<!-- Are login: header__navbar-login--not_login -->
				<!-- No login: header__navbar-login--are_login -->
				<div class="header__navbar-login header__navbar-login--not_login">
					<span class="navbar-login--not_login_text">
						<a href="Sign_up.jsp">Đăng ký</a> | <a href="Sign_in.jsp">Đăng nhập</a>
					</span> 
					<span class="navbar-login--are_login_text">
						<a href="Info_account.jsp">Xin chào: ${sessionScope.account.fullname }</a> | <a href="exit">Đăng xuất</a>
					</span>
				</div>
			</div>
		</div>
		<!-- header__navbar -->

		<!-- header__search -->
		<div class="header__search-bg">
			<div class="header__search-container">
				<div class="header__logo">
					<a href="Home.jsp"><img src="IMG/IMG_Logo/Karma-logo.png"
						alt="">
					</a>
				</div>
				<div class="header__search_bar">
					<form action="listsearch" id="formSearch" style="display: flex">
						<input name="input_search" id="input_search" type="text" placeholder="Tìm kiếm...">
						<button type="submit" onclick="doSearch()">
							<svg height="30px" class="SVGRoot" version="1.1"
								viewBox="0 0 100 60" width="64px"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:cc="http://creativecommons.org/ns#"
								xmlns:dc="http://purl.org/dc/elements/1.1/"
								xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
								xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
								xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
								xmlns:svg="http://www.w3.org/2000/svg">
	                                <defs class="defs3848"></defs>
	                                <g class="layer1">
	                                    <g class="g5183"
									style="stroke:#000000" transform="translate(25.5,-27)">
	                                        <circle class="fil0 str1"
									cx="0.73810571" cy="53.392174" class="circle15" r="20.063322"
									style="clip-rule:evenodd;fill:none;fill-rule:evenodd;stroke:#FFFFFF;stroke-width:2.00005412;image-rendering:optimizeQuality;shape-rendering:geometricPrecision;text-rendering:geometricPrecision">
	                                        </circle>
	                                        <line class="fil0 str2"
									id="line25"
									style="clip-rule:evenodd;fill:none;fill-rule:evenodd;stroke:#FFFFFF;stroke-width:3.99974346;stroke-linecap:round;stroke-linejoin:round;image-rendering:optimizeQuality;shape-rendering:geometricPrecision;text-rendering:geometricPrecision"
									x1="15.617603" x2="30.305107" y1="68.559662" y2="83.151169"></line>
	                                        <path class="fil0 str0"
									d="m -12.701441,53.392174 c 0,-7.391751 6.047795,-13.439547 13.43954602,-13.439547"
									class="path281"
									style="clip-rule:evenodd;fill:none;fill-rule:evenodd;stroke:#FFFFFF;stroke-width:2.00005412;stroke-linecap:round;stroke-linejoin:round;image-rendering:optimizeQuality;shape-rendering:geometricPrecision;text-rendering:geometricPrecision">
	                                        </path>
	                                    </g>
	                                </g>
	                            </svg>
						</button>
					</form>
				</div>
				<div class="header__cart">
					<a href="show" class="header__cart-link">
						<div class="cart__cart_badge">
							<i class="fa-solid fa-cart-plus fa-2xl"></i> 
							<span>${sessionScope.size }</span>
						</div>
						<div class="cart__text">
							<span class="cart_text">Giỏ hàng</span><br> 
							<span>${sessionScope.size }</span> 
							<span>sản phẩm</span>
						</div>
					</a>
					<!-- No product: cart__cart_badge--hover--no_product -->
					<!-- Has product: cart__cart_badge--hover--has_product -->
					<div class="cart__cart_badge--hover cart__cart_badge--hover--no_product">
						<img class="cart__cart_badge--hover--no_product-img"
							src="IMG/IMG_EmptyCart/empty_cart.jpg" alt=""> 
							<span class="cart__cart_badge--hover--no_product-msg"> 
								Chưa có sản phẩm 
							</span>

						<header class="cart_badge__header">
							<span>Số lượng sản phẩm: </span> 
							<span>${sessionScope.size }</span>
						</header>
						<ul class="cart_badge__list">
							<li class="cart_badge__items">
								<div class="cart_badge__items-img">
									<a href="detail_product.html"><img
										src="IMG/IMG_Book/Kinh Tế/Chấn Hưng Nhật Bản/chan_hung_nhat_ban.jpg"
										alt="">
									</a>
								</div>
								<div class="cart_badge__items-info">
									<a class="cart_badge__items-name" href="detail_product.html">
										Chấn Hưng Nhật Bản 
									</a>
									<div class="cart_badge__items-description">
										<span class="items-description-version"> Bản thường </span> <br>
										<span class="items-description-quantity"> 154,000 x 2 </span>
									</div>
								</div> 
								<span class="cart_badge__items-times">
									<a href=""><i class="fa-solid fa-circle-xmark"></i></a>
								</span>
							</li>
						</ul>
						<div class="cart_badge__capital_sum">
							<span>
								Tổng tiền: 
							</span> 
							<span>
								154,000<ins>đ</ins>
							</span>
						</div>
						<a href="" class="wrapper_test"> 
							<span> 
								Thanh toán <i class="fa-solid fa-chevron-right"></i>
							</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- header__search -->

		<!-- header__menu -->
		<div class="header__menu-bg">
			<div class="header__menu-container">
				<ul class="header__menu__ul-1">
					<li class="header__menu__li-1"><a
						class="header__menu__li-1__a" href="Home.jsp">trang chủ</a></li>
					<li class="header__menu__li-1"><a
						class="header__menu__li-1__a" href="listselect?id_category=${0 }&list_select=az&keyOrderBy=all&nameOrderBy=all">sản phẩm</a>
						<ul class="header__menu__ul-2">
							<jsp:useBean id="c" class="dal.Category_DAO" scope="page"></jsp:useBean>
							<c:forEach items="${c.all }" var="o">
								<li><a href="listbookfilterbycategoryid?id_category=${o.id }">${o.name }</a></li>
							</c:forEach>
						</ul></li>
					<li class="header__menu__li-1"><a
						class="header__menu__li-1__a" href="">tin tức</a></li>
					<li class="header__menu__li-1"><a
						class="header__menu__li-1__a" href="Introduce.jsp">về karma</a></li>
					<li id="tqlmn" class="header__menu__li-1" style="display: none;">
						<a class="header__menu__li-1__a" href="list_book">Trang quản lý</a>
					</li>
				</ul>
			</div>
		</div>
		<hr class="hr--style">
		<!-- header__menu -->
	</header>
	<!-- header -->
</body>
</html>