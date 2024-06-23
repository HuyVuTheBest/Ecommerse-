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


    /* CSS phụ cho thanh tìm kiếm */
    .search-area-container {
        background-color: #fff; /* Màu nền cho thanh tìm kiếm */
        padding: 10px; /* Khoảng cách giữa các phần tử bên trong thanh tìm kiếm */
    }
</style>
						<%
		DAO mydao = new DAO();
		List<Category> categoryList = mydao.getCategoriesByID(2) ;
		request.setAttribute("cateList", categoryList);
		%>


<script>

    function DeletePopup(link) {
        var productId = link.closest('tr').querySelector('.productId').dataset.productId;
    	console.log("Day la id cua product "+productId);

        Swal.fire({   	
            title: 'Thông báo',
            text: 'Bạn có chắc muốn xóa sản phẩm chứ?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy',
        }).then((result) => {
            if (result.isConfirmed) {

                window.location.href = 'RemoveProduct?pid=' + productId;

            }
        });
        
    }
    </script>
<body>


	<div id="main-wrapper">


		<jsp:include page="adminHeader.jsp"></jsp:include>


		<div class="content-body">
			<!-- row -->
			<div class="container-fluid">
				<div class="row">
					

					<div class="card">
						<div class="card-header">
							<h4 class="card-title " style="margin: auto;">Quản Lý Sản phẩm</h4>
						</div>
						
						<div class="card-body">
   							 <div class="container search-area-container">
							<div class="row">
								
								<div class="col-md-auto">
									<form action="ProductManager" method="post">
										<div class="input-group search-area" style="width: 400px; border: 2px solid #ccc; border-radius: 40px; overflow: hidden;">
										    <input type="text" class="form-control" name="keyword" placeholder="Tìm kiếm theo tên sản phẩm..." style="overflow: visible;border: none; outline: none; width: calc(100% - 50px); padding: 10px;">
										    <button  type="submit" style="width: 50px; background-color: rgb(158, 105, 207); color: white; border: none; border-radius: 0 40px 40px 0;">
										        <i class="flaticon-381-search-2" style="font-size: 20px;"></i>
										    </button>
										</div>
								    </form>
								</div>
								
								
								
								    
							</div>
							</div>
						
							
							
							
							
						
						
							<div class="table-responsive">
								<table id="example5" class="display" style="min-width: 100%;">
									<thead>
										<tr>

											<th>ID</th>
											<th>Ảnh sản phẩm</th>
											<th>Tên sản phẩm</th>
											<th>Giá</th>
											<th>Số lượng</th>
											<th>Hãng/ Dòng sản phẩm</th>
											<th>Sửa</th>
											<th>Xoá</th>
										</tr>
									</thead>
									
									
									<tbody>
										
										 <c:forEach items="${prList}" var="i" >
										 	<tr>
											 	<td class="productId" data-product-id="${i.getProductID()}" >${i.getProductID()}</td>
												<td><img src="${i.getThumbnail()}" width="80" height="80"></td>
												<td>${i.getProName()}</td>
												<td>${i.getUnit_Price()}VND</td>
												<td>${i.getUnitInStock()}</td>
												<td>${i.getCateName()}</td>
												<td><a href="ProductDetailEdit?pid=${i.getProductID()}"
														class="btn btn-primary shadow btn-xs sharp me-1"><i
														class="fas fa-pencil-alt"></i></a></td>
												<td><a onclick="DeletePopup(this)" href="#"
													class="btn btn-danger shadow btn-xs sharp"><i
														class="fa fa-trash"></i></a></td>
													
											</tr>
										 </c:forEach>
									
									</tbody>
									
								</table>
								
								<div class="mb-3" style="margin-top: 20px; float: right;">
									<a href="ProductManagerAdd">
										<button type="submit" class="btn btn-primary">
											<i class="fa fa-plus" aria-hidden="true"></i> Thêm sản phẩm
										</button>
									</a>
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