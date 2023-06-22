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
<link rel="stylesheet" href="css_private/detail_book.css">
</head>
<body>
	<script type="text/javascript">
		function doDetail_book(id, id_author) {
			window.location = "detailbook?id="+id+"&id_author="+id_author
		}
	</script>
	<jsp:include page="Header.jsp" />
	<!-- body -->
	<div class="body">
		<c:set var="o" value="${requestScope.book }" />
		<div class="body__path_category_product">
			<a href="Home.jsp"
			onMouseOver="this.style.color='red'" 
			onMouseOut="this.style.color='black'"
			>Trang chủ</a> 
			<span class="t">/</span> 
			<a href="listbookfilterbycategoryid?id_category=${book.category.id }"
			onMouseOver="this.style.color='red'" 
			onMouseOut="this.style.color='black'"
			>${o.category.name }</a> 
			<span class="t">/</span> 
			<span>${o.name }</span>
		</div>
		<div class="body__detail_product">
			<div class="detail_product__img_and_info">
				<div class="detail_product__img">
					<img
						src="${o.img }"
						alt=""> <span class="div_out-label_sale">-${o.ratio_sale }%</span>
				</div>
				<div class="detail_product__info">
					<div class="detail_product__info-title">
						<span> ${o.name } </span>
					</div>
					<div class="detail_product__info-price">
						<c:set var="sale_price" value="${((100 - o.ratio_sale) * o.origin_price) / 100 }" />
		                <c:set var="origin_price" value="${o.origin_price }" />
						<span class="detail_product__info-price-sale"> 
							<fmt:formatNumber value="${sale_price }" /><ins>đ</ins>
						</span> 
						<span class="detail_product__info-price-origin"> 
							<del>
								<fmt:formatNumber value="${origin_price }" /><ins>đ</ins>
							</del>
						</span>
					</div>
					<div class="detail_product__info-description">
						<div class="detail_product__info-description-author info-description-container">
							<span class="detail_product__info-description-author-key info-description-key">
								Tác giả: 
							</span> 
							<a href="listbookfilterbyauthorid?id_author=${book.author.id }" style="color: black; text-decoration: none" 
							onMouseOver="this.style.color='red'" 
							onMouseOut="this.style.color='black'"
							class="detail_product__info-description-author-value">
								${o.author.name }
							</a>
						</div>
						<div
							class="detail_product__info-description-publishing_company info-description-container">
							<span
								class="detail_product__info-description-publishing_company-key info-description-key">
								Nhà xuất bản: </span> <span
								class="detail_product__info-description-publishing_company-value">
								${o.publish_company.name } </span>
						</div>
						<div
							class="detail_product__info-description-publishing_year info-description-container">
							<span
								class="detail_product__info-description-publishing_year-key info-description-key">
								Năm xuất bản: </span> <span
								class="detail_product__info-description-publishing_year-value">
								${o.year_publish } </span>
						</div>
					</div>
					<div class="modal_body__info-content">
						<span class="modal_body__info-content-key info-description-key">
							Nội dung: 
						</span> 
						<br> 
						<span class="modal_body__info-content-value" style="
							overflow: hidden;
							text-overflow: ellipsis;
							display: -webkit-box;
							-webkit-box-orient: vertical;
							-webkit-line-clamp: 11;
							overflow: hidden;
							text-overflow: ellipsis;
							line-height: 25px;">
							${o.content }
						</span>
					</div>
					<div class="detail_product__info-version">
						<span
							class="detail_product__info-version-key info-description-key">
							Phiên bản </span> <br> <select name="" id=""
							class="detail_product__info-version-value">
							<option value="">Bản thường</option>
						</select>
					</div>
					<div class="detail_product__quantity_box">
						<span class="quantity_box-down"> - </span> <input type="text"
							value="1"> <span class="quantity_box-up"> + </span>
					</div>
					<div class="detail_product__info-button">
						<a href="" class="detail_product__info-button_add_cart"> Thêm
							vào giỏ hàng </a> <a href="" class="detail_product__info-button_buy">
							Mua ngay </a>
					</div>
				</div>
			</div>
		</div>
		<div class="content-full"
		style="border-bottom: 1px solid #ddd;
		padding: 40px 20px;">
			<span style="
			display: block;
			text-align: center;
		    font-size: 20px;
		    font-weight: bold;
		    color: #333;
			font-family: Arial, Helvetica, sans-serif;"> NỘI DUNG CHI TIẾT 
			</span>
			<br>
			<p style="text-indent: 50px; line-height: 25px;">
				${o.content  }
			</p>
		</div>
		<div class="body__books_same_author">
			<div class="books_same_author__title">
				<span> SÁCH CÙNG TÁC GIẢ </span>
			</div>
			<div class="books_same_author-container_product">
				<c:forEach items="${requestScope.listbooknotinidbook }" var="o">
				<c:set var="id" value="${o.id }" />
				<c:set var="id_author" value="${o.author.id }" />
				<div class="list_product-div_out">
					<div class="list_product-div_in">
						<div class="list_product-div_in-img">
							<a href="#" onclick ="doDetail_book('${id}', '${id_author}')"><img
								src="${o.img }"
								alt=""></a>
						</div>
						<div class="test">
							<span>
								<a href="#" onclick ="doDetail_book('${id}', '${id_author}')">
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
					</div>
					<span class="div_out-label_sale">-${o.ratio_sale }%</span>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- body -->
	<jsp:include page="Footer.jsp" />
</body>
</html>