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
<link rel="stylesheet" href="css_private/res_search.css">
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
            <div class="title_page_search">
				<span class="key_search"> Kết quả tìm kiếm cho </span>
                <span class="value_search"> "${requestScope.keySearch }" </span>
			</div>
			<div class="res_search_container">
                <c:forEach items="${requestScope.listB }" var="o">
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
					</div>
					<span class="div_out-label_sale">-${o.ratio_sale }%</span>
				</div>
				</c:forEach>
			</div>
        </div>
        <jsp:include page="Footer.jsp" />
</body>
</html>