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
<link rel="stylesheet" href="css_private/pay_book.css">
<link rel="stylesheet" href="css_public/base.css">
</head>
<body>
	<c:set var="o" value="${requestScope.cart }" />
	<div class="wrapper">
        <div class="infor_user">
            <div class="infor_user__div_img">
                <a href="home.html"><img src="IMG/IMG_Logo/Karma-logo.png" alt=""></a>
            </div>
            <div class="infor_user__link_return_cart">
                <a href="show">Giỏ hàng</a>
                <span>&gt</span>
                <span>Thông tin giao hàng</span>
            </div>
            <span class="infor_user__title_infor_transport">
                Thông tin giao hàng
            </span>
            <div>
                <span>
                    ${sessionScope.account.fullname }
                </span>
                <span>
                    (${sessionScope.account.username })
                </span>
            </div>
            <form action="purchase_order" class="form" id="form-1" method="post">
                <div class="sign_up-infor-div">
                    <div class="sign_up-infor">
                        <label for="fullName">Họ và tên</label>
                        <input type="text" name="fullName" id="fullName" value="${sessionScope.account.fullname }" readonly="readonly">
                    </div>
                    <span class="form-mesg">

                    </span>
                </div>
                <div class="sign_up-infor-div">
                    <div class="sign_up-infor">
                        <label for="phone">Số điện thoại</label>
                        <input type="text" name="phone" id="phone">
                    </div>
                    <span class="form-mesg">

                    </span>
                </div>
                <div class="sign_up-infor-div">
                    <div class="sign_up-infor">
                        <label for="address">Địa chỉ</label>
                        <input type="text" name="address" id="address">
                    </div>
                    <span class="form-mesg">

                    </span>
                </div>
                <div class="sign_up-infor-div invalid">
                        <label for="" style="display: block; margin-bottom: 10px; padding-top: 20px; font-size: 20px;">
                            Phương thức thanh toán
                        </label>
                    <div class="box_method_pay">
                        <div class="box_method_pay_child">
                            <input type="radio" name="method_pay" value="ck" id="method_pay_ck" onclick="check_radio()">
                            <label for="method_pay_ck">
                                <img src="https://hstatic.net/0/0/global/design/seller/image/payment/other.svg?v=4" alt="">
                                <span>Chuyển khoản qua ngân hàng</span>
                            </label>
                        </div>
                        <div class="box_method_pay_child disabled" id="box_method_pay_child_warning_ck">
                            <span>Bạn vui lòng chuyển 100% giá trị đơn hàng (bao gồm phí ship) vào tài khoản dưới đây:</span><br>
                            <span>Chủ tài khoản: NHÀ SÁCH TRỰC TUYẾN KARMA</span><br>
                            <span>STK: 123456789</span><br>
                            <span>Ngân hàng Thương mại Cổ phần kỹ thương Việt Nam (TECHCOMBANK)</span><br>
                            <span>Khi chuyển khoản, vui lòng đề rõ Tên – Mã Đơn hàng – SĐT vào phần Nội dung chuyển khoản.</span><br>
                        </div>
                        <div class="box_method_pay_child">
                            <input type="radio" name="method_pay" value="cod" id="method_pay_cod" onclick="check_radio()">
                            <label for="method_pay_cod">
                                <img src="https://hstatic.net/0/0/global/design/seller/image/payment/cod.svg?v=4" alt="">
                                <span>Thanh toán khi giao hàng (COD)</span>
                            </label>
                        </div>
                        <div class="box_method_pay_child box_method_pay_child_warning">
                            <span style="color: #333;">
                                Khi chọn phương thức Thanh toán khi giao hàng (COD), bạn vui lòng kiểm tra kỹ hàng trước khi nhận hàng và thanh toán toàn bộ giá trị đơn hàng cho shipper
                            </span>
                        </div>
                    </div>
                    <br>
                    <span class="form-mesg">

                    </span>
                </div>
                <div class="input_submit_order">
                    <a href="show">Giỏ hàng</a>
                    <input type="submit" value="Hoàn tất đơn hàng">
                </div>
            </form>
        </div>
        <div class="infor_pay_book">
            <div class="infor_pay_book_book">
            	<c:forEach items="${o.items }" var="i">
                <div class="infor_pay_book__img_and_price">
                    <div class="infor_pay_book__img_and_name">
                        <div class="infor_pay_book__img_background">
                            <div class="infor_pay_book__img">
                                <img src="${i.book.img }" alt="">
                            </div>
                            <span class="infor_pay_book__img_and_name__quantity_book">
                                ${i.quantity }
                            </span>
                        </div>
                        <div class="infor_pay_book_name_and_version">
                            <span class="infor_pay_book__name">
                                ${i.book.name }
                            </span>
                            <span class="infor_pay_book__version">
                                Bản thường
                            </span>
                        </div>
                    </div>
                    <div>
                    	<c:set var="sale_price" value="${((100 - i.book.ratio_sale) * i.book.origin_price) / 100 }" />
                        <span>
                        	<fmt:formatNumber value="${sale_price }" /><ins>đ</ins>
                        </span>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="infor_pay_book_transport_fee">
                <div class="infor_pay_book_transport_fee__key_and_value">
                    <span class="infor_pay_book_transport_fee__key">
                        Tạm tính
                    </span>
                    <c:set var="totalMoney" value="${o.totalMoney }" />
                    <span class="infor_pay_book_transport_fee__value">
                        <fmt:formatNumber value="${totalMoney }" /><ins>đ</ins>
                    </span>
                </div>
                <div class="infor_pay_book_transport_fee__key_and_value">
                    <span class="infor_pay_book_transport_fee__key">
                        Phí vận chuyển
                    </span>
                    <span class="infor_pay_book_transport_fee__svalue">
                        20.000<ins>đ</ins>
                    </span>
                </div>
            </div>
            <div class="infor_pay_book_transport_total_fee">
                <div class="infor_pay_book_transport_fee__key_and_value">
                    <span>
                        Tổng cộng
                    </span>
                    <span>
                    	<fmt:formatNumber value="${totalMoney + 20000}" /><ins>đ</ins>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <script>
        function check_radio() {
            let method_pay_ck = document.getElementById("method_pay_ck")
            let box_method_pay_child_warning_ck = document.getElementById("box_method_pay_child_warning_ck")
            if (method_pay_ck.checked) {
                box_method_pay_child_warning_ck.classList.add('active')
            }
            else if (!method_pay_ck.checked) {
                box_method_pay_child_warning_ck.classList.remove('active')
            }
        }
    </script>
    <script src="javascript/Validator.js"></script>
    <script>
        Validator({
            form: `#form-1`,
            mesg: `.form-mesg`,
            formGroup: `.sign_up-infor-div`,
            rules: [
                required(`#fullName`, `Chưa nhập tên!`),
                required(`#phone`, `Chưa nhập số điện thoại!`),
                required(`#address`, `Chưa nhập địa chỉ!`),
                required(`input[name="method_pay"]`, `Chưa chọn phương thức thanh toán!`),
            ],
            // submitSuccess: function (data) {
            //     console.log(data)
            // }
        })
    </script>
</body>
</html>