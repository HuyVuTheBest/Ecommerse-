<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Category" 
import="java.util.List" 
import="dao.DAO"
%>
<!DOCTYPE html>
<html lang="vi" dir="ltr" class="translated-ltr">

<head>
    <meta charset="utf-8">
    <!-- PAGE TITLE HERE -->
    <title>Super Sneaker</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
        var currentPage = 1; 
        $('#loadMore').click(function() {
            currentPage++; 
            fetchMoreProducts(currentPage); 
        });
        function fetchMoreProducts(page) {
            $.ajax({
                url: 'LoadMoreAjax', 
                type: 'GET',
                data: { page: page }, 
                success: function(response) {
                    $('#product-list').append(response);
                },
           
            });
        }
    });
</script>
</head> 

<body>

 
    <div id="main-wrapper">
    
    
		<jsp:include page="header.jsp"></jsp:include>
		

        <div class="content-body">
            <!-- row -->
			<div class="container-fluid">
			
			
				<div class="row">
					<div class="col-xl-12">
						<div class="row">
							<div class="card">
								<div class="card-body p-4">
									<div class="bootstrap-carousel">
										<div id="carouselExampleIndicators2" class="carousel slide" data-bs-ride="carousel">
											<div class="carousel-indicators">
												<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
												<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="1" aria-label="Slide 2"></button>
												<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="2" aria-label="Slide 3"></button>
												<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="3" aria-label="Slide 4"></button>
												<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="4" aria-label="Slide 5"></button>
											</div>
											<div class="carousel-inner">
												<div class="carousel-item active">
													<img class="d-block w-100" src="img/banner.jpg" alt="First slide" height="400">
												</div>
												<div class="carousel-item">
													<img class="d-block w-100" src="img/bn5.jpg" alt="Second slide"  height="400">
												</div>
												<div class="carousel-item">
													<img class="d-block w-100" src="img/black-friday-super-sale.avif" alt="Third slide"  height="400">
												</div>
												<div class="carousel-item">
													<img class="d-block w-100" src="img/new-design.avif" alt="Third slide"  height="400">
												</div>
												<div class="carousel-item">
													<img class="d-block w-100" src="img/top-8-hang-giay-sneaker.jpg" alt="Third slide" height="400">
												</div>
											</div>
											<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="prev">
												<span class="carousel-control-prev-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Previous</span>
											</button>
											<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="next">
												<span class="carousel-control-next-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Next</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>	
					</div>
				</div>

                <div class="project-page d-flex justify-content-between align-items-center flex-wrap"
                style="margin-top: 20px;">
                <div class="project mb-4">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#AllStatus"
                                role="tab">Sắp xếp</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#OnProgress"
                                role="tab">Phổ
                                biến</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#Pending" role="tab">Mới
                                nhất</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#Closed" role="tab">Bán
                                chạy</a>
                        </li>
                        <li class="nav-item">
                            <select class="me-sm-2 default-select form-control wide"
                                id="inlineFormCustomSelect">
                                <option class="nav-link" selected="">Giá</option>
                                <option value="1">Từ thấp tới cao</option>
                                <option value="1">Từ cao tới thấp</option>

                            </select>
                        </li>
                    </ul>
                </div>


            </div>
                


<!--        PRODUCT LIST Ở ĐÂY -->
            <div class="row">  
             <c:if test="${empty requestScope.prList}">
		        <h4 style="text-align:center;padding:60px;color:gray;">Xin lỗi, chúng tôi không thể tìm thấy sản phẩm bạn đang tìm kiếm.<br><span><a href="home" style="color:blue;text-decoration:underline;">Quay lại trang chủ</a></span></h4>
		    </c:if>	
		    
		    
		    <c:if test="${not empty requestScope.prList}">


						<c:forEach items="${prList}" var="i">
							
								<div class="col-xl-3 col-lg-6 col-sm-6">
									<div class="card">
										<div class="card-body">
											<div class="new-arrival-product">
												<div class="new-arrivals-img-contnent">
													<a href="Product?id=${i.getProductID()}"> <img
														class="img-fluid" src="${i.getThumbnail()}" alt=""
														style="min-height: 250px; max-height: auto; height: auto; width: 100%;"></a>
												</div>
												<div class="new-arrival-content text-center mt-3">
													<h4>${i.getProName()}</h4>

<!-- 													<ul class="star-rating"> -->
<!-- 														<li><i class="fa fa-star"></i></li> -->
<!-- 														<li><i class="fa fa-star"></i></li> -->
<!-- 														<li><i class="fa fa-star"></i></li> -->
<!-- 														<li><i class="fa fa-star"></i></li> -->
<!-- 														<li><i class="fa fa-star"></i></li> -->
<!-- 														<li><i class="fa fa-star-half-empty"></i></li> -->
<!-- 														<li><i class="fa fa-star-half-empty"></i></li> -->
<!-- 													</ul> -->
													<span class="price">${i.getUnit_Price()} VND</span>
												</div>
											</div>
										</div>
									</div>
								</div>

							</c:forEach>
						

				
					</c:if>
					<div id="product-list" class="row">
							
						</div>
					
					<c:if test="${requestScope.prList.size()>=8}">
						<div class="col-12 text-center mt-4">
						<button id="loadMore" class="btn btn-primary">Xem thêm sản phẩm</button>
					</div>
					</c:if>
					
					
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
<style>
    .clickable-link {
        color: blue; /* Màu mặc định */
        cursor: pointer; /* Biến con trỏ thành bản đồ */
    }

    .clickable-link.clicked {
        color: red; /* Màu khi được nhấn */
    }
</style>
</html>