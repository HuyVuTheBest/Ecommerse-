<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.Category" import="java.util.List" import="dao.DAO"%>
<!DOCTYPE html>
<html lang="vi" dir="ltr" class="translated-ltr">

<head>
<meta charset="utf-8">


<!-- PAGE TITLE HERE -->
<title>Super Sneaker - Edit Product</title>

<!-- FAVICONS ICON -->
<link rel="shortcut icon" type="image/png" href="/img/logo2.ico">
<link href="vendor/jquery-nice-select/css/nice-select.css"
	rel="stylesheet">
<link href="vendor/owl-carousel/owl.carousel.css" rel="stylesheet">
<link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">

<!-- Style css -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="css/slide.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css"
	type="text/css" />
<!-- http://api.jqueryui.com/datepicker/ -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="css/templatemo-style.css">

<script>
        function updateImagePreview() {
            var fileInput = document.getElementById('fileInput');
            var previewImage = document.getElementById('previewImage');
            var filenameDisplay = document.getElementById('filenameDisplay');

            var file = fileInput.files[0];
            if (file) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    previewImage.src = e.target.result;
                }
                reader.readAsDataURL(file);
                filenameDisplay.value = file.name;
            } else {
                previewImage.src = '';
                filenameDisplay.value = '';
            }
        }
    </script>
</head>
<style>
.fixed-size {
    width: 100%;  /* Set your desired width */
    height: 300px; /* Set your desired height */
    object-fit: cover; /* Ensures the image covers the element without distortion */
}
.form-group label {
            font-weight: bold;
            font-size: 1.1em;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }
        .form-group {
            margin-bottom: 15px;
        }
</style>

<body>


	<div id="main-wrapper">


		<jsp:include page="adminHeader.jsp"></jsp:include>


		<div class="content-body">
			<!-- row -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
						<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
							<div class="row">
								<div class="col-12">
									<h2 class="tm-block-title d-inline-block">Thêm sản phẩm</h2>
								</div>
							</div>
							<div class="row tm-edit-product-row">
								<div class="col-xl-6 col-lg-6 col-md-12">

									<form action="ProductManagerAdd" method="post" enctype="multipart/form-data" class="tm-edit-product-form">
										    <div class="form-group mb-3">
														<label for="name">Tên Sản phẩm</label>
														 <input  id="name" placeholder="Vd:Nike Airforce 1..."
															name="ProName" type="text" class="form-control validate"
															required />
													</div>
													<div class="form-group mb-3">
														<label for="description">Mô tả sản phẩm</label>
														<textarea class="form-control validate" name="ProDes" rows="3" placeholder="Vd:San pham A..." required></textarea>
													</div>
													<div class="form-group mb-3">
														<label for="category">Danh mục</label>
														<select  name="ProCategory" class="form-control validate">
			                                                <c:forEach items="${cateList}" var="c">
			                                                    <option value="${c.getCategoryID()}" <c:if test="${c.getCatName() == i.getCateName()}">selected</c:if>>${c.getCatName()}</option>
			                                                </c:forEach>
			                                            </select>
														<br>
														
														
														
													</div>
									
													<div class="row">
														<div class="form-group mb-3 col-xs-12 col-sm-6">
															<label for="expire_date">Số
																lượng </label> <input 
																id="expire_date" name="ProQuan" type="text" placeholder="Vd:20"
																class="form-control validate" data-large-mode="true" />
														</div>
														<div class="form-group mb-3 col-xs-12 col-sm-6">
															<label for="stock">Giá Sản phẩm </label> 
																<input 
																id="stock" name="ProPrice" type="text" placeholder="Vd:300"
																class="form-control validate" required />
														</div>
													</div>
													<div class="row">
													
														<div class="form-group mb-3 col-xs-12 col-sm-6">
															<label for="expire_date">Size</label> 
															<input placeholder="Vd: 39,40,41"
																id="expire_date" name="ProSize" type="text"
																class="form-control validate" data-large-mode="true" />
														</div>
														
													</div>
											</div>
											
											<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
											    <div class="tm-product-img-dummy mx-auto">
											        <!-- Image display area -->
											        <img id="previewImage" class="img-fluid fixed-size" src="img/InserImageIcon.png" alt="" onclick="document.getElementById('fileInput').click();">
											    </div>
											    <div class="custom-file mt-3 mb-3">
											        <!-- Input for file selection -->
											        <input id="fileInput" name="file" type="file" style="display: none;" onchange="updateImagePreview()" />
											        <!-- Button to trigger file selection -->
											        <input type="button" class="btn btn-primary btn-block mx-auto" value="UPLOAD PRODUCT IMAGE" onclick="document.getElementById('fileInput').click();" />
											    </div>
											     
											    <div class="form-group mx-auto">	
											     	<label>Tên File Ảnh:</label>
											     	<input class="form-control" id="filenameDisplay" readonly name="ProImg" value="${i.getThumbnail().substring(i.getThumbnail().lastIndexOf('/') + 1)}">
											     </div>
											    
											</div>
												
											<div class="col-12">
											    <button type="submit" class="btn btn-primary btn-block text-uppercase">Thêm sản phẩm</button>
											</div>
									</form>
										
								
								

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
</div>

		<!-- Required vendors -->
		<script src="vendor/global/global.min.js"></script>
		<script src="vendor/chart.js/Chart.bundle.min.js"></script>
		<script src="vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>


		<!-- Dashboard 1 -->
		<script src="js/dashboard/dashboard-1.js"></script>


		<script src="js/custom.min.js"></script>
		<script src="js/dlabnav-init.js"></script>
		<script src="js/demo.js"></script>
		<script src="js/styleSwitcher.js"></script>

	<script>
	
	
	
	
		function updateImagePreview() {
			const fileInput = document.getElementById('fileInput');
			const previewImage = document.getElementById('previewImage');
		    const filenameDisplay = document.getElementById('filenameDisplay');


			const file = fileInput.files[0];
			if (file) {
				const reader = new FileReader();

				reader.onload = function(e) {
					previewImage.src = e.target.result;
		            filenameDisplay.value = file.name;

				};

				reader.readAsDataURL(file);
			}
		}
	</script>
</body>

</html>