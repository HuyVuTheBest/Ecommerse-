<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <style>
        .payment-section {
            display: none;
        }
        .payment-section.active {
            display: block;
        }
        .custom-input {
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
        }
        .custom-label {
            font-weight: bold;
        }
    </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
     <script>
     function showPaymentSection(sectionId) {
         document.getElementById('codSection').style.display = 'none';
         document.getElementById('bankTransferSection').style.display = 'none';
         document.getElementById(sectionId).style.display = 'block';
     }
     
     
     var status = '<%= request.getAttribute("status")  %>';
     var message = '<%= request.getAttribute("message")%>';
     var orderID = '<%= request.getAttribute("oid")%>';

     
     if (status !=null && message!=null) {	 
    	 document.addEventListener("DOMContentLoaded", function() {
        	 Swal.fire({
                 title: 'Thông báo',
                 text: message,
                 icon: status === 'success' ? 'success' : 'error',
                 showCancelButton: status === 'success',
                 confirmButtonText: status === 'success' ? 'Xem chi tiết đơn hàng' : 'Đóng',
                 cancelButtonText: 'Đóng'
             }).then((result) => {
                 if (status === 'success' && result.isConfirmed) {
                     window.location.href = 'OrderDetails?oid=' +orderID;
                 }
             });
             
             
         });
     }
    	








    </script>
    
</head>
<body>

   
 
    
    
    
    <div id="main-wrapper">
	
	<jsp:include page="header.jsp"></jsp:include>


		<div class="content-body">
			<!-- row -->
			<div class="container-fluid">
				<div class="card" style="padding-bottom:40px;">
					<div class="container mt-5" >
						<h2 class="text-center mb-4">Phương thức thanh toán</h2>


						<form action="CheckOutPayment" method="post">
							<div class="row" style="padding: 20px;">
								<!-- Left Column: User Information -->
								<div class="col-md-6"
									style="border: 1px solid #ddd; padding: 15px; border-radius: 5px; margin-bottom: 20px;">
									<div class="form-group">
										<label for="name" class="custom-label">Tên người nhận:</label>
										<input type="text" class="form-control custom-input" id="name"
											name="name" required>
									</div>
									<div class="form-group">
										<label for="address" class="custom-label">Địa chỉ nhận
											hàng:</label> <input type="text" class="form-control custom-input"
											id="address" name="address" required>
									</div>
									<div class="form-group">
										<label for="phone" class="custom-label">Số điện thoại
											liên hệ:</label> <input type="text" class="form-control custom-input"
											id="phone" name="phone" required>
									</div>
								</div>
								<!-- Right Column: Payment Method -->
								<div class="col-md-6"
									style="border: 1px solid #ddd; padding: 15px; border-radius: 5px; margin-bottom: 20px;">
									<div class="bordered-div">
										<div class="form-group">
											<div class="row">
												<div class="col-6">
													<div class="form-check">
														<input class="form-check-input" type="radio" id="cod"
															name="paymentMethod" value="COD"
															onclick="showPaymentSection('codSection')" checked>
														<label class="form-check-label" for="cod">Thanh
															toán khi nhận hàng (COD)</label>
													</div>
												</div>
												<div class="col-6">
													<div class="form-check">
														<input class="form-check-input" type="radio"
															id="bankTransfer" name="paymentMethod"
															value="CK"
															onclick="showPaymentSection('bankTransferSection')">
														<label class="form-check-label" for="bankTransfer">Chuyển
															khoản</label>
													</div>
												</div>
											</div>
										</div>
										<div id="codSection" class="payment-section active">
											<h3>Thanh toán khi nhận hàng (COD)</h3>
											<p>Bạn sẽ thanh toán sau khi nhận được hàng trực tiếp từ
												đơn vị giao hàng.</p>
										</div>
										<div id="bankTransferSection" class="payment-section"
											style="display: none;">
											<h3>Chuyển khoản</h3>
											<div class="form-group">
												<label for="bankName">Bank Name:</label> <input type="text"
													class="form-control" id="bankName" name="bankName">
											</div>
											<div class="form-group">
												<label for="accountNumber">Account Number:</label> <input
													type="text" class="form-control" id="accountNumber"
													name="accountNumber">
											</div>
											<div class="form-group">
												<label for="accountHolder">Account Holder:</label> <input
													type="text" class="form-control" id="accountHolder"
													name="accountHolder" >
											</div>
										</div>
									</div>
								</div>
							</div>
							<button type="submit" id="payButton" class="btn btn-primary btn-block mt-4">Thanh Toán</button>
						</form>

					</div>
				</div>



				
				
				<br>
				<br>
			<jsp:include page="footer.jsp"></jsp:include>
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