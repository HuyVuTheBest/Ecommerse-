
<%@page import="model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="model.Category" import="java.util.List"%>
<%@ page import="dao.DAO"%>
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
<meta property="og:description"
	content="SuperSneaker : Lựa chọn hàng đầu">
<meta property="og:image"
	content="https://supersneaker13.000webhostapp.com/ProjectSuperSneaker/img/banner.jpg">
<meta name="format-detection" content="telephone=no">

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">



</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    function logoutPopup() {
        Swal.fire({   	
            title: 'Thông báo',
            text: 'Bạn có chắc muốn đăng xuất khỏi tài khoản chứ?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy',
        }).then((result) => {
            if (result.isConfirmed) {
                // Điều hướng đến trang đăng nhập khi người dùng nhấn vào Đăng nhập
                window.location.href = 'logout';
            }
        });
    }

	

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
    
    
    window.onload = function() {
        var loginSuccess = ${sessionScope.loginSuccess == true};

        if (loginSuccess) {
            showSuccessPopup();
            <% session.removeAttribute("loginSuccess"); %>
        }
        
        var bellLink = document.getElementById('bell-link');
    	
	    if (${sessionScope.account != null}) {
	        bellLink.href = 'UserCart';
	    } else {
	        bellLink.addEventListener('click', function(event) {
	            event.preventDefault(); // Ngăn chặn hành động mặc định của liên kết
	            showPopup();
	        });
	    }
        
        
    };

    function showSuccessPopup() {
        Swal.fire({
            title: 'Đăng nhập thành công',
            icon: 'success',
            timer: 2000 // Thời gian hiển thị thông báo
        });
    }
    
    
</script>





<body>


	<div class="nav-header">
		<a href="home" class="brand-logo"> <img src="img/logo2.png"
			width="50" height="50">
			<div class="brand-title">
				<h2 class="">Super Sneaker</h2>
				<span class="brand-sub-title">@supersneaker</span>
			</div>
		</a>
		<div class="nav-control">
			<div class="hamburger">
				<span class="line"></span><span class="line"></span><span
					class="line"></span>
			</div>
		</div>
	</div>

	<div class="header border-bottom">
		<div class="header-content">
			<nav class="navbar navbar-expand">
				<div class="collapse navbar-collapse justify-content-between">
					<div class="header-left"></div>
					<ul class="navbar-nav header-right">

						<c:if test="${sessionScope.account !=null}">
							<c:set value="${sessionScope.account}" var="i" ></c:set>
							<li class="nav-item d-flex align-items-center"> Xin chào  ${i.getFullname()}</li>
						</c:if>

						<li class="nav-item d-flex align-items-center">


							<form action="searchProduct" method="post">
								<div class="input-group search-area"
									style="width: 400px; border: 2px solid #ccc; border-radius: 40px; overflow: hidden;">
									<input type="text" class="form-control" name="keyword"
										placeholder="Tìm kiếm theo tên sản phẩm..."
										style="overflow: visible; border: none; outline: none; width: calc(100% - 50px); padding: 10px;">
									<button type="submit"
										style="width: 50px; background-color: rgb(158, 105, 207); color: white; border: none; border-radius: 0 40px 40px 0;">
										<i class="flaticon-381-search-2" style="font-size: 20px;"></i>
									</button>
								</div>
							</form>

						</li>


						<c:set var="cart" value="${sessionScope.cartItem}" />
						<li class="nav-item dropdown notification_dropdown"><a
							id="bell-link" class="nav-link bell-link"><svg width="28"
									height="28" xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
									width="256" height="256" viewBox="0 0 256 256"
									xml:space="preserve" fill="none">                            
                                        <g
										style="stroke: none; stroke-width: 0; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: none; fill-rule: nonzero; opacity: 1;"
										transform="translate(1.4065934065934016 1.4065934065934016) scale(2.81 2.81)">
                                            <path
										d="M 73.713 65.44 H 27.689 c -3.566 0 -6.377 -2.578 -6.686 -6.13 c -0.21 -2.426 0.807 -4.605 2.592 -5.939 L 16.381 21.07 c -0.199 -0.889 0.017 -1.819 0.586 -2.53 s 1.431 -1.124 2.341 -1.124 H 87 c 0.972 0 1.884 0.471 2.446 1.263 c 0.563 0.792 0.706 1.808 0.386 2.725 l -7.798 22.344 c -1.091 3.13 -3.798 5.429 -7.063 5.999 l -47.389 8.281 c -0.011 0.001 -0.021 0.003 -0.032 0.005 c -0.228 0.04 -0.623 0.126 -0.568 0.759 c 0.056 0.648 0.48 0.648 0.708 0.648 h 46.024 c 1.657 0 3 1.343 3 3 S 75.37 65.44 73.713 65.44 z"
										style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10;  fill-rule: nonzero; opacity: 1;"
										transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"
										fill="#717579"></path>
                                            <circle cx="28.25" cy="75.8"
										r="6.5"
										style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10;  fill-rule: nonzero; opacity: 1;"
										transform="  matrix(1 0 0 1 0 0) " fill="#717579"></circle>
                                            <circle
										cx="68.28999999999999" cy="75.8" r="6.5"
										style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill-rule: nonzero; opacity: 1;"
										transform="  matrix(1 0 0 1 0 0) " fill="#717579"></circle>
                                            <path
										d="M 19.306 23.417 c -1.374 0 -2.613 -0.95 -2.925 -2.347 l -1.375 -6.155 c -0.554 -2.48 -2.716 -4.212 -5.258 -4.212 H 3 c -1.657 0 -3 -1.343 -3 -3 s 1.343 -3 3 -3 h 6.749 c 5.372 0 9.942 3.662 11.113 8.904 l 1.375 6.155 c 0.361 1.617 -0.657 3.221 -2.274 3.582 C 19.742 23.393 19.522 23.417 19.306 23.417 z"
										style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill-rule: nonzero; opacity: 1;"
										transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"
										fill="#717579"></path>
                                        </g>
                                        </svg> <span
								class="badge light text-white bg-danger rounded-circle">${cart.getTotalQuantity()}</span>
						</a></li>




						<li class="nav-item dropdown notification_dropdown"><a
							class="nav-link" href="javascript:void(0);" role="button"
							data-bs-toggle="dropdown"> <svg version="1.1" id="Capa_1"
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" width="28"
									height="28" viewBox="0 0 342.52 342.52" xml:space="preserve">
									<g>
										<g>
											<path
										d="M171.254,110.681c-14.045,0-25.47,11.418-25.47,25.476v21.773h50.933v-21.773
												C196.724,122.104,185.29,110.681,171.254,110.681z"
										fill="#717579"></path>
											<path
										d="M171.26,0C76.825,0,0.006,76.825,0.006,171.257c0,94.438,76.813,171.263,171.254,171.263
												c94.416,0,171.254-76.825,171.254-171.263C342.514,76.825,265.683,0,171.26,0z M226.225,239.291c0,4.119-3.339,7.446-7.458,7.446
												h-95.032c-4.113,0-7.446-3.327-7.446-7.446v-73.91c0-4.119,3.333-7.458,7.446-7.458h7.152V136.15
												c0-22.266,18.113-40.361,40.367-40.361c22.251,0,40.355,18.095,40.355,40.361v21.773h7.151c4.119,0,7.458,3.338,7.458,7.458v73.91
												H226.225z"
										fill="#717579"></path>
										</g>
									</g>
									</svg>
						</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a href="Register.jsp" class="dropdown-item ai-icon"> <svg
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
										width="18" height="18" viewBox="0 0 256 256"
										xml:space="preserve">

											<defs>
											</defs>
											<g
											style="stroke: none; stroke-width: 0; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: none; fill-rule: nonzero; opacity: 1;"
											transform="translate(1.4065934065934016 1.4065934065934016) scale(2.81 2.81)">
												<circle cx="69.253" cy="75.333" r="10.973"
											style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"
											transform="  matrix(1 0 0 1 0 0) " />
												<path
											d="M 38.877 40.375 L 38.877 40.375 c -9.415 0 -17.118 -7.703 -17.118 -17.118 v -6.139 C 21.759 7.703 29.462 0 38.877 0 h 0 c 9.415 0 17.118 7.703 17.118 17.118 v 6.139 C 55.995 32.672 48.292 40.375 38.877 40.375 z"
											style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10;  fill-rule: nonzero; opacity: 1;"
											transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"
											fill="#717579"></path>
												<path
											d="M 50.103 75.603 c 0 -10.209 7.969 -18.535 18.022 -19.154 c -3.98 -7.222 -11.159 -12.461 -19.609 -13.722 c -2.896 1.499 -6.169 2.363 -9.639 2.363 c -3.47 0 -6.743 -0.863 -9.639 -2.363 C 16.296 44.659 6.286 55.889 6.286 69.347 v 17.707 C 6.286 88.674 7.612 90 9.232 90 h 47.391 C 52.633 86.479 50.103 81.342 50.103 75.603 z"
											style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill-rule: nonzero; opacity: 1;"
											transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"
											fill="#717579"></path>
												<path
											d="M 69.317 61.206 c -7.951 0 -14.397 6.446 -14.397 14.397 C 54.92 83.554 61.366 90 69.317 90 c 7.951 0 14.397 -6.446 14.397 -14.397 C 83.714 67.652 77.268 61.206 69.317 61.206 z M 77.351 77.375 c 0 0.57 -0.462 1.032 -1.032 1.032 h -4.012 v 4.012 c 0 0.57 -0.462 1.032 -1.032 1.032 h -3.756 c -0.57 0 -1.032 -0.462 -1.032 -1.032 v -4.012 h -4.012 c -0.57 0 -1.032 -0.462 -1.032 -1.032 v -3.756 c 0 -0.57 0.462 -1.032 1.032 -1.032 h 4.012 v -4.012 c 0 -0.57 0.462 -1.032 1.032 -1.032 h 3.756 c 0.57 0 1.032 0.462 1.032 1.032 v 4.012 h 4.012 c 0.57 0 1.032 0.462 1.032 1.032 V 77.375 z"
											style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(240,88,47); fill-rule: nonzero; opacity: 1;"
											transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
											</g>
											</svg> <span class="ms-2">Đăng ký</span>
								</a> <a href="Login.jsp" class="dropdown-item ai-icon"> <svg
										id="icon-logout" xmlns="http://www.w3.org/2000/svg"
										class="text-danger" width="18" height="18" viewbox="0 0 24 24"
										fill="none" stroke="currentColor" stroke-width="2"
										stroke-linecap="round" stroke-linejoin="round">
												<path
											d="M15 4H18C19.1046 4 20 4.89543 20 6V18C20 19.1046 19.1046 20 18 20H15M11 16L15 12M15 12L11 8M15 12H3"
											stroke="blue" stroke-width="1.5" stroke-linecap="round"
											stroke-linejoin="round"></path>
												</svg> <span class="ms-2">Đăng nhập</span>
								</a>
								<c:if test="${sessionScope.account != null}">

									<a style="cursor: pointer;" onclick='logoutPopup()'
										class="dropdown-item ai-icon"> <svg id="icon-logout"
											xmlns="http://www.w3.org/2000/svg" class="text-danger"
											width="18" height="18" viewbox="0 0 24 24" fill="none"
											stroke="currentColor" stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round">
											<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
											<polyline points="16 17 21 12 16 7"></polyline>
											<line x1="21" y1="12" x2="9" y2="12"></line></svg> <span
										class="ms-2">Đăng xuất</span>
									</a>

									<a style="cursor: pointer;" href="Profile.jsp"
										class="dropdown-item ai-icon"> <svg width="18" height="18" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464H398.7c-8.9-63.3-63.3-112-129-112H178.3c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3z"/></svg><span class="ms-2">Hồ sơ</span>
									</a>


								</c:if>

							</div></li>




						<li class="nav-item dropdown  header-profile"></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>

	<%
DAO mydao = new DAO();
List<Category> categoryList = mydao.getCategoriesByID(2) ;
request.setAttribute("cateList", categoryList);
%>

	<div class="dlabnav">
		<div class="dlabnav-scroll">
			<ul class="metismenu" id="menu">
				<li><a class="" href="home" aria-expanded="false"> <i
						class="fas fa-home"></i> <span class="nav-text">Trang chủ</span>
				</a></li>
				<li><a class="" href="gioithieu.jsp" aria-expanded="false">
						<i class="fas fa-home"></i> <span class="nav-text">Giới
							thiệu</span>
				</a></li>
				<li><a class="" href="lienhe.jsp" aria-expanded="false"> <i
						class="fas fa-home"></i> <span class="nav-text">Liên hệ</span>
				</a></li>

				<li><a class="has-arrow " href="javascript:void()"
					aria-expanded="false"> <i class="fas fa-info-circle"></i> <span
						class="nav-text">Danh mục</span>
				</a>
					<ul aria-expanded="false">

						<c:forEach items="${cateList}" var="i">
							<li><a href="home?categoryID=${i.getCategoryID()}">${i.getCatName()}</a></li>

						</c:forEach>
					</ul></li>

				

			</ul>



		</div>
	</div>



</body>
</html>