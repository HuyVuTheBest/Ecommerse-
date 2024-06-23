<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Product" %>
<%@ page import="model.Cart" 
import="dao.DAO"%>
<%@ page import="model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="css/Cart.css">
   

    <!-- PAGE TITLE HERE -->
    <title>Super Sneaker - Shopping Cart</title>

    <!-- FAVICONS ICON -->
    <link rel="shortcut icon" type="image/png" href="/img/logo2.ico">
    <link href="vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
    <link href="vendor/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">

    <!-- Style css -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="css/slide.css"  type="text/css" rel="stylesheet">

</head>
 <style>
        .empty-cart-message {
            text-align: center;
            color: #888;
            font-size: 15px;
            padding: 20px;
        }
    </style>
<body>

	<div id="main-wrapper">
	
	<jsp:include page="header.jsp"></jsp:include>


		<div class="content-body">
			<div class="container-fluid">
			
		            <div class="row">
		                <div class="col-md-8 cart">
		                    <div class="title">
		                        <div class="row">

								<c:set var="cart" value="${sessionScope.cartItem}" />
								<div class="col">
									<h4>
										<b>Giỏ hàng của bạn!</b>
									</h4>
								</div>
								<c:choose>
									<c:when test="${empty cart.getTotalQuantity()}">
										<div class="col align-self-center text-right text-muted">0
											Sản Phẩm</div>
									</c:when>
									<c:otherwise>
										<div class="col align-self-center text-right text-muted">${cart.getTotalQuantity()}
											Sản Phẩm</div>

									</c:otherwise>
								</c:choose>



							</div>
		                    </div>
		                        
		                    
		                    
		                    <div class="row border-top border-bottom">
		                    
		                    	
		                        <div class="row main align-items-center" style="padding-left:20px;">
								    <div class="col-2">Ảnh </div>
								    <div class="col">Tên sản phẩm</div>
								    <div class="col">Số lượng</div>
								    <div class="col">Size</div>
								    
								    <div class="col">Giá đơn vị</div>
								    <div class="col">Tổng giá</div>
								    
								    
								</div>

							<c:choose>
								<c:when test="${empty cart.getCartItemList()}">
									<div class="col-12 empty-cart-message" style="padding:100px;">Giỏ hàng của bạn
										đang trống.</div>
								</c:when>
								<c:otherwise>
									<c:forEach items="${cart.getCartItemList()}" var="i">
										<div class="row main align-items-center"style="padding-left: 20px;">
											<div class="col-2">
												<img class="img-fluid"
													src="${i.getProduct().getThumbnail()}">
											</div>
											<div class="col">${i.getProduct().getProName()}</div>
											<div class="col">
												<a
													href="UserCart?action=decrease&pid=${i.getProduct().getProductID()}">-</a>
												<span class="border"
													id="quantity-${i.getProduct().getProductID()}">${i.getQuantity()}
												</span> <a
													href="UserCart?action=increase&pid=${i.getProduct().getProductID()}">+</a>
											</div>
											<div class="col">${i.getItemSize()}</div>
											
											<div class="col">${i.getProduct().getUnit_Price()} VND</div>
											<div class="col"> ${i.getProduct().getUnit_Price() * i.getQuantity() } VND<span class="close"><a href="remove?pid=${i.getProduct().getProductID()}">&#10005;</a></span>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>

							
		                        
		                        
		                    </div>
		                 
		                    <div class="back-to-shop"><a class="btn btn-primary"  href="home">&leftarrow; <span >Tiếp tục mua hàng</span></a></div>
		                </div>
		                
		                
			                <div class="col-md-4 summary">
			     
			                     <div class="row" style="border-top: 1px solid rgba(0,0,0,.1);"></div>
			                    
			                   <div class="row" style=" padding: 2vh 0;">
							        <div class="col">Tổng sản phẩm</div>
							        <div class="col text-right">${cart.getTotalQuantity()} Sản Phẩm</div>
							    </div>
							    <div class="row" style=" padding: 2vh 0;">
							        <div class="col">Tổng giá tiền</div>
							        <div class="col text-right" > ${cart.getTotalCartPrice()} VND</div>               
							    </div>
			                    <div class="row" style="border-bottom: 1px solid rgba(0,0,0,.1); "> </div>
			                    
			                    <br>


						<c:choose>
							<c:when test="${empty cart.getCartItemList()}">
								<a class="btn btn-primary" href="#">Thanh toán</a>
							</c:when>
							<c:otherwise>
								<a class="btn btn-primary" href="CheckOutPayment">Thanh toán</a>
							</c:otherwise>
						</c:choose>

					</div>
            
			
			
				</div>
				<br>
				<br>
		</div>
		
	</div>
	</div>
	


		

	<script src="vendor/global/global.min.js"></script>
	<script src="vendor/chart.js/Chart.bundle.min.js"></script>
	<script src="vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
	
	<!-- Apex Chart -->
	
	
	<!-- Chart piety plugin files -->
    <script src="vendor/peity/jquery.peity.min.js"></script>
	<!-- Dashboard 1 -->

	
    <script src="js/custom.min.js"></script>
	<script src="js/dlabnav-init.js"></script>
	<script src="js/demo.js"></script>
    <script src="js/styleSwitcher.js"></script>
	
	


</body>
</html>