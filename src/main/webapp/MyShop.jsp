<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		border-collapse: collapse;
	}
	
	#bag {
		text-align: right;
		margin-right: 30px;
		margin-top: 30px;
	}
	.tr {
		text-align: right;
	}
</style>
</head>
<body>
	<p id="bag">
		<img alt="" src="IMG/IMG_EmptyCart/empty_cart.jpg" style="width: 50px;" height="50px;">
		<a href="show">My Bag (${sessionScope.size }) items</a>
	</p>
	<h1>List of Book</h1>
	<form action="" name="f" method="post">
		Enter number of Items to buy:
		<input style="text-align: center;" type="number" name="num" value="1" >
		<hr>
		<table border="1px" style="width: 40%">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Action</th>
			</tr>
			<c:forEach items="${requestScope.data }" var="book">
				<c:set var="id" value="${book.id }" />
				<tr>
					<td>${id }</td>
					<td>${book.name }</td>
					<td class="tr">${book.quantity }</td>
					<td class="tr">${(book.origin_price * (100 - book.ratio_sale)) / 100 }</td>
				    <td><Input type="button" onclick="buy('${id}')" value="Buy_Htems"></td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<script type="text/javascript">
		function buy(id) {
			var m = document.f.num.value;
			document.f.action = "buy?id="+id+"&num="+m;
			document.f.submit();
		}
	</script>
</body>
</html>