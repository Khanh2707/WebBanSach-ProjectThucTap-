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
<link rel="stylesheet" href="css_private/admin_page.css">
<style type="text/css">
		.activeNumPage {
			color: #fff;
	    	background-color: #6d9e82;
		}
		.visibilityAction {
		    visibility: hidden;
		}
		.menu_col ul li a {
			color: black;
			text-decoration: none;
		}
		.activeMenu {
			background-color: rgb(222, 222, 222);
		}
</style>
</head>
<body>
	<script type="text/javascript">
		function doDeleteSP(id) {
			if (confirm("Are you sure want delete " +id)) {
				window.location = "delete_book?id="+id;
			}
		}
	</script>
	<script type="text/javascript">
		function doDeleteTG(id) {
			if (confirm("Are you sure want delete " +id)) {
				window.location = "delete?id="+id;
			}
		}
	</script>
	<script type="text/javascript">
		function doDeleteTL(id) {
			if (confirm("Are you sure want delete " +id)) {
				window.location = "delete_category?id="+id;
			}
		}
	</script>
	<script type="text/javascript">
		function doDeleteNXB(id) {
			if (confirm("Are you sure want delete " +id)) {
				window.location = "delete_publish_company?id="+id;
			}
		}
	</script>
	<script type="text/javascript">
		function doDeleteBanner(id) {
			if (confirm("Are you sure want delete " +id)) {
				window.location = "delete_banner?id="+id;
			}
		}
	</script>
	<script type="text/javascript">
		function doDeleteHnb(id) {
			if (confirm("Are you sure want delete " +id)) {
				window.location = "delete_hnb?id="+id;
			}
		}
	</script>
	<script type="text/javascript">
		function doDeleteAcc(username) {
			if (confirm("Are you sure want delete " +username)) {
				window.location = "delete_account?username="+username;
			}
		}
	</script>
	<div class="wrapper">
        <c:set var="keySelected" value="${requestScope.keySelected }" />
        <div class="menu_col">
            <ul>
	            <li>
	                <a href="list_book">Quản lý sản phẩm</a>
	            </li>
	            <li>
	                <a href="list">Quản lý tác giả</a>
	            </li>
	            <li>
	                <a href="list_publish_company">Quản lý NXB</a>
	            </li>
	            <li>
	                <a href="list_category">Quản lý thể loại</a>
	            </li>
	            <li>
	                <a href="list_banner">Quản lý banner</a>
	            </li>
	            <li>
	                <a href="list_hnb">Quản lý ảnh hnb</a>
	            </li>
	            <li>
	                <a href="list_account">Quản lý tài khoản</a>
	            </li>
	            <li>
	                <a href="list_order">Quản lý hóa đơn</a>
	            </li>
	            <li>
	                <a href="Home.jsp">Về trang người dùng</a>
	            </li>
            </ul>
        </div>
        <div class="content">
        	<c:if test="${keySelected == 'sp'}">
	        	<div class="content_book">
		            <div class="header">
		                <span class="title">
		                    Quản lý sách
		                </span>
		                <a class="button_add" href="Add_Book.jsp">
		                    <i class="fa-solid fa-circle-plus"></i>
		                </a>
		            </div>
		            <div class="list_book">
		                <div class="list_title">
		                    <span class="list_title_id">
		                        Id
		                    </span>
		                    <span class="list_title_name">
		                        Name
		                    </span>
		                    <span class="list_title_img">
		                        Image
		                    </span>
		                    <span class="list_title_price">
		                        Price
		                    </span>
		                    <span class="list_title_actions">
		                        Actions
		                    </span>
		                </div>
		                <c:forEach items="${requestScope.dataB }" var="o">
		                <div class="div_list_info_book">
		                    <div class="list_info_book">
		                        <span class="list_info_book_id">
		                            ${o.id }
		                        </span>
		                        <span class="list_info_book_name">
		                            ${o.name }
		                        </span>
		                        <div class="list_info_book_img">
		                            <img src="${o.img }" alt="">
		                        </div>
		                        <c:set var="origin_price" value="${o.origin_price }" />
		                        <span class="list_info_book_price">
		                            <fmt:formatNumber value="${o.origin_price }" /><ins>đ</ins>
		                        </span>
		                        <div class="list_info_book_actions">
		                            <a href="update_book?id=${o.id }" class="button_update"><i class="fa-solid fa-pen"></i></a>
		                            <a href="#" class="button_delete" onclick="doDeleteSP('${o.id}')"><i class="fa-solid fa-trash"></i></a>
		                        </div>
		                    </div>
		                </div>
		                </c:forEach>
		            </div>
		            <c:set var="page" value="${requestScope.page }" />
		            <div class="page_product__footer">
						<c:if test="${page > 1 }">
							<div class="page_product__footer__change_page" id="page_product__footer__prev_page">
								<a href="list_book?page=${page - 1 }"> &lt Trang trước </a>
							</div>
						</c:if>
						<c:if test="${page == 1 }">
							<div style="visibility: hidden;" class="page_product__footer__change_page" id="page_product__footer__prev_page">
							</div>
						</c:if>
						<div class="page_product__footer__number_page">
							<c:forEach begin="${1 }" end="${requestScope.totalNumPage }" var="i">
								<a class="${i == page ? "activeNumPage" : ""}" href="list_book?page=${i }">${i }</a>
							</c:forEach>
						</div>
						<c:if test="${page < totalNumPage }">
							<div class="page_product__footer__change_page" id="page_product__footer__next_page">
								<a href="list_book?page=${page + 1 }"> Trang sau &gt </a>
							</div>
						</c:if>
						<c:if test="${page == totalNumPage }">
							<div style="visibility: hidden;" class="page_product__footer__change_page" id="page_product__footer__prev_page">
							</div>
						</c:if>
					</div>
				</div>
			</c:if>
			
			
			<c:if test="${keySelected == 'tg'}">
	        	<div class="content_book">
		            <div class="header">
		                <span class="title">
		                    Quản lý tác giả
		                </span>
		                <a class="button_add" href="Add.jsp">
		                    <i class="fa-solid fa-circle-plus"></i>
		                </a>
		            </div>
		            <div class="list_book">
		                <div class="list_title" style="justify-content: space-between;">
		                    <span class="list_title_id">
		                        Id
		                    </span>
		                    <span class="list_title_img">
		                        Name
		                    </span>
		                    <span class="list_title_actions">
		                        Actions
		                    </span>
		                </div>
		                <c:forEach items="${requestScope.data }" var="o">
		                <div class="div_list_info_book">
		                    <div class="list_info_book" style="justify-content: space-between;">
		                        <span class="list_info_book_id">
		                            ${o.id }
		                        </span>
		                        <div class="list_info_book_img">
		                            <img src="" alt=""><span>${o.name }</span>
		                        </div>
		                        <div class="list_info_book_actions">
		                            <a href="update?id=${o.id }" class="button_update"><i class="fa-solid fa-pen"></i></a>
		                            <a href="#" class="button_delete" onclick="doDeleteTG('${o.id}')"><i class="fa-solid fa-trash"></i></a>
		                        </div>
		                    </div>
		                </div>
		                </c:forEach>
		            </div>
		            <c:set var="page" value="${requestScope.page }" />
		            <div class="page_product__footer">
						<c:if test="${page > 1 }">
							<div class="page_product__footer__change_page" id="page_product__footer__prev_page">
								<a href="list?page=${page - 1 }"> &lt Trang trước </a>
							</div>
						</c:if>
						<c:if test="${page == 1 }">
							<div style="visibility: hidden;" class="page_product__footer__change_page" id="page_product__footer__prev_page">
							</div>
						</c:if>
						<div class="page_product__footer__number_page">
							<c:forEach begin="${1 }" end="${requestScope.totalNumPage }" var="i">
								<a class="${i == page ? "activeNumPage" : ""}" href="list?page=${i }">${i }</a>
							</c:forEach>
						</div>
						<c:if test="${page < totalNumPage }">
							<div class="page_product__footer__change_page" id="page_product__footer__next_page">
								<a href="list?page=${page + 1 }"> Trang sau &gt </a>
							</div>
						</c:if>
						<c:if test="${page == totalNumPage }">
							<div style="visibility: hidden;" class="page_product__footer__change_page" id="page_product__footer__prev_page">
							</div>
						</c:if>
					</div>
				</div>
			</c:if>
			
			<c:if test="${keySelected == 'tl'}">
	        	<div class="content_book">
		            <div class="header">
		                <span class="title">
		                    Quản lý thể loại
		                </span>
		                <a class="button_add" href="Add_Category.jsp">
		                    <i class="fa-solid fa-circle-plus"></i>
		                </a>
		            </div>
		            <div class="list_book">
		                <div class="list_title" style="justify-content: space-between;">
		                    <span class="list_title_id">
		                        Id
		                    </span>
		                    <span class="list_title_img">
		                        Name
		                    </span>
		                    <span class="list_title_actions">
		                        Actions
		                    </span>
		                </div>
		                <c:forEach items="${requestScope.data }" var="o">
		                <div class="div_list_info_book">
		                    <div class="list_info_book" style="justify-content: space-between;">
		                        <span class="list_info_book_id">
		                            ${o.id }
		                        </span>
		                        <div class="list_info_book_img">
		                            <img src="" alt=""><span>${o.name }</span>
		                        </div>
		                        <div class="list_info_book_actions">
		                            <a href="update_category?id=${o.id }" class="button_update"><i class="fa-solid fa-pen"></i></a>
		                            <a href="#" class="button_delete" onclick="doDeleteTL('${o.id}')"><i class="fa-solid fa-trash"></i></a>
		                        </div>
		                    </div>
		                </div>
		                </c:forEach>
		            </div>
		            <c:set var="page" value="${requestScope.page }" />
		            <div class="page_product__footer">
						<c:if test="${page > 1 }">
							<div class="page_product__footer__change_page" id="page_product__footer__prev_page">
								<a href="list_category?page=${page - 1 }"> &lt Trang trước </a>
							</div>
						</c:if>
						<c:if test="${page == 1 }">
							<div style="visibility: hidden;" class="page_product__footer__change_page" id="page_product__footer__prev_page">
							</div>
						</c:if>
						<div class="page_product__footer__number_page">
							<c:forEach begin="${1 }" end="${requestScope.totalNumPage }" var="i">
								<a class="${i == page ? "activeNumPage" : ""}" href="list_category?page=${i }">${i }</a>
							</c:forEach>
						</div>
						<c:if test="${page < totalNumPage }">
							<div class="page_product__footer__change_page" id="page_product__footer__next_page">
								<a href="list_category?page=${page + 1 }"> Trang sau &gt </a>
							</div>
						</c:if>
						<c:if test="${page == totalNumPage }">
							<div style="visibility: hidden;" class="page_product__footer__change_page" id="page_product__footer__prev_page">
							</div>
						</c:if>
					</div>
				</div>
			</c:if>
			
			<c:if test="${keySelected == 'nxb'}">
	        	<div class="content_book">
		            <div class="header">
		                <span class="title">
		                    Quản lý NXB
		                </span>
		                <a class="button_add" href="Add_Publish_company.jsp">
		                    <i class="fa-solid fa-circle-plus"></i>
		                </a>
		            </div>
		            <div class="list_book">
		                <div class="list_title" style="justify-content: space-between;">
		                    <span class="list_title_id">
		                        Id
		                    </span>
		                    <span class="list_title_img">
		                        Name
		                    </span>
		                    <span class="list_title_actions">
		                        Actions
		                    </span>
		                </div>
		                <c:forEach items="${requestScope.data }" var="o">
		                <div class="div_list_info_book">
		                    <div class="list_info_book" style="justify-content: space-between;">
		                        <span class="list_info_book_id">
		                            ${o.id }
		                        </span>
		                        <div class="list_info_book_img">
		                            <img src="" alt=""><span>${o.name }</span>
		                        </div>
		                        <div class="list_info_book_actions">
		                            <a href="update_publish_company?id=${o.id }" class="button_update"><i class="fa-solid fa-pen"></i></a>
		                            <a href="#" class="button_delete" onclick="doDeleteNXB('${o.id}')"><i class="fa-solid fa-trash"></i></a>
		                        </div>
		                    </div>
		                </div>
		                </c:forEach>
		            </div>
		            <c:set var="page" value="${requestScope.page }" />
		            <div class="page_product__footer">
						<c:if test="${page > 1 }">
							<div class="page_product__footer__change_page" id="page_product__footer__prev_page">
								<a href="list_publish_company?page=${page - 1 }"> &lt Trang trước </a>
							</div>
						</c:if>
						<c:if test="${page == 1 }">
							<div style="visibility: hidden;" class="page_product__footer__change_page" id="page_product__footer__prev_page">
							</div>
						</c:if>
						<div class="page_product__footer__number_page">
							<c:forEach begin="${1 }" end="${requestScope.totalNumPage }" var="i">
								<a class="${i == page ? "activeNumPage" : ""}" href="list_publish_company?page=${i }">${i }</a>
							</c:forEach>
						</div>
						<c:if test="${page < totalNumPage }">
							<div class="page_product__footer__change_page" id="page_product__footer__next_page">
								<a href="list_publish_company?page=${page + 1 }"> Trang sau &gt </a>
							</div>
						</c:if>
						<c:if test="${page == totalNumPage }">
							<div style="visibility: hidden;" class="page_product__footer__change_page" id="page_product__footer__prev_page">
							</div>
						</c:if>
					</div>
				</div>
			</c:if>
			
			<c:if test="${keySelected == 'banner'}">
	        	<div class="content_book">
		            <div class="header">
		                <span class="title">
		                    Quản lý Banner
		                </span>
		                <a class="button_add" href="Add_Banner.jsp">
		                    <i class="fa-solid fa-circle-plus"></i>
		                </a>
		            </div>
		            <div class="list_book">
		                <div class="list_title" style="justify-content: space-between;">
		                    <span class="list_title_id">
		                        Id
		                    </span>
		                    <span class="list_title_img">
		                        Image
		                    </span>
		                    <span class="list_title_actions">
		                        Actions
		                    </span>
		                </div>
		                <c:forEach items="${requestScope.data }" var="o">
		                <div class="div_list_info_book">
		                    <div class="list_info_book" style="justify-content: space-between;">
		                        <span class="list_info_book_id">
		                            ${o.id }
		                        </span>
		                        <div class="list_info_book_img" style="width: 500px;">
		                            <img src="${o.img }" alt="">
		                        </div>
		                        <div class="list_info_book_actions">
		                            <a href="update_banner?id=${o.id }" class="button_update"><i class="fa-solid fa-pen"></i></a>
		                            <a href="#" class="button_delete" onclick="doDeleteBanner('${o.id}')"><i class="fa-solid fa-trash"></i></a>
		                        </div>
		                    </div>
		                </div>
		                </c:forEach>
		            </div>
		            <c:set var="page" value="${requestScope.page }" />
		            <div class="page_product__footer">
						<c:if test="${page > 1 }">
							<div class="page_product__footer__change_page" id="page_product__footer__prev_page">
								<a href="list_publish_company?page=${page - 1 }"> &lt Trang trước </a>
							</div>
						</c:if>
						<c:if test="${page == 1 }">
							<div style="visibility: hidden;" class="page_product__footer__change_page" id="page_product__footer__prev_page">
							</div>
						</c:if>
						<div class="page_product__footer__number_page">
							<c:forEach begin="${1 }" end="${requestScope.totalNumPage }" var="i">
								<a class="${i == page ? "activeNumPage" : ""}" href="list_publish_company?page=${i }">${i }</a>
							</c:forEach>
						</div>
						<c:if test="${page < totalNumPage }">
							<div class="page_product__footer__change_page" id="page_product__footer__next_page">
								<a href="list_publish_company?page=${page + 1 }"> Trang sau &gt </a>
							</div>
						</c:if>
						<c:if test="${page == totalNumPage }">
							<div style="visibility: hidden;" class="page_product__footer__change_page" id="page_product__footer__prev_page">
							</div>
						</c:if>
					</div>
				</div>
			</c:if>
			
			<c:if test="${keySelected == 'hnb'}">
	        	<div class="content_book">
		            <div class="header">
		                <span class="title">
		                    Quản lý Hnb
		                </span>
		                <a class="button_add" href="Add_Hnb.jsp">
		                    <i class="fa-solid fa-circle-plus"></i>
		                </a>
		            </div>
		            <div class="list_book">
		                <div class="list_title" style="justify-content: space-between;">
		                    <span class="list_title_id">
		                        Id
		                    </span>
		                    <span class="list_title_name">
		                        Id Book
		                    </span>
		                    <span class="list_title_img">
		                        Image
		                    </span>
		                    <span class="list_title_actions">
		                        Actions
		                    </span>
		                </div>
		                <c:forEach items="${requestScope.data }" var="o">
		                <div class="div_list_info_book">
		                    <div class="list_info_book" style="justify-content: space-between;">
		                        <span class="list_info_book_id">
		                            ${o.id }
		                        </span>
		                        <span class="list_info_book_name">
		                            ${o.book.id } &ensp; | &ensp; ${o.book.name }
		                        </span>
		                        <div class="list_info_book_img">
		                            <img src="${o.img }" alt="">
		                        </div>
		                        <div class="list_info_book_actions">
		                            <a href="update_hnb?id=${o.id }" class="button_update"><i class="fa-solid fa-pen"></i></a>
		                            <a href="#" class="button_delete" onclick="doDeleteHnb('${o.id}')"><i class="fa-solid fa-trash"></i></a>
		                        </div>
		                    </div>
		                </div>
		                </c:forEach>
		            </div>
				</div>
			</c:if>
			
			<c:if test="${keySelected == 'acc'}">
	        	<div class="content_book">
		            <div class="header">
		                <span class="title">
		                    Quản lý tài khoản
		                </span>
		                <a class="button_add" href="Add_Account.jsp">
		                    <i class="fa-solid fa-circle-plus"></i>
		                </a>
		            </div>
		            <div class="list_book">
		                <div class="list_title">
		                    <span class="list_title_id">
		                        Role
		                    </span>
		                    <span class="list_title_name">
		                        FullName
		                    </span>
		                    <span class="list_title_img">
		                        Username
		                    </span>
		                    <span class="list_title_price">
		                        Password
		                    </span>
		                    <span class="list_title_actions">
		                        Actions
		                    </span>
		                </div>
		                <c:forEach items="${requestScope.data }" var="o">
		                <div class="div_list_info_book">
		                    <div class="list_info_book">
		                        <span class="list_info_book_id">
		                            ${o.role }
		                        </span>
		                        <span class="list_info_book_name">
		                            ${o.fullname }
		                        </span>
		                        <div class="list_info_book_img">
		                            <span>${o.username }</span>
		                        </div>
		                        <span class="list_info_book_price">
		                            ${o.password }
		                        </span>
		                        <div class="list_info_book_actions">
		                            <a href="update_account?username=${o.username }" class="button_update"><i class="fa-solid fa-pen"></i></a>
		                            <a href="#" class="button_delete" onclick="doDeleteAcc('${o.username}')"><i class="fa-solid fa-trash"></i></a>
		                        </div>
		                    </div>
		                </div>
		                </c:forEach>
		            </div>
				</div>
			</c:if>
			
			<c:if test="${keySelected == 'order'}">
	        	<div class="content_book">
		            <div class="header">
		                <span class="title">
		                    Quản lý hóa đơn
		                </span>
		            </div>
		            <div class="list_book">
		                <div class="list_title">
		                    <span class="list_title_id">
		                        Id Order
		                    </span>
		                    <span class="list_title_name">
		                        Date
		                    </span>
		                    <span class="list_title_img">
		                        Username
		                    </span>
		                    <span class="list_title_price">
		                        Total money
		                    </span>
		                    <span class="list_title_actions">
		                        Actions
		                    </span>
		                </div>
		                <c:forEach items="${requestScope.data }" var="o">
		                <div class="div_list_info_book">
		                    <div class="list_info_book">
		                        <span class="list_info_book_id">
		                            ${o.id }
		                        </span>
		                        <span class="list_info_book_name">
		                            ${o.date }
		                        </span>
		                        <div class="list_info_book_img">
		                            <span>${o.id_account }</span>
		                        </div>
		                        <span class="list_info_book_price">
		                            ${o.totalMoney }
		                        </span>
		                        <div class="list_info_book_actions">
		                            <a href="update_order?id=${o.id }" class="button_update"><i class="fa-solid fa-pen"></i></a>
		                        </div>
		                    </div>
		                </div>
		                </c:forEach>
		            </div>
				</div>
			</c:if>
			
        </div>
    </div>
</body>
</html>