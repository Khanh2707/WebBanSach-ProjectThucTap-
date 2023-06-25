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
<link rel="stylesheet" href="css_private/filter_book.css">
	<style type="text/css">
		.activeNumPage {
			color: #fff;
	    	background-color: #6d9e82;
		}
		.visibilityAction {
		    visibility: hidden;
		}
	</style>
</head>
<body>
	<script type="text/javascript">
		function doDetail_book(id, id_author) {
			window.location = "detailbook?id="+id+"&id_author="+id_author
		}
	</script>
	<script type="text/javascript">
		function changeSelect() {
			document.getElementById("form_select").submit();
		}
	</script>
	<jsp:include page="Header.jsp" />
	<!-- body -->
	<c:set var="listBook" value="${requestScope.dataB }" />
	<c:set var="keyOrderBy" value="${requestScope.keyOrderBy }" />
	<c:set var="nameOrderBy" value="${requestScope.nameOrderBy }" />
	<c:set var="keyselected" value="${requestScope.keyselected }" />
	<c:set var="page" value="${requestScope.page }" />
	<div class="body">
		<div class="body__path_category">
			<a href="Home.jsp">Trang chủ</a> 
			<span class="t">/</span> 
			<span>Danh mục</span> 
			<span class="t">/</span> 
			<span>${requestScope.category.name == null ? requestScope.author.name : requestScope.category.name }</span>
		</div>
		<div class="body__container_filter_product">
			<div class="container_filter_product__category">
				<span class="category__title">danh mục</span>
				<ul class="category__list">
					<jsp:useBean id="c" class="dal.Category_DAO" scope="page"></jsp:useBean>
					<c:forEach items="${c.all }" var="o">
						<li><a href="listbookfilterbycategoryid?id_category=${o.id }">${o.name }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="container_filter_product__page_product">
				<div class="page_product__header">
					<span class="page_product__header__title">${requestScope.category.name == null ? requestScope.author.name : requestScope.category.name }</span>
					<div class="filter">
						<span>Sắp xếp theo: </span>
						<form action="listselect" id="form_select">
							<select name="list_select" id="list_select" onchange="changeSelect()">
								<jsp:useBean id="s" class="dal.Selected_DAO" scope="page"></jsp:useBean>
								<c:forEach items="${s.all }" var="o">
									<option ${(keyselected == o.id) ? 'selected' : ''} value="${o.id }">${o.name }</option>
								</c:forEach>
							</select>
							<input style="display: none;" type="text" name="keyOrderBy" value="${keyOrderBy }">
							<input style="display: none;" type="text" name="nameOrderBy" value="${nameOrderBy }">
						</form>
					</div>
				</div>
				<form action="" name="f" method="post">
				<input style="display: none;" type="text" name="keyOrderBy" value="${keyOrderBy }">
				<input style="display: none;" type="text" name="nameOrderBy" value="${nameOrderBy }">
				<input style="display: none;" type="text" name="list_select" value="${keyselected }">
				<input style="display: none;" type="text" name="page" value="${page }">
				<div class="page_product__body">
					
					<c:if test="${listBook == null || listBook.size() == 0 }">
						<h2 style="margin: auto; margin-bottom: 50px">No Book</h2>
					</c:if>
					<c:if test="${listBook != null && listBook.size() > 0 }">
					<c:forEach items="${listBook }" var="o">
					<c:set var="id" value="${o.id }" />
					<c:set var="id_author" value="${o.author.id }" />
					<div class="list_product-div_out">
						<div class="list_product-div_in">
							<div class="list_product-div_in-img">
								<a href="#" onclick ="doDetail_book('${id}', '${id_author}')"><img
									src="${o.img }"
									alt="${o.name }"></a>
							</div>
							<div class="test">
								<span>
									<a href="#" onclick ="doDetail_book('${id}', '${id_author}')"
									style="display: block;
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
	                            <div onclick="buy('${id}','toCart')">
	                                <i class="fa-solid fa-bag-shopping"></i>
	                            </div>

	                            <div onclick="buy('${id}','filter')">
	                                <i class="fa-solid fa-cart-shopping"></i>
	                            </div>

                            </div>
						</div>
						<span class="div_out-label_sale">-${o.ratio_sale }%</span>
					</div>
					</c:forEach>
					</c:if>
				</div>
				</form>
				
				<c:if test="">
					
				</c:if>
				<div class="page_product__footer">
					<c:if test="${page > 1 }">
						<div class="page_product__footer__change_page" id="page_product__footer__prev_page">
							<a href="listselect?page=${page - 1 }&id_category=${nameOrderBy == 'all' ? '0' : nameOrderBy}&list_select=${keyselected }&keyOrderBy=${keyOrderBy }&nameOrderBy=${nameOrderBy }"> &lt Trang trước </a>
						</div>
					</c:if>
					<c:if test="${page == 1 }">
						<div style="visibility: hidden;" class="page_product__footer__change_page" id="page_product__footer__prev_page">
						</div>
					</c:if>
					<div class="page_product__footer__number_page">
						<c:forEach begin="${1 }" end="${requestScope.totalNumPage }" var="i">
							<c:if test="${keyOrderBy == 'all' || keyOrderBy == 'category'}">
								<a class="${i == page ? "activeNumPage" : ""}" href="listselect?page=${i }&id_category=${nameOrderBy == 'all' ? '0' : nameOrderBy}&list_select=${keyselected }&keyOrderBy=${keyOrderBy }&nameOrderBy=${nameOrderBy }">${i }</a>
							</c:if>
							<c:if test="${keyOrderBy == 'author'}">
								<a class="${i == page ? "activeNumPage" : ""}" href="listselect?page=${i }&id_category=${nameOrderBy == 'all' ? '0' : nameOrderBy}&list_select=${keyselected }&keyOrderBy=${keyOrderBy }&nameOrderBy=${nameOrderBy }">${i }</a>
							</c:if>
						</c:forEach>
					</div>
					<c:if test="${page < totalNumPage }">
						<div class="page_product__footer__change_page" id="page_product__footer__next_page">
							<a href="listselect?page=${page + 1 }&id_category=${nameOrderBy == 'all' ? '0' : nameOrderBy}&list_select=${keyselected }&keyOrderBy=${keyOrderBy }&nameOrderBy=${nameOrderBy }"> Trang sau &gt </a>
						</div>
					</c:if>
					<c:if test="${page == totalNumPage }">
						<div style="visibility: hidden;" class="page_product__footer__change_page" id="page_product__footer__prev_page">
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- body -->
	<jsp:include page="Footer.jsp" />
	<script src="javascript/active_link.js"></script>
	<script type="text/javascript">
		function buy(id,key) {
			document.f.action = "buy?id="+id+"&num=1&key="+key;
			document.f.submit();
		}
	</script>
</body>
</html>