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
.search-area-container {
	background-color: #fff; 
	padding: 10px;
}
.tdParent{
	background-color:rgb(233,255,50);
}
</style>

<body>


	<div id="main-wrapper">


		<jsp:include page="adminHeader.jsp"></jsp:include>


		<div class="content-body">
			<!-- row -->
			<div class="container-fluid">
				<div class="row">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title " style="margin: auto;">Danh mục</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="example5" class="display" style="min-width: 100%;">
									<thead>
										<tr>

											<th>ID Danh Mục</th>
											<th>ID Danh Mục Mẹ</th>
											<th>Tên Danh Mục</th>
											
											<th>Sửa</th>
											<th>Xoá</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${requestScope.CategoryList}" var="i">
											<tr>
											
											<c:choose >
													<c:when test="${i.getParentCatID() == 0}">
														<td class="tdParent">${i.getCategoryID()}</td>
														<td class="tdParent">${i.getParentCatID()}</td>

														<td class="tdParent">${i.getCatName()}</td>

														<td class="tdParent"><a href="#"
															class="btn btn-primary shadow btn-xs sharp me-1"><i
																class="fas fa-pencil-alt"></i></a></td>
														<td class="tdParent"><a href="#"
															class="btn btn-danger shadow btn-xs sharp"><i
																class="fa fa-trash"></i></a></td>
													</c:when>
													<c:otherwise >
														<td >${i.getCategoryID()}</td>
														<td >${i.getParentCatID()}</td>

														<td >${i.getCatName()}</td>

														<td ><a href="#"
															class="btn btn-primary shadow btn-xs sharp me-1"><i
																class="fas fa-pencil-alt"></i></a></td>
														<td ><a href="#"
															class="btn btn-danger shadow btn-xs sharp"><i
																class="fa fa-trash"></i></a></td>
													</c:otherwise>
												</c:choose>
												
											</tr>


										</c:forEach>

									</tbody>
								</table>
								<div class="mb-3" style="margin-top: 20px; float: right;">

									<button type="submit" class="btn btn-primary">
										<i class="fa fa-plus" aria-hidden="true"></i> Thêm danh mục
									</button>
								</div>
							</div>
						</div>





						<!-- BÊN trên LÀ sản phẩm -->
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





</body>

</html>