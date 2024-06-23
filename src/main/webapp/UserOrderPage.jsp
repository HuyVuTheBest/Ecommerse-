<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đơn Hàng Cá Nhân</title>
</head>
<style>
    table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
}




th {
 padding: 8px;
  text-align: center;
  border-bottom: 1px solid #ddd;
  background-color: #f2f2f2;
  font-weight: bold;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #ddd;
}
</style>
<body>
<div id="main-wrapper">


		<jsp:include page="header.jsp"></jsp:include>


		<div class="content-body">
			<!-- row -->
			<div class="container-fluid">
			
			
				<div class="row">		
					<div class="card">
						<div class="card-header">
							<h4 class="card-title " style="margin: auto;">Đơn hàng</h4>
						</div>
						
						<div class="card-body">
   									
							<div class="table-responsive">
								


								<table class="table 	">
									<thead class="thead-dark">
										<tr>
											<th scope="col">STT</th>
											<th scope="col">Phương thức </th>
											<th scope="col">Ngày đặt hàng</th>
											<th scope="col">Tổng số lượng</th>
											<th scope="col">Tổng giá tiền</th>
											<th scope="col">Trạng thái</th>
											
											<th scope="col">Chi tiết đơn hàng</th>
											
										</tr>
									</thead>
									
									<tbody>
										
										


										<c:forEach items="${requestScope.orderList}" var="i" varStatus="loop">
											<tr>
												<th scope="row">${loop.index}</th>
												<th scope="col">${i.getPaymentType()}</th>
												<th scope="col">${i.getOrderDate()}</th>
												<th scope="col">${i.getTotalQuantity()} Sản phẩm</th>
												<th scope="col">${i.getTotalPrice()}</th>
												<th scope="col"><c:choose>
														<c:when test="${i.getStatusID() == 1}">
															<span class="badge badge-warning">Chờ Xử Lý</span>
														</c:when>
														<c:when test="${i.getStatusID() == 4}">
															<span class="badge badge-success">Đã Giao</span>
														</c:when>
														<c:when test="${i.getStatusID() == 2}">
															<span class="badge badge-danger">Hủy</span>
														</c:when>
														<c:otherwise>
															<span class="badge badge-secondary">${i.getStatusID()}</span>
														</c:otherwise>
													</c:choose></th>
												<th scope="col"><a style="color: blue;"
													href="OrderDetails?oid=${i.getOrderID()}">Xem Chi Tiết
														Đơn Hàng</a></th>
											</tr>
										</c:forEach>
										
										
									</tbody>
								</table>
								<c:if test="${requestScope.orderList == null}">				
											<h1 style="text-align:center;">Bạn chưa có đơn hàng nào </h1>
										</c:if>
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
	
	<!-- Apex Chart -->
	<script src="vendor/apexchart/apexchart.js"></script>
	
	<script src="vendor/chart.js/Chart.bundle.min.js"></script>
	
	<!-- Chart piety plugin files -->
    <script src="vendor/peity/jquery.peity.min.js"></script>
	<!-- Dashboard 1 -->
	<script src="js/dashboard/dashboard-1.js"></script>
	
	<script src="vendor/owl-carousel/owl.carousel.js"></script>
	
    <script src="js/custom.min.js"></script>
	<script src="js/dlabnav-init.js"></script>
	<script src="js/demo.js"></script>
    <script src="js/styleSwitcher.js"></script>
	<script>
		function cardsCenter()
		{
		
			jQuery('.card-slider').owlCarousel({
				loop:true,
				margin:0,
				nav:true,
				//center:true,
				slideSpeed: 3000,
				paginationSpeed: 3000,
				dots: true,
				navText: ['<i class="fas fa-arrow-left"></i>', '<i class="fas fa-arrow-right"></i>'],
				responsive:{
					0:{
						items:1
					},
					576:{
						items:1
					},	
					800:{
						items:1
					},			
					991:{
						items:1
					},
					1200:{
						items:1
					},
					1600:{
						items:1
					}
				}
			})
		}
		
		jQuery(window).on('load',function(){
			setTimeout(function(){
				cardsCenter();
			}, 1000); 
		});
		
	</script>
</body>
</html>