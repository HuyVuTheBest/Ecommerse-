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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="robots" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="SuperSneaker: Siêu giày thể thao">
    <meta property="og:title" content="SuperSneaker : Mua ngay kẻo hết">
    <meta property="og:description" content="SuperSneaker : Lựa chọn hàng đầu">
    <meta property="og:image" content="https://supersneaker13.000webhostapp.com/ProjectSuperSneaker/img/banner.jpg">
    <meta name="format-detection" content="telephone=no">

    <!-- PAGE TITLE HERE -->
    <title>Super Sneaker</title>

    <!-- FAVICONS ICON -->
    <link rel="shortcut icon" type="image/png" href="/img/logo2.ico">
    <link href="vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
    <link href="vendor/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">

    <!-- Style css -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="css/slide.css"  type="text/css" rel="stylesheet">

</head> 

<body>

 
    <div id="main-wrapper">
    
    
		<jsp:include page="header.jsp"></jsp:include>
		

        <div class="content-body">
        
          <div class="container-fluid">
				<div class="d-flex justify-content-between align-items-center flex-wrap">
					<div class="input-group contacts-search mb-4">
						<input type="text" class="form-control" placeholder="Tìm kiếm">
						<span class="input-group-text"><a href="javascript:void(0)"><i class="flaticon-381-search-2"></i></a></span>
					</div>
					
				</div>	
				<div class="row">
					<div class="col-xl-12">
						<div class="row">
								<div class="card contact-bx item-content">
									<div class="card-header border-0">
										<div class="action-dropdown">
											<div class="dropdown ">
												<div class="btn-link" data-bs-toggle="dropdown">
													<svg width="24" height="24" viewbox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
														<circle cx="12.4999" cy="3.5" r="2.5" fill="#A5A5A5"></circle>
														<circle cx="12.4999" cy="11.5" r="2.5" fill="#A5A5A5"></circle>
														<circle cx="12.4999" cy="19.5" r="2.5" fill="#A5A5A5"></circle>
													</svg>
												</div>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" href="javascript:void(0)">Xoá</a>
													<a class="dropdown-item" href="javascript:void(0)">Sửa</a>
												</div>
											</div>
										</div>
									</div>
									<div class="card-body user-profile">
										<div class="image-bx">
											<a href=""><img src="img/admintranh.jpg" data-src="img/admintranh.jpg" alt="" class="rounded-circle"></a>
											<span class="active"></span>
										</div>
										<div class="media-body user-meta-info">
											<h6 class="fs-18 font-w600 my-1" class="text-black user-name" data-name="Alan Green">Nguyễn Trọng Anh</a></h6>
											<p class="fs-14 mb-3 user-work" data-occupation="UI Designer">Admin.</p>
											<ul>
												<li><a href="javascript:void(0);"><i class="fas fa-phone-alt"></i></a></li>
												<li><a href="javascript:void(0);"><i class="far fa-comment-alt"></i></a></li>
												<li><a href="javascript:void(0);"><i class="fas fa-video"></i></a></li>
											</ul>
										</div>
									</div>
							</div>
								<div class="card contact-bx item-content">
									<div class="card-header border-0">
										<div class="action-dropdown">
											<div class="dropdown ">
												<div class="btn-link" data-bs-toggle="dropdown">
													<svg width="24" height="24" viewbox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
														<circle cx="12.4999" cy="3.5" r="2.5" fill="#A5A5A5"></circle>
														<circle cx="12.4999" cy="11.5" r="2.5" fill="#A5A5A5"></circle>
														<circle cx="12.4999" cy="19.5" r="2.5" fill="#A5A5A5"></circle>
													</svg>
												</div>
												
												<!-- <div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" href="javascript:void(0)">Xoá</a>
													<a class="dropdown-item" href="javascript:void(0)">Sửa</a>
												</div> -->
												
												
											</div>
										</div>
									</div>
									<div class="card-body user-profile">
										<div class="image-bx">
											<a href=""><img src="img/adminhuyvu.jpg" data-src="img/adminhuyvu.jpg" alt="" class="rounded-circle"></a>
											<span class="active"></span>
										</div>
										<div class="media-body user-meta-info">
											<h6 class="fs-18 font-w600 my-1" class="text-black user-name" data-name="Alan Green">Vũ Nguyên Huy</h6>
											<p class="fs-14 mb-3 user-work" data-occupation="UI Designer">Admin</p>
											<ul>
												<li><a href="javascript:void(0);"><i class="fas fa-phone-alt"></i></a></li>
												<li><a href="javascript:void(0);"><i class="far fa-comment-alt"></i></a></li>
												<li><a href="javascript:void(0);"><i class="fas fa-video"></i></a></li>
											</ul>
										</div>
									</div>
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
	<script>
		function cardsCenter()
		{
			
			/*  testimonial one function by = owl.carousel.js */
			
	
			
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