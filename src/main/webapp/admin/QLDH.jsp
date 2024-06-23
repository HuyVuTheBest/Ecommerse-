        
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
.td{
text-align: center;
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

.status-select {
    width: 100%; /* Chiếm toàn bộ chiều rộng của td */
    padding: 5px 10px; /* Thêm khoảng cách trong */
    border: 1px solid #ccc; /* Đường viền màu xám */
    border-radius: 4px; /* Bo tròn các góc */
    background-color: #fff; /* Màu nền trắng */
    font-size: 16px; /* Kích thước chữ */
    color: #333; /* Màu chữ */
    appearance: none; /* Loại bỏ giao diện mặc định của trình duyệt */
    -webkit-appearance: none; /* Đảm bảo tương thích với Safari */
    -moz-appearance: none; /* Đảm bảo tương thích với Firefox */
}

/* Thêm mũi tên tùy chỉnh */
.status-select::after {
    content: '▼'; /* Biểu tượng mũi tên xuống */
    font-size: 12px;
    color: #333;
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    pointer-events: none; /* Đảm bảo không ảnh hưởng đến sự kiện chuột */
}

/* Đảm bảo thẻ td có relative positioning để đặt icon mũi tên tùy chỉnh */
td {
    position: relative;
}

/* Tùy chỉnh thêm khi hover */
.status-select:hover {
    border-color: #888; /* Đổi màu viền khi hover */
}

/* Tùy chỉnh thêm khi focus */
.status-select:focus {
    border-color: #555; /* Đổi màu viền khi focus */
    outline: none; /* Loại bỏ đường viền mặc định khi focus */
}
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script type="text/javascript">

function changeStatus(selectElement, orderID) {
    var newStatus = selectElement.value;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "UpdateStatusServlet", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                console.log(xhr.responseText);
                window.location.href = "OrderManager";
            } else {
                console.error('Lỗi khi gửi yêu cầu AJAX');
            }
        }
    };
    xhr.send("orderID=" + orderID + "&newStatus=" + newStatus);
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
                            <h4 class="card-title " style="margin: auto;" > Quản Lý Đơn Hàng</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <form action="OrderManager" method="post">
                            	<table id="example5" class="display" style="min-width: 100%;">
                                    <thead>
                                        <tr>     
                                            <th>Order ID</th>
                                            <th>User ID</th>
                                            <th>Tên Người Nhận</th>
                                            
                                            <th>Tổng tiền</th>
                                            <th>Trạng thái</th>
                                            <th>Thời gian</th>
                                            <th>Địa chỉ</th>
                                            <th>Chi Tiết</th>
                                            <th>Xoá</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    	<c:forEach var="i" items="${requestScope.OrderList}">
                                    	
                                    	<tr>
                                            <td>${i.getOrderID()}</td>
                                            <td>${i.getUserID()}</td>
                                            <td>${i.getReceiveName()}</td>
                                            <td>${i.getTotalPrice()}VND</td>
                                            <td> 
                                            
                                            		
													
													<select name="Status" class="status-select" onchange="changeStatus(this, ${i.getOrderID()})">
															<option value="1"
																${i.getStatusID() == 1 ? 'selected' : ''}>Chờ Xử Lý</option>
															<option value="2"
																${i.getStatusID() == 2 ? 'selected' : ''}>Hủy</option>
															<option value="4"
																${i.getStatusID() == 4 ? 'selected' : ''}>Đã Giao</option>
													</select>
													
                                            
                                            </td>
                                            <td>${i.getOrderDate()}</td>	 
                                            <td>${i.getReceiveAddress()}</td>	
                                            <td><a href="OrderDetails?oid=${i.getOrderID()}" class="btn btn-primary shadow btn-xs sharp"><i class="fa fa-eye"></i></a></td>											
                                            
                                            <td><input type="hidden" name ="deleteoid" value = "${i.getOrderID()}">
                                            <button type="submit"  class="btn btn-danger shadow btn-xs sharp delete-button"><i class="fa fa-trash"></i></button></td>											
                                        </tr>
                                    	</c:forEach>
                                        
                                        
                                    </tbody>
                                </table>
                            </form>
                                
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

</html>