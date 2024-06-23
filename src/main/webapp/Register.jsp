<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<title>Super Sneaker - Register Page</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<%
    String existMsg = (String) request.getAttribute("UserExist");
    if (existMsg != null && !existMsg.isEmpty()) {
%>
    <script>
        Swal.fire({
            icon: 'warning',
            title: '<%= existMsg %>',
            showConfirmButton: true,
        });
    </script>
<% } %>


<script>
function togglePasswordVisibility2() {
    var passwordInput = document.getElementById("passWordReType");
    var eyeIcon = document.getElementById("icon2");

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        eyeIcon.InnerHTML =='<i class="fa fa-eye-slash"> </i>;'
    } else {
        passwordInput.type = "password";
        eyeIcon.InnerHTML =='<i class="fa fa-eye"> </i>;'

    }
}

function togglePasswordVisibility() {
    var passwordInput = document.getElementById("passWord");
    var eyeIcon = document.getElementById("icon1");

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        eyeIcon.InnerHTML =='<i class="fa fa-eye-slash"> </i>'
    } else {
        passwordInput.type = "password";
        eyeIcon.InnerHTML =='<i class="fa fa-eye"> </i>'

    }
}

function checkPasswordMatch() {
	  var password = document.getElementById("passWord").value;
	    var confirmPassword = document.getElementById("passWordReType").value;
	    var passwordInput = document.getElementById("passWordReType");
	    var passwordMismatchError = document.getElementById("passwordMismatchError");

	    if (password !== confirmPassword) {
	        passwordInput.setCustomValidity("Mật khẩu không khớp");
	        passwordMismatchError.style.display = "block"; // Hiển thị thông báo lỗi
	    } else {
	        passwordInput.setCustomValidity("");
	        passwordMismatchError.style.display = "none"; // Ẩn thông báo lỗi
	    }
}

</script>


     <div id="main-wrapper">
     
     
    	<jsp:include page="header.jsp"></jsp:include>

        <div class="content-body">
        
	        <div class="container-fluid">
					<div class="row">
						<div class="col-xl-12">
	                        <div class="card">
	
	                           
	                            <div class="auth-form">
	                                
	                                <h4 class="text-center mb-4">Đăng ký  </h4>
	                                                            
	                                <form action="Register" method = "post">
										<div class="mb-3">
	                                        <label class="text-label form-label" for="validationCustomUsername">Họ và tên</label>
	                                        <div class="input-group">
	                                            <input type="text" class="form-control" name="FullName" placeholder="VD: Nguyễn Trọng Anh" required>
	                                            <div class="invalid-feedback">
	                                               Vui lòng nhập họ tên.
	                                              </div>
	                                        </div>
	                                    </div>
										<div class="mb-3">
	                                        <label class="text-label form-label" for="validationCustomUsername">Email</label>
	                                        <div class="input-group">
	                                            <input type="email" class="form-control" name="Email" placeholder="VD: supersneaker@gmail.com" required>
	                                            <div class="invalid-feedback">
	                                               Vui lòng nhập email.
	                                              </div>
	                                        </div>
	                                    </div>
	                                    <div class="mb-3">
	                                        <label class="text-label form-label" for="validationCustomUsername">Tên đăng nhập <span style="color:red;margin-left:20px;">${requestScope.UserExist}</span></label>                                        
	                                        <div class="input-group">
	                                            <input type="text" class="form-control" name="UserName" placeholder="VD: tranh123" required>
	                                            <div class="invalid-feedback">
	                                               Vui lòng nhập tên đăng nhập.
	                                              </div>
	                                        </div>
	                                    </div>
										
	                                    <div class="mb-3">
	                                        <label class="text-label form-label" for="dlab-password">Mật khẩu</label>
	                                        <div class="input-group transparent-append">
                                        		<input type="password" class="form-control" name="PassWord" id="passWord" placeholder="Nhập mật khẩu" required onkeyup="checkPasswordMatch()">
	                                            <span class="input-group-text show-pass" id="icon1"  onclick="togglePasswordVisibility()"> 
	                                            	 <i class="fa fa-eye-slash"></i>
	                                            </span>
	                                            <div class="invalid-feedback">
	                                                Vui lòng nhập mật khẩu.
	                                            </div>
	                                         
	                                        </div>
	                                    </div>
	                                    
										<div class="mb-3">
										    <label class="text-label form-label" for="dlabpassword">Nhập lại mật khẩu</label>
										    <div class="input-group transparent-append">
										        <input type="password" class="form-control" name="PassWordReType" id="passWordReType" placeholder="Nhập lại mật khẩu" required onkeyup="checkPasswordMatch()">
										        <span class="input-group-text show-pass" id="icon2" onclick="togglePasswordVisibility2()"> 
										            <i class="fa fa-eye-slash"></i>                                              
										        </span>
										        <div class="invalid-feedback" id="passwordMismatchError">
										            Mật khẩu không khớp.
										        </div>                                            
										    </div>
										</div>

	                                    <div class="row d-flex justify-content-between mt-4 mb-2">
	                                        <div class="mb-3">
	                                           <div class="form-check custom-checkbox ms-1">
	                                                <input required style="cursor: pointer;" type="checkbox" class="form-check-input" name="DKCheckBox">
	                                                <label class="form-check-label" for="basic_checkbox_1" >Tôi đông ý với <a style="cursor: pointer;" onclick="dieukhoan()">điều khoản & chính sách</a> </label>
	                                            </div>
	                                        </div>
	                                        
	                                    </div>
	                                    <div>
	                                   
	                                        <button  type="submit" class="btn btn-primary">Đăng ký</button>
	                                    </div>
	                                </form>
	                                <div class="new-account mt-3">
	                                    <p>Bạn có tài khoản? <a class="text-primary" href="/Chung/dangnhap.html">Đăng nhập ngay!</a></p>
	                                </div>
	
	                            </div>
	                            
	                        </div>
						</div>
					</div>
	            </div>
	            
	           <jsp:include page="footer.jsp"></jsp:include>
	            
        </div>
        
    </div>
    
<script src="vendor/global/global.min.js"></script>

<script src="vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
	
	
	
    <script src="js/custom.min.js"></script>
	<script src="js/dlabnav-init.js"></script>
	<script src="js/demo.js"></script>
    <script src="js/styleSwitcher.js"></script>
	