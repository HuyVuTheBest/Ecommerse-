<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.Category" import="java.util.List" import="dao.DAO"%>
<!DOCTYPE html>
<html lang="vi" dir="ltr" class="translated-ltr">

<head>
<meta charset="utf-8">


<!-- PAGE TITLE HERE -->
<title>Super Sneaker</title>

<!-- FAVICONS ICON -->
<link rel="shortcut icon" type="image/png" href="/img/logo2.ico">
<link href="vendor/jquery-nice-select/css/nice-select.css"
	rel="stylesheet">
<link href="vendor/owl-carousel/owl.carousel.css" rel="stylesheet">
<link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">

<!-- Style css -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="css/slide.css" type="text/css" rel="stylesheet">
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">

</head>
<style>
.page {
	margin: 0 auto;
}

table th, table td {
	text-align: left;
}

table.layout {
	width: 100%;
	border-collapse: collapse;
}

table.display {
	margin: 1em 0;
}

table.display th, table.display td {
	border: 1px solid;
	padding: .5em 1em;
}

table.display th {
	background: #d9dcdc56;
}

table.display td {
	font-weight: bold;
}

table.responsive-table {
	box-shadow: 0 1px 10px;
}

.btncstom {
	width: auto;
	padding-left: 10px;
	padding-right: 10px;;
	background-color: rgb(158, 105, 207);
	border-radius: 10px;;
	height: 30px;
	color: white;
}

/* CSS phụ cho thanh tìm kiếm */
.search-area-container {
	background-color: #fff; /* Màu nền cho thanh tìm kiếm */
	padding: 10px;
	/* Khoảng cách giữa các phần tử bên trong thanh tìm kiếm */
}
</style>
<%
		DAO mydao = new DAO();
		List<Category> categoryList = mydao.getCategoriesByID(2) ;
		request.setAttribute("cateList", categoryList);
		%>




<body>


	<div id="main-wrapper">


		<jsp:include page="adminHeader.jsp"></jsp:include>


		<div class="content-body">
			<!-- row -->
			
			<div class="container-fluid">
				<div class="row">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title " style="margin: auto;">Danh sách tài
								khoản trong hệ thống</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="example5" class="display" style="min-width: 100%;">
									<thead>
										<tr>

											<th>User ID</th>
											<th>Họ và tên</th>
											<th>Số điện thoại</th>
											<th>Email</th>
											<th>Địa chỉ</th>
											<th>Role</th>
											<th>Sửa</th>
											<th>Xoá</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${requestScope.UserList}" var="i">
											<form id="myForm" action="UserManager" method="post">
												<tr>
													<td data-id="${i.getUserID()}">    
													 <input type="hidden" name="uid" id="uid" value="${i.getUserID()}">
													${i.getUserID()}</td>
													<td>${i.getFullname()}</td>
													<td>${i.getNumber()}</td>
													<td>${i.getEmail()}</td>
													<td>${i.getAddress()}</td>
													<td><select name="role">
															
															<option value="Operator"
																${i.getRole() == 'Operator' ? 'selected' : ''}>Operator</option>
															<option value="Customer"
																${i.getRole() == 'Customer' ? 'selected' : ''}>Customer</option>
													</select></td>
													<td>
													 <c:choose>
															    <c:when test="${i.getRole() == 'Admin'}">
															      	<p> Không được sửa</p>
															    </c:when>
															    <c:otherwise>
															        <div class="row">
															            <div class="col">
															                <button type="submit" class="btn btn-success">Sửa</button>
															            </div>
															            <div class="col">
															                <div class="form-check form-switch">
															                    <label class="form-check-label" for="flexSwitchCheckDefault">Khóa</label>
															                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
															                </div>
															            </div>
															        </div>
															    </c:otherwise>
															</c:choose>
														
													</td>
													<td><a href="RemoveUser?uid=${i.getUserID()}"
														class="btn btn-danger shadow btn-xs sharp"><i
															class="fa fa-trash"></i></a></td>
												</tr>
											</form>

										</c:forEach>


									</tbody>
								</table>
								
								
								
								
							</div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>



	<!-- Required vendors -->
	
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	  <script>
	  
	
	  
	  $(document).ready(function() {
		    $('#flexSwitchCheckDefault').change(function() {
		        var isChecked = $(this).prop('checked');
		        var userid =$('#uid').val();
		        
		        console.log('IsChecked:', isChecked); 
		        console.log('UserID:', userid);
		        $.ajax({
		            url: 'UserManager',
		            type: 'POST',
		            data: { 
		            	isChecked: isChecked,
		            	uid: userid
		            	
		            },
		            success: function(response) {
		                alert("Khóa Tài Khoản thành công");
		            },
		            error: function(xhr, status, error) {
		                alert('An error occurred: ' + error);
		            }
		        });    
		    });
		});
    </script>
	
	<script src="vendor/global/global.min.js"></script>
	<script src="vendor/chart.js/Chart.bundle.min.js"></script>
	<script src="vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>


	<!-- Dashboard 1 -->
	<script src="js/dashboard/dashboard-1.js"></script>


	<script src="js/custom.min.js"></script>
	<script src="js/dlabnav-init.js"></script>
	<script src="js/demo.js"></script>
	<script src="js/styleSwitcher.js"></script>





</body>

</html>