<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông Tin Cá Nhân</title>
</head>
<style>
    .tm-edit-product-form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .tm-edit-product-form .form-group {
        width: 100%;
    }

</style>


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<script>
        <c:if test="${not empty sessionScope.success}">
            Swal.fire({
                icon: 'success',
                title: 'Thành công',
                text: '${sessionScope.success}',
                confirmButtonText: 'OK'
            });
            <c:remove var="success" scope="session"/>
        </c:if>

        <c:if test="${not empty sessionScope.failed}">
            Swal.fire({
                icon: 'error',
                title: 'Thất bại',
                text: '${sessionScope.failed}',
                confirmButtonText: 'OK'
            });
            <c:remove var="failed" scope="session"/>
        </c:if>
    </script>
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
			<div class="container rounded bg-white mt-5 mb-5"
				style="padding-bottom: 40px;">
				
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12">
							<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
								<div class="row">
									<div class="col-12">
										<h2 class="text-center">Thông tin cá nhân ${requestScope.success}</h2>
										
									</div>
									<br>
									<br>
								</div>
								    <c:set var="i" value="${requestScope.UserPR}" />
								<div class="row tm-edit-product-row">
									<div class="col-xl-6 col-lg-6 col-md-12 mx-auto">
									
										<form action="UserInformation" method="post"
											class="tm-edit-product-form">
											<div class="form-group mb-3">
												<input type="hidden" name="productId" value=""> <label
													for="name">Họ và Tên Người Dùng</label> <input value="${i.getFullname()}"
													id="name" name="FullName" type="text"
													class="form-control validate" required />
											</div>
											
											<div class="row">
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="expire_date">Số Điện Thoại</label> <input
														value="${i.getNumber()}" id="expire_date" name="Phone" type="text"
														class="form-control validate" data-large-mode="true" />
												</div>
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label for="stock">Email</label> 
													 <input
												        value="${i.getEmail()}" 
												        id="email" 
												        name="Email" 
												        type="email"
												        class="form-control validate" 
												        required 
												        pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
												        title="Please enter a valid email address." />
	
														
												</div>
												<div class="form-group mb-3">
												<label for="description"> Địa chỉ</label>
												<textarea class="form-control validate" name="Address"
																rows="3" required>${i.getAddress()}</textarea>
												</div>
											</div>
											<div class="col-12">
												<div class="row">
												<div class="col-md-6 mb-3">
														<a class="btn btn-primary btn-block text-uppercase"
															href="Profile.jsp">Quay lại</a>
													</div>
													<div class="col-md-6 mb-3">
														<button type="submit"
															class="btn btn-success btn-block text-uppercase">Cập
															Nhật </button>
													</div>
													
												</div>
											</div>
										</form>
										
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


	<script>
    document.getElementById('email').addEventListener('input', function (event) {
        const emailField = event.target;
        const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        const isValid = emailPattern.test(emailField.value);

        if (!isValid) {
            emailField.setCustomValidity('Please enter a valid email address.');
        } else {
            emailField.setCustomValidity('');
        }
    });
</script>
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