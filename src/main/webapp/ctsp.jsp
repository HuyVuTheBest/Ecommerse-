<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
    <title>Super Sneaker - Chi tiết sản phẩm</title>

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

<script>
function showPopup() {
    Swal.fire({   	
        title: 'Thông báo',
        text: 'Bạn cần đăng nhập để sử dụng chức năng này',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Đăng nhập',
        cancelButtonText: 'Đóng',
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = 'Login.jsp';
        }
    });
}

function validateAndSubmitForm(event) {
	 var selectedSize = document.querySelector('input[name="Size"]:checked');
	    if (!selectedSize) {
	        Swal.fire({
	            icon: 'warning',
	            title: 'Chưa chọn kích thước',
	            text: 'Vui lòng chọn một kích thước trước khi thêm vào giỏ hàng.',
	            confirmButtonText: 'OK'
	        });
	    } else {
	        var selectedSizeValue = selectedSize.value;

	    	 var productId = document.getElementById('addToCartLink').getAttribute('data-product-id');
	          document.getElementById('addToCartLink').href = "AddToCart?pid=" + productId + "&size=" + selectedSizeValue;    
	    }
}
</script>
<script>
    function submitComment(event) {
        event.preventDefault(); 

        var formData = $('#commentForm').serialize(); /\
            type: 'POST',
            url: 'Product',
            data: formData,
            success: function(response) {
                alert('Bình luận của bạn đã được gửi!');
                $('#commentForm')[0].reset(); 
            },
            error: function(xhr, status, error) {
                console.error(error);
                alert('Có lỗi xảy ra khi gửi bình luận.');
            }
        });
    }
</script>

<% 
    String loginRequired = request.getParameter("loginRequired");
    if (loginRequired != null) { 
%>
    <script>
        alert("Bạn cần đăng nhập để sử dụng chức năng này.");
    </script>
<% 
    } 
%>
<div id="main-wrapper">
		<jsp:include page="header.jsp"></jsp:include>
	        <div class="content-body">
            <!-- row -->
			
               
            <div class="container-fluid">
				
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
            
                                
                                
                                    <div class="col-xl-3 col-lg-6  col-md-6 col-xxl-5 ">
                                    
                                    
                                     <c:set var="i" value="${requestScope.product}" />
                                    
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade show active" id="first">
                                                <img class="img-fluid" src="${i.getThumbnail()}" alt="">
                                            </div>
                                            
                                        </div>
                                        
                                    </div>
                                    <!--Tab slider End-->
                                    <div class="col-xl-9 col-lg-6  col-md-6 col-xxl-7 col-sm-12">
                                        <div class="product-detail-content">
                                        
												<div class="new-arrival-content pr">
													<h2>${i.getProName()}</h2>


													<!-- <p>Tình trạng: <span class="item"> Còn hàng <i class="fa fa-shopping-basket"></i></span>
                                                </p>-->

		
													<p style="font-weight: 2px; color: #333; font-size: 16px;">
														Giá sản phẩm: <span id="formattedPrice"> </span>${i.getUnit_Price()} VND</p>
													<p>
														Thương hiệu: <span class="item">${i.getCateName()}</span>
													</p>
													<p>
														Thẻ sản phẩm:&nbsp;&nbsp; <span
															class="badge badge-success light">${i.getCateName()}</span>
													</p>

													<p class="text-content" style="text-align: justify;">Chi
														tiết sản phẩm: ${i.getDescription()}</p>

													<div class="d-table mb-2">
														<p class="price float-start d-block"></p>
													</div>
													<div class="comment-review star-rating">
														<ul>
															<li><i class="fa fa-star"></i></li>
															<li><i class="fa fa-star"></i></li>
															<li><i class="fa fa-star"></i></li>
															<li><i class="fa fa-star"></i></li>
															<li><i class="fa fa-star"></i></li>

														</ul>
														<span class="review-text">( 0 lượt đánh giá ) / </span><a
															class="product-review" href="" data-bs-toggle="modal"
															data-bs-target="#reviewModal">Viết đánh giá?</a>
													</div>

													<div class="d-flex align-items-end flex-wrap mt-4">
														<div class="filtaring-area me-3">
															<div class="size-filter">

																<h4 class="m-b-15">Chọn size</h4>
															<div class="btn-group" role="group"
																aria-label="Basic radio toggle button group">
																<c:forEach var="Size" items="${requestScope.sizesArray}">
																	<input class="btn-check" type="radio" name="Size"
																		id="btnradio${Size}" value="${Size}">
																	<label class="btn btn-outline-primary"
																		for="btnradio${Size}">${Size}</label>
																</c:forEach>
															</div>

														</div>
														</div>
														<!--Quantity start-->
														<!-- <div class="col-2 px-0  mb-2 me-3">
														<input type="number" name="num" class="form-control input-btn input-number" value="1"min="0">
													</div> -->
														<!--Quanatity End-->


													</div>
													<br>
													<div class="shopping-cart  mb-2 me-3">

														<a href="#" data-product-id="${i.getProductID()}" id="addToCartLink" class="btn btn-primary" onclick="validateAndSubmitForm(event)"><i class="fa fa-shopping-basket me-2"></i>Thêm vào giỏ hàng</a>

													</div>
												</div>

                                        
                                            <!--Product details-->
                                            
                                        </div>
                                    </div>
                                    
                                    
                                    
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    
                    
					<!-- review -->
					<div class="modal fade" id="reviewModal">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Đánh giá sản phẩm</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal">
									</button>
								</div>
								<div class="modal-body">
									<form>
										<div class="text-center mb-4">
											<img class="img-fluid rounded" width="78" src="/img/username.png" alt="DexignZone">
										</div>
										<div class="mb-3">
											<div class="rating-widget mb-4 text-center">
												<!-- Rating Stars Box -->
												<div class="rating-stars">
													<ul id="stars">
														<li class="star" title="Poor" data-value="1">
															<i class="fa fa-star fa-fw"></i>
														</li>
														<li class="star" title="Fair" data-value="2">
															<i class="fa fa-star fa-fw"></i>
														</li>
														<li class="star" title="Good" data-value="3">
															<i class="fa fa-star fa-fw"></i>
														</li>
														<li class="star" title="Excellent" data-value="4">
															<i class="fa fa-star fa-fw"></i>
														</li>
														<li class="star" title="WOW!!!" data-value="5">
															<i class="fa fa-star fa-fw"></i>
														</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="mb-3">
											<textarea class="form-control" placeholder="Viết bình luận" rows="5"></textarea>
										</div>
										<button class="btn btn-success btn-block">Đánh giá</button>
									</form>
								</div>
							</div>
						</div>
                        
					</div>
                </div> 
                
                <div class="col-xl-12 col-lg-12">
    <div class="card">
        <div class="card-header border-0">
            <div>
                <h4 class="fs-20 font-w700">Bình luận</h4>
                <span>Khách hàng</span>
            </div>

        </div>
			<div class="card-body px-0">
			    <div id="dsbinhluan" style="max-height: 300px; overflow-y: auto;">
			        <c:forEach items="${requestScope.Comments}" var="c">
			            <div class="msg-bx d-flex justify-content-between align-items-center">
			                <div class="msg d-flex align-items-center w-100">
			                    <div class="image-box active">
			                        <img src="img/username.png" alt="">
			                    </div>
			                    <div class="ms-3 w-100">
			                        <h4 class="fs-18 font-w600">${c.getUsername()}</h4>
			                        <span>${c.getComment()}</span>
			                    </div>
			                </div>
			            </div>
			        </c:forEach>
			    </div>
			</div>



						<div class="card-body px-0">
        	<form id="commentForm" action="Product" method="Post" onsubmit="submitComment(event)">
        	     <input type="hidden" name="productId" value="${i.getProductID()}">
        		 <input type="Text" name="comment"  class="form-control" placeholder="Viết Bình Luận Dưới Đây...">
	            <br>
	            <button type="Submit" class="btn btn-success btn-block">Gửi Bình Luận</button>
        	</form>
	           
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