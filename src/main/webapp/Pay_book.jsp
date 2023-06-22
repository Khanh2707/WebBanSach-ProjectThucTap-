<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css_private/pay_book.css">
<link rel="stylesheet" href="css_public/base.css">
</head>
<body>
	<div class="wrapper">
        <div class="infor_user">
            <div class="infor_user__div_img">
                <a href="home.html"><img src="IMG/IMG_Logo/Karma-logo.png" alt=""></a>
            </div>
            <div class="infor_user__link_return_cart">
                <a href="Cart.jsp">Giỏ hàng</a>
                <span>&gt</span>
                <span>Thông tin giao hàng</span>
            </div>
            <span class="infor_user__title_infor_transport">
                Thông tin giao hàng
            </span>
            <div>
                <span>
                    Trần Khánh
                </span>
                <span>
                    (nthtpk7h7i@gmail.com)
                </span>
            </div>
            <form action="" class="form" id="form-1">
                <div class="sign_up-infor-div">
                    <div class="sign_up-infor">
                        <label for="fullName">Họ và tên</label>
                        <input type="text" name="fullName" id="fullName">
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
                            <span>Chủ tài khoản: NHÀ SÁCH TRỰC TUYẾN kARMA</span><br>
                            <span>STK: 123456789</span><br>
                            <span>Ngân hàng Thương mại Cổ phần kỹ thương Việt Nam (TECHCOMBANK)</span><br>
                            <span>Khi chuyển khoản, vui lòng đề rõ Tên – Mã Đơn hàng – SĐT vào phần Nội dung chuyển khoản.</span><br>
                            <span>Đối với đơn hàng từ 1.500.000 VNĐ TRỞ LÊN, quý khách vui lòng Thanh toán bằng phương thức CHUYỂN KHOẢN QUA NGÂN HÀNG.</span><br>
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
                    <a href="Cart.jsp">Giỏ hàng</a>
                    <input type="submit" value="Hoàn tất đơn hàng">
                </div>
            </form>
        </div>
        <div class="infor_pay_book">
            <div class="infor_pay_book_book">
                <div class="infor_pay_book__img_and_price">
                    <div class="infor_pay_book__img_and_name">
                        <div class="infor_pay_book__img_background">
                            <div class="infor_pay_book__img">
                                <img src="IMG/IMG_Book/Trinh Thám - Kinh Dị/Núi Chuột Quét/nui_chuot_quet.jpg" alt="">
                            </div>
                            <span class="infor_pay_book__img_and_name__quantity_book">
                                1
                            </span>
                        </div>
                        <div class="infor_pay_book_name_and_version">
                            <span class="infor_pay_book__name">
                                Núi chuột quét
                            </span>
                            <span class="infor_pay_book__version">
                                Bản thường
                            </span>
                        </div>
                    </div>
                    <div>
                        <span>256,000<ins>đ</ins></span>
                    </div>
                </div>
                <div class="infor_pay_book__img_and_price">
                    <div class="infor_pay_book__img_and_name">
                        <div class="infor_pay_book__img_background">
                            <div class="infor_pay_book__img">
                                <img src="IMG/IMG_Book/Trinh Thám - Kinh Dị/Núi Chuột Quét/nui_chuot_quet.jpg" alt="">
                            </div>
                            <span class="infor_pay_book__img_and_name__quantity_book">
                                1
                            </span>
                        </div>
                        <div class="infor_pay_book_name_and_version">
                            <span class="infor_pay_book__name">
                                Núi chuột quét
                            </span>
                            <span class="infor_pay_book__version">
                                Bản thường
                            </span>
                        </div>
                    </div>
                    <div>
                        <span>256,000<ins>đ</ins></span>
                    </div>
                </div>
            </div>
            <div class="infor_pay_book_transport_fee">
                <div class="infor_pay_book_transport_fee__key_and_value">
                    <span class="infor_pay_book_transport_fee__key">
                        Tạm tính
                    </span>
                    <span class="infor_pay_book_transport_fee__value">
                        666,666<ins>đ</ins>
                    </span>
                </div>
                <div class="infor_pay_book_transport_fee__key_and_value">
                    <span class="infor_pay_book_transport_fee__key">
                        Phí vận chuyển
                    </span>
                    <span class="infor_pay_book_transport_fee__svalue">
                        0<ins>đ</ins>
                    </span>
                </div>
            </div>
            <div class="infor_pay_book_transport_total_fee">
                <div class="infor_pay_book_transport_fee__key_and_value">
                    <span>
                        Tổng cộng
                    </span>
                    <span>
                        666,666<ins>đ</ins>
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