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
<link rel="stylesheet" href="css_private/sign_up.css">
</head>
<body>
	<div class="body">
            <span class="sign_up__title">
                thêm sách mới
            </span>
            <hr>
            <div class="sign_up__wrapper">
                <div class="sign_up__container">
                	<h3 style="color: red; text-align: center;">${requestScope.error }</h3>
                    <form action="add_book" class="form" id="form-1">
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="id_book">Id book</label>
                                <input type="text" name="id_book" id="id_book" placeholder="Id book">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="name_book">Name book</label>
                                <input type="text" name="name_book" id="name_book" placeholder="Name book">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="price_book">Price book</label>
                                <input type="text" name="price_book" id="price_book" placeholder="Price book">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="discount">Discount</label>
                                <input type="text" name="discount" id="discount" placeholder="Discount">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="year_publish">Year publish</label>
                                <input type="text" name="year_publish" id="year_publish" placeholder="Year publish book">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="content_book">Content book</label>
                                <textarea style="width: 308px; height: 150px;" rows="" cols="" name="content_book" id="content_book" placeholder="Content book"></textarea>
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="quantity_book">Quantity book</label>
                                <input type="text" name="quantity_book" id="quantity_book" placeholder="Quantity book">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <div class="sign_up-infor-div">
                            <div class="sign_up-infor">
                                <label for="img_book">Link image</label>
                                <input type="text" name="img_book" id="img_book" placeholder="Link image">
                            </div>
                            <span class="form-mesg">

                            </span>
                        </div>
                        <jsp:useBean id="a" class="dal.Author_DAO" scope="page">
	                        <div class="sign_up-infor-div">
	                            <label for="author" style="display: block; margin-bottom: 10px;">
	                                Author
	                            </label>
	                            <select name="author" id="author" style="height: 40px; width: 308px; text-align: center;">
	                                <option value="">
	                                    --- Choose Author ---
	                                </option>
	                                <c:forEach items="${a.all }" var="o">
		                                <option value="${o.id }">
		                                    ${o.name }
		                                </option>
	                                </c:forEach>
	                            </select>
	                            <br>
	                            <span class="form-mesg">
	
	                            </span>
	                        </div>
                        </jsp:useBean>
                        <jsp:useBean id="pc" class="dal.Publish_company_DAO" scope="page">
	                        <div class="sign_up-infor-div">
	                            <label for="NXB" style="display: block; margin-bottom: 10px;">
	                                Publish company
	                            </label>
	                            <select name="NXB" id="NXB" style="height: 40px; width: 308px; text-align: center;">
	                                <option value="">
	                                    --- Choose Publish company ---
	                                </option>
	                                <c:forEach items="${pc.all }" var="o">
		                                <option value="${o.id }">
		                                    ${o.name }
		                                </option>
	                                </c:forEach>
	                            </select>
	                            <br>
	                            <span class="form-mesg">
	
	                            </span>
	                        </div>
                        </jsp:useBean>
                        <jsp:useBean id="c" class="dal.Category_DAO" scope="page">
	                        <div class="sign_up-infor-div">
	                            <label for="category" style="display: block; margin-bottom: 10px;">
	                                Category
	                            </label>
	                            <select name="category" id="category" style="height: 40px; width: 308px; text-align: center;">
	                                <option value="">
	                                    --- Choose Category ---
	                                </option>
	                                <c:forEach items="${c.all }" var="o">
		                                <option value="${o.id }">
		                                    ${o.name }
		                                </option>
	                                </c:forEach>
	                            </select>
	                            <br>
	                            <span class="form-mesg">
	
	                            </span>
	                        </div>
                        </jsp:useBean>
                        <div class="sign_up-input_submit">
                            <input type="submit" value="Thêm sách">
                        </div>
                    </form>
                    <div class="sign_in-link_return">
                        <a href="list_book">Quay về</a>
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
					required(`#id_book`, `Chưa nhập Id!`),
					required(`#name_book`, `Chưa nhập Name!`),
					required(`#price_book`, `Chưa nhập Price!`),
					required(`#discount`, `Chưa nhập Discount!`),
					required(`#year_publish`, `Chưa nhập Year publish!`),
					required(`#content_book`, `Chưa nhập Content!`),
					required(`#quantity_book`, `Chưa nhập Quantity!`),
					required(`#img_book`, `Chưa nhập Link Image!`),
					required(`#author`, `Chưa chọn Author!`),
					required(`#NXB`, `Chưa chọn NXB!`),
					required(`#category`, `Chưa chọn Category!`),
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