<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    /* CSS cho thẻ a */
    .custom-link {
         display: inline-block;
        padding: 10px 20px; /* Điều chỉnh padding để thay đổi kích thước */
        background-color: #007bff; /* Màu nền */
        color: #ffffff; /* Màu chữ */
        text-decoration: none;
        border: 1px solid #007bff; /* Đường viền */
        border-radius: 5px; /* Bo góc */
        transition: background-color 0.3s, color 0.3s; /* Hiệu ứng chuyển đổi màu nền và màu chữ khi hover */
        margin-bottom: 10px; /* Thêm khoảng cách dưới cho mỗi thẻ a 
    }

    /* CSS cho hiệu ứng hover */
    .custom-link:hover {
        background-color: #0056b3; /* Màu nền khi hover */
        color: #ffffff; /* Màu chữ khi hover */
        border-color: #0056b3; /* Màu đường viền khi hover */
    }
</style>
<body>


	<div id="main-wrapper">

		 <c:set var="i" value="${sessionScope.account}" />

		<c:choose>
			<c:when test="${i.getRole() == 'Admin'}">
				<jsp:include page="admin/adminHeader.jsp"></jsp:include>
				
			</c:when>
			<c:otherwise>
				<jsp:include page="header.jsp"></jsp:include>
									
			</c:otherwise>
		</c:choose>





		<div class="content-body">

			<div class="container-fluid">
				
					<div class="col-xl-12">
						<div class="row">
							<div class="card contact-bx item-content">
								<div class="card-body user-profile">
								<h1>Hồ Sơ Người Dùng</h1>
								<br>
								<br>
									
									<c:choose>
										<c:when test="${i.getRole() == 'Admin'}">
											<div class="image-bx">
												<a href=""><img src="img/userProdileImg.png"
													 class="rounded-circle"></a>
												<span class="active"></span>
											</div>
											<div class="media-body user-meta-info">
												<h6 class="fs-18 font-w600 my-1" class="text-black user-name"
													data-name="Alan Green">
													${i.getFullname()}
												</h6>
												<p class="fs-14 mb-3 user-work" data-occupation="UI Designer">${i.getRole()}</p>
		
												<div class="text-center">
													<a href="UserInformation" class="custom-link">Thông tin cá nhân</a>		
												</div>
											</div>
										</c:when>	
										<c:otherwise>
												<div class="image-bx">
													<a href=""><img src="img/userProdileImg.png"
														 class="rounded-circle"></a>
													<span class="active"></span>
												</div>
												<div class="media-body user-meta-info">
													<h6 class="fs-18 font-w600 my-1" class="text-black user-name"
														data-name="Alan Green">
														${i.getFullname()}
													</h6>
													<p class="fs-14 mb-3 user-work" data-occupation="UI Designer">${i.getRole()}</p>
			
													<div class="text-center">
														<a href="UserInformation" class="custom-link">Thông tin cá nhân</a>		
													</div>
													<div class="text-center">
														<a href="UserOrder" class="custom-link">Quản lý đơn hàng</a>		
													</div>
												</div>
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


		<!-- Required vendors -->
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
</body>
</html>