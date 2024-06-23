<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiết Đơn Hàng</title>
</head>
<style>
.order-form {
	background: #ffffff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.order-form h2 {
	margin-bottom: 20px;
	font-size: 26px;
	font-weight: 600;
	text-align: center;
}

.order-form .form-group {
	margin-bottom: 20px;
}

.order-form .form-control {
	height: 45px;
	border-radius: 5px;
	box-shadow: none;
	border-color: #dcdcdc;
}

.order-form .btn {
	height: 45px;
	border-radius: 5px;
	font-size: 16px;
	font-weight: 600;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table thead {
	background-color: #343a40;
	color: #fff;
}

table th, table td {
	padding: 15px;
	text-align: center;
	border: 1px solid #ddd;
}

table tbody tr:nth-child(even) {
	background-color: #f9f9f9;
}

.img-fluid {
	width: 100px;
	height: auto;
	border-radius: 8px;
}

h3 {
	font-size: 24px;
	font-weight: 600;
	color: #007bff; /* Màu chữ */
	margin-top: 20px;
}
</style>


   


<body>


	<div id="main-wrapper">
		<jsp:include page="header.jsp"></jsp:include>

		<div class="content-body">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-xl-8 col-lg-10 col-md-12">
						<div class="order-form">
							<h2>Chi Tiết Đơn Hàng </h2>
							<c:if test="${not empty requestScope.success}">
								<h4 style="color:green;	text-align: center;
								">${requestScope.success}</h4>

							</c:if>
							<c:if test="${not empty requestScope.fail}">
								<h4 style="color:red;	text-align: center;
								"> ${requestScope.fail}</h4>

							</c:if>

							<c:set var="order" value="${requestScope.userOrder}"></c:set>
							

							<div class="row">
								<h4>Thông Tin Đơn Hàng:</h4>
								<label style="color: gray;">Ngày Đặt Hàng:
									${order.getOrderDate() } </label> 
									<label style="color: gray;">Phương
									Thức Thanh Toán: ${order. getPaymentType()} </label> 
									
							<h4>
									Trạng Thái:
									<c:choose>
										<c:when test="${order.getStatusID() == 1}">
											<span class="badge badge-warning">Chờ Xử Lý</span>
										</c:when>
										<c:when test="${order.getStatusID() == 4}">
											<span class="badge badge-success">Đã Giao</span>
										</c:when>
										<c:when test="${order.getStatusID() == 2}">
											<span class="badge badge-danger">Hủy</span>
										</c:when>
										<c:otherwise>
											<span class="badge badge-secondary">${order.getStatusID()}</span>
										</c:otherwise>
									</c:choose>

							 
							 
							 </h4>

							</div>






							<div class="form-group">
								<h4>Họ Tên Người Nhận Hàng</h4>

								<input type="text" value="${order.getReceiveName()}"
									class="form-control" id="fullname" name="fullname" readonly>
							</div>

							<div class="form-group">
								<h4>Số Điện Thoại Liên Hệ</h4>

								<input type="text" value="${order.getReceivePhone()}"
									class="form-control" id="phone" name="phone" readonly>
							</div>
							<!-- Shipping Address -->
							<div class="form-group">
														<h4>Địa Chỉ Nhận Hàng</h4>
							
								<input type="text" value="${order.getReceiveAddress()}"
									class="form-control" id="address" name="address" readonly>
							</div>

							<!-- Order Items -->
							<h4>Sản Phẩm Đã Đặt</h4>

							<div class="form-group">
								<table>
									<thead>
										<tr>
											<th>Ảnh</th>
											<th>Tên sản phẩm</th>
											<th>Số lượng</th>
											<th>Size</th>
											<th>Giá đơn vị</th>
											<th>Tổng giá sản phẩm</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${requestScope.OrderLine}" var="i">
											<tr>
												<td><img class="img-fluid" src="${i.get('Thumbnail')}"
													alt="Product Image"></td>
												<td>${i.get("ProductName")}</td>
												<td>${i.get("UnitQuantity")}</td>
												<td>${i.get("size")}</td>
												<td> ${i.get("UnitPrice")} VND</td>
												<td>${i.get("UnitPrice")*i.get("UnitQuantity")} VND</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
							<div class="form-group">

								<c:forEach items="${requestScope.orderList}" var="i"
									varStatus="loop">
									<c:if test="${loop.last}">
										<h3>
											Tổng Hóa Đơn: <span style="font-size: 15px;">${i.getTotalPrice()}
												VND</span>
										</h3>
									</c:if>
									<c:if test="${loop.last}">
										<h3>
											Tổng Sản Phẩm: <span style="font-size: 15px;">${i.getTotalQuantity()}
												sản phẩm</span>
										</h3>

									</c:if>

								</c:forEach>
							</div>
							<!-- Submit Button -->
							<div class="form-group">
								<form action="OrderDetails" method="post">
								<input type ="hidden" value ="${order.getOrderID()}" name="orderid">
								<c:if test="${sessionScope.account.getRole() !='Admin'}">
																	<button class="btn btn-danger btn-block">Hủy Đơn Hàng</button> <br>
									
								</c:if>
								
								</form>
								
								
								<c:choose>
									<c:when test="${sessionScope.account.getRole() =='Admin'}">
									<a class="btn btn-primary btn-block" href="OrderManager">Quay Lại</a>
										
									</c:when>
									<c:otherwise>
										<a class="btn btn-primary btn-block" href="UserOrder">Quay Lại</a>
									</c:otherwise>
								</c:choose>
								
									
									
							</div>
						</div>
					</div>
				</div>
			</div>

			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>

	<script src="vendor/global/global.min.js"></script>
	<script src="vendor/chart.js/Chart.bundle.min.js"></script>
	<script src="vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>



	<script src="js/custom.min.js"></script>
	<script src="js/dlabnav-init.js"></script>
	<script src="js/demo.js"></script>
	<script src="js/styleSwitcher.js"></script>


</body>
</html>