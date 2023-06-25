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
	<style type="text/css">
		.body {
    background-color: #F5F5F5;
}

/* body__slide_banner */
.body__slide_banner {
    margin-top: 30px;
    display: flex;
}

.body__slide_banner img {
    width: 100%;
}

/* body__slide_banner */



/* body__bog_introduce */
.body__box_introduce-bg {
    width: 100%;
}

.body__box_introduce-container {
    width: 80%;
    height: 180px;
    margin: auto;
    display: flex;
    justify-content: space-between;
    padding-top: 20px;
    color: var(--main_color);
}

.box_introduce-border {
    display: flex;
    border: 1px solid var(--main_color);
    height: 90px;
    border-radius: 5px;
    width: 270px;
}

.box_introduce-border div {
    align-self: center;
}

.box_introduce-icon {
    font-size: 20px;
    padding-left: 30px;
    padding-right: 50px;
    width: 30%;
}

.box_introduce-text {
    color: var(--main_color);
    text-transform: uppercase;
    text-align: center;
    width: 70%;
}

/* body__bog_introduce */



/* body__wrapper_product */
.body__wrapper_product-bg {
    width: 100%;
}

.body__wrapper_product-container {
    width: 80%;
    margin: auto;
}

/* body__wrapper_product__menu */
.wrapper_product__ul-1 {
    display: flex;
    list-style: none;
    justify-content: center;
    padding-left: 0px;
    padding-bottom: 50px;
}

.wrapper_product__li-1 {
    display: block;
    padding-bottom: 10px;
    margin: 0px 24px;
    cursor: pointer;
}

.wrapper_product__li-1__a {
    text-decoration: none;
    color: #333333;
    text-transform: uppercase;
    font-weight: bold;
    font-family: Arial, Helvetica, sans-serif;
}

.wrapper_product__li-1:hover .wrapper_product__li-1__a {
    color: var(--main_color);
}

.active_link {
    
}

.active_link > span {
    color: var(--main_color);
    border-bottom: 3px solid var(--main_color);
    padding-bottom: 10px;
}

.disabled {
    display: none !important;
}
/* body__wrapper_product__menu */



/* wrapper_product__list */
.wrapper_product__list_product-container {
    width: 102%;
    display: flex;
    flex-wrap: wrap;
    margin-top: 50px;
    margin-left: -1%;
    margin-right: -1%;
}

.list_product-div_out {
    display: flex;
    flex-direction: column;
    text-align: center;
    position: relative;
    margin-bottom: 30px;
    transition: 0.5s;
    width: 18%;
    height: 400px;
    margin-left: 1%;
    margin-right: 1%;
}

.list_product-div_in {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    text-align: center;
    position: relative;
    margin-bottom: 10px;
    transition: 0.5s;
    overflow: hidden;
}

/* .list_product-div_in:hover {
    box-shadow: 0px 0px 5px 5px #DDDDDD;
    transition: 0.2s;
    transform: translateY(-3px);
} */

.list_product-div_in-img {
    width: 100%;
    height: 85%;
}

.list_product-div_in-img img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.test span a {
    display: block;
    padding-bottom: 5px;
    text-decoration: none;
    color: var(--text_black);
    word-break: break-word;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
}

.test span a:hover {
    color: var(--main_color);
}

.div_in-price-sale {
    color: var(--main_color);
    margin-right: 5px;
}

.div_in-price-origin {
    color: var(--origin_price);
}

.div_out-label_sale {
    position: absolute;
    font-size: 14px;
    color: var(--white_color);
    display: block;
    width: 40px;
    height: 40px;
    line-height: 40px;
    background: url(//theme.hstatic.net/200000287623/1000948667/14/discount.png?v=224) no-repeat center;
    background-size: contain;
    top: -20px;
    right: -15px;
}

.list_product-div_out:hover {
    box-shadow: 0px 0px 5px 5px #DDDDDD;
    transition: 0.2s;
    transform: translateY(-3px);
}

.list_product-div_out:hover .div_in__choice_hover {
    animation: slideToLeft ease .7s forwards;
}

.div_in__choice_hover {
    position: absolute; 
    right: 0; 
    top: 46%; 
    margin-right: 5px; 
    transform: translateX(calc(100% + 5px));
}

.div_in__choice_hover div {
    background-color: var(--main_color); 
    width: 35px; 
    height: 35px; 
    margin-bottom: 10px; 
    border-radius: 100rem; 
    cursor: pointer;
}

.div_in__choice_hover div:hover {
    background-color: #408080;
}

.div_in__choice_hover div i {
    color: white; 
    line-height: 35px;
}

@keyframes slideToLeft {
    from {
        transform: translateX(100%);
    }
    to {
        transform: translateX(0);
    }
}

@keyframes slideToRight {
    from {
        transform: translateX(0);
    }
    to {
        transform: translateX(100%);
    }
}
/* /* wrapper_product__list */ */



/* body__wrapper_product__button_see_more */
.wrapper_product__button_see_all {
	text-align: center;
}

.wrapper_product__button_see_all input {
    width: 110px;
    height: 30px;
    color: var(--white_color);
    background-color: var(--main_color);
    border-radius: 4px;
    border: none;
    cursor: pointer;
}

.wrapper_product__button_see_all input:hover {
    opacity: 0.8;
}
/* body__wrapper_product__button_see_more */

/* body__wrapper_product */


/* body__hnb */
.body__hnb-bg {
    width: 100%;
    background-color: #EEEEEE;
}

.body__hnb-container {
    display: flex;
    width: 80%;
    height: 800px;
    margin: auto;
    align-items: center;
    justify-content: space-between;
}

.hnb_div {
    overflow: hidden;
    width: 80%;
    cursor: pointer;
    border-radius: 5px;
}

.hnb_div:first-child {
    margin-right: 50px;
}

.hnb_div img {
    width: 100%;
    transition: 0.5s;
}

.hnb_div:hover img {
    transform: scale(1.2);
    transition: 0.5s;
}
/* body__hnb */



/* body__post */
.body__post-bg {
    width: 100%;
    background-color: var(--white_color);
}

.body__post-container {
    text-align: center;
    width: 80%;
    margin: auto;
}

.post-title {
    color: var(--text_black);
    padding-top: 60px;
    padding-bottom: 50px;
    font-size: 25px;
    font-weight: bolder;
    text-transform: uppercase;
}

.wrapper_post {
    display: flex;
    justify-content: center;
    align-items: center;
}

.post_div {
    display: flex;
    flex-direction: column;
    width: 390px;
    padding-bottom: 120px;
    margin: 0px 5px;
    transition: 0.5s;
}

.post_div:hover {
    transition: 0.2s;
    transform: translateY(-3px);
}

.post_div img {
    width: 100%;
}

.post_div a {
    display: block;
    margin-bottom: 20px;
    text-decoration: none;
    text-transform: uppercase;
    color: var(--text_black);
    font-weight: bold;
}

.post_div a:hover {
    color: var(--main_color);
}

.post_div span {
    display: block;
    margin-bottom: 20px;
    color: var(--text_69);
}

.slick-arrow {
    color: var(--white_color);
    background-color: #CCCCCC;
    border: none;
    border-radius: 2px;
    top: 250px;
    transition: all 0.2s linear;
}

.slick-arrow:hover {
    background-color: #888888;
}

.slick-prev {
    position: absolute;
    left: 0px;
    z-index: 2;
    cursor: pointer;
    display: block;
    width: 30px;
    height: 30px;
}

.slick-next {
    position: absolute;
    right: 0px;
    z-index: 2;
    cursor: pointer;
    display: block;
    width: 30px;
    height: 30px;
}

.slick-dots {
    position: absolute;
    bottom: 50px;
    left: 50%;
    transform: translateX(-50%);
    list-style: none;
    display: flex !important;
    align-items: center;
    justify-content: center;
}

.slick-dots li {
    margin: 0px 5px;
}

.slick-dots button {
    font-size: 0;
    height: 12px;
    border-radius: 100rem;
    border: none;
    background: #CCCCCC;
    transition: all 0.2s;
}

.slick-dots button:hover {
    cursor: pointer;
    background: #999999;
}

.slick-dots .slick-active button {
    background: #999999;
}

/* body__post */
	</style>
</head>
<body>
	<script type="text/javascript">
		function doDetail_book(id, id_author) {
			window.location = "detailbook?id="+id+"&id_author="+id_author
		}
	</script>
	
	<div class="wrapper">
		<jsp:include page="Header.jsp" />
		<!-- body -->
		<div class="body">

			<!-- body__slide_banner -->
			<div class="body__slide_banner">
			<jsp:useBean id="banner" class="dal.Banner_DAO"></jsp:useBean>
			<c:forEach items="${banner.all }" var="bn">
				<a href="listbookfilterbycategoryid?id_category=${0 }"><img src="${bn.img }" alt=""></a>
			</c:forEach>
			</div>
			<!-- body__slide_banner -->

			<!-- body__box_introduce -->
			<div class="body__box_introduce-bg">
				<div class="body__box_introduce-container">

					<div class="box_introduce-border">
						<div class="box_introduce-icon">
							<i class="fa-sharp fa-solid fa-truck-arrow-right fa-2xl"></i>
						</div>
						<div class="box_introduce-text">
							<span>ưu đãi<br>vận chuyển
							</span>
						</div>
					</div>

					<div class="box_introduce-border">
						<div class="box_introduce-icon">
							<i class="fa-solid fa-gift fa-2xl"></i>
						</div>
						<div class="box_introduce-text">
							<span>thể loại sách<br>phong phú
							</span>
						</div>
					</div>

					<div class="box_introduce-border">
						<div class="box_introduce-icon">
							<i class="fa-solid fa-money-check-dollar fa-2xl"></i>
						</div>
						<div class="box_introduce-text">
							<span>khuyến mãi<br>hấp dẫn
							</span>
						</div>
					</div>

					<div class="box_introduce-border">
						<div class="box_introduce-icon">
							<i class="fa-solid fa-phone-volume fa-2xl"></i>
						</div>
						<div class="box_introduce-text">
							<span>hotline:<br>0123456789<br>9876543210
							</span>
						</div>
					</div>

				</div>
			</div>
			<!-- body__box_introduce -->

			<!-- body__wrapper_product -->
			<div class="body__wrapper_product-bg">
				<div class="body__wrapper_product-container">

					<!-- body__wrapper_product__menu -->
					<ul class="wrapper_product__ul-1">
						<li class="wrapper_product__li-1 active_link">
							<span class="wrapper_product__li-1__a">
								sách mới
							</span>
						</li>
						<li class="wrapper_product__li-1">
							<span class="wrapper_product__li-1__a">
								sách bán chạy
							</span>
						</li>
						<li class="wrapper_product__li-1">
							<span class="wrapper_product__li-1__a">
								flash sale
							</span>
						</li>
					</ul>
					
					<form action="" name="f" method="post">
					<!-- body__wrapper_product__menu -->
					<div class="wrapper_product__list_product-container_and_button_see_all">
						<!-- body__wrapper_product__list_product -->
	                    <div class="wrapper_product__list_product-container" value="0">
							<jsp:useBean id="top10" class="dal.OrderByDAO" scope="page"></jsp:useBean>
							<c:forEach items="${top10.all10 }" var="o">
	                        <div class="list_product-div_out">
	                            <div class="list_product-div_in">
	                                <div class="list_product-div_in-img">
	                                    <a href="#" onclick ="doDetail_book('${o.id}', '${o.author.id}')"><img
	                                            src="${o.img }"
	                                            alt=""></a>
	                                </div>
	                                <div class="test">
		                                <span>
			                                <a href="#" onclick ="doDetail_book('${o.id}', '${o.author.id}')" 
			                                style="
			                                display: block;
										    padding: 0px 20px;
										    padding-bottom: 5px;
										    white-space: nowrap;
										    overflow: hidden;
										    text-overflow: ellipsis;">
			                                	${o.name }
			                                </a>
		                                </span>
		                                <div class="div_in-price">
		                                	<c:set var="sale_price" value="${((100 - o.ratio_sale) * o.origin_price) / 100 }" />
		                                	<c:set var="origin_price" value="${o.origin_price }" />
		                                    <span class="div_in-price-sale"><fmt:formatNumber value="${sale_price }" /><ins>đ</ins></span>
		                                    <span class="div_in-price-origin"><del><fmt:formatNumber value="${origin_price }" /><ins>đ</ins></del></span>
		                                </div>
	                                </div>
	                                <div class="div_in__choice_hover">
	                                    <div class="eye">
	                                        <i class="fa-solid fa-eye"></i>
	                                    </div>
	                                    <div onclick="buy('${o.id}','${'toCart' }')">
	                                        <i class="fa-solid fa-bag-shopping"></i>
	                                    </div>
	                                    <div onclick="buy('${o.id}','${'home' }')">
	                                        <i class="fa-solid fa-cart-shopping"></i>
	                                    </div>
                                	</div>
	                            </div>
	                            <span class="div_out-label_sale">-${o.ratio_sale }%</span>
	                        </div>
	                        </c:forEach>
	                        <!-- body__wrapper_product__button_see_more -->
                        <div class="wrapper_product__button_see_all"
                        style="
                        width: 100%;  
                        text-align: center; 
                        padding-top: 20px; 
                        padding-bottom: 100px;">
	                        <form action="listselect" id="form_select">
	                        	<input style="display: none;" type="text" name="list_select" value="mn">
	                        	<input style="display: none;" type="text" name="keyOrderBy" value="all">
								<input style="display: none;" type="text" name="nameOrderBy" value="all">
	                            <input type="submit" value="Xem thêm">
                            </form>
                        </div>
                        <!-- body__wrapper_product__button_see_more -->
	                    </div>
                    	
                    </div>
                    </form>
				</div>
			</div>
			<!-- body__wrapper_product -->

			<!-- body__hnb -->
			<div class="body__hnb-bg">
				<div class="body__hnb-container">
					<jsp:useBean id="hnb" class="dal.Hnb_DAO" scope="page"></jsp:useBean>
					<c:forEach items="${hnb.all }" var="o">
						<div class="hnb_div">
							<a href="#" onclick ="doDetail_book('${o.book.id}', '${o.book.author.id}')"><img src="${o.img }" alt=""></a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- body__hnb -->

			<!-- body__post -->
			<div class="body__post-bg">
				<div class="body__post-container">
					<div class="post-title">
						<span>bài viết mới</span>
					</div>
					<div class="wrapper_post">
						<div class="post_div">
							<a href="Detail_News.jsp"><img
								src="IMG/IMG_News/thm_63f5a20d64ac4878a98d0698f1b64cd0_large.jpg"
								alt=""></a> <a href="">[điểm sách] okitegami kyoko - thư tiến tử - đi tìm sự thật về kiệt tác cuối đời của một nhân vật tầm cỡ</a> 
								<span>Tiếp nối thành công của OKITEGAMI KYOKO - SỔ GHI CHÉP, tập thứ hai OKITEGAMI KYOKO - THƯ TIẾN CỬ thuộc loạt truyện về nàng thám tử lãng quên của cây bút gạo cội...</span>
							<hr>
						</div>
						<div class="post_div">
							<a href=""><img
								src="IMG/IMG_News/tiktok_shop_ipm_viet_nam_khai_truong_c9a30c7112df4fd99764028a169c46fa_large.jpg"
								alt=""></a> <a href="">[sự kiện] ipm chính thức khai
								trương tiktok shop cùng 1001 ưu đãi hấp dẫn!</a> <span>Ngày
								04.04.2023, IPM chính thức khai trương Tiktok Shop IPM Việt Nam,
								với mong muốn đưa các tựa sách hấp dẫn tiếp cận gần hơn tới các
								độc giả trên toàn quốc. Để chào mừng s...</span>
							<hr>
						</div>
						<div class="post_div">
							<a href=""><img
								src="IMG/IMG_News/1_8f094924c5354db0a7ff2ad7bf929db8_large.jpg" alt=""></a>
							<a href="">[sự kiện] gặp gỡ và ký tặng sách manga cùng bộ đôi
								tác giả "tình đầu nhạt phai"</a> <span>Chiều ngày 25/2/2023,
								tại nhà sách Nguyễn Huệ (40 Nguyễn Huệ, P. Bến Nghé, Q. 1, TP.
								HCM) đã diễn ra sự kiện gặp gỡ và ký tặng cùng bộ đôi tác giả
								Wataru Hinekure và họa sĩ minh...</span>
							<hr>
						</div>
						<div class="post_div">
							<a href=""><img
								src="IMG/IMG_News/nui_chuot_quet_trinh_tham_trung_quoc_hay_c41187e9cfb34f8cb6845d3446b859a6_large.jpg"
								alt=""></a> <a href="">[điểm sách] núi chuột quét - bóng
								tối ẩn sau ánh lửa nghiệt ngã</a> <span>Núi chuột quét là một
								trong những tác phẩm nổi bật nhất của Hồ Diễn Vân - cây bút tài
								năng của nền trinh thám Trung Quốc. Sức hấp dẫn của tác phẩm
								không chỉ đến từ cốt truyện cô...</span>
							<hr>
						</div>
					</div>
				</div>
			</div>
			<!-- body__post -->
		</div>
		<!-- body -->
		<jsp:include page="Footer.jsp" />
	</div>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script src="javascript/slide.js"></script>
	<script src="javascript/active_link.js"></script>
	<script type="text/javascript">
		function buy(id,key) {
			document.f.action = "buy?id="+id+"&num=1&key="+key;
			document.f.submit();
		}
	</script>
</body>
</html>