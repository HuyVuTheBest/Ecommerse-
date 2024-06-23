<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Super Sneaker - Login Page</title>
</head>
<body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://smtpjs.com/v3/smtp.js"></script>

<%
    String successMessage = (String) request.getAttribute("Success");
    if (successMessage != null && !successMessage.isEmpty()) {
%>
    <script>
        Swal.fire({
            icon: 'success',
            title: '<%= successMessage %>',
            showConfirmButton: false,
            timer: 2000 
        });
    </script>
<% } %>

<%
    String errorMessage = (String) request.getAttribute("Error");
    if (errorMessage != null && !errorMessage.isEmpty()) {
%>
    <script>
        Swal.fire({
            icon: 'error',
            title: '<%= errorMessage %>',
            showConfirmButton: false,
            timer: 2000 
        });
    </script>
<% } %>

<script type="text/javascript">



function guilaimail(){
   const maxacnhan = document.getElementsByClassName("xacnhanemail")[0];
    const guima = document.getElementById("guima")
    maxacnhan.style.display="none";
    guima.style.display="block";
  }
    
  var today = new Date();
    var date = 'Ngày '+today.getDate()+' tháng '+(today.getMonth()+1)+' năm '+today.getFullYear();
    var time = 'Lúc '+today.getHours() + " giờ " + today.getMinutes() + " phút "
    var datetime = date + ' '+time
    
   
    function guimail() {
        const email = document.getElementById("nhapemail");
        const tk = document.getElementById("nhaptk");
        const maxacnhan = document.getElementsByClassName("xacnhanemail")[0];
        const guima = document.getElementById("guima")
        var checkmail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        
        if (email.value == "" || tk.value == "") {
            Swal.fire({
                title: "Super Sneaker",
                text: "Vui lòng kiểm tra lại thông tin..!",
                icon: "error",
                showDenyButton: true,
                confirmButtonText: "OK",
            }).then((result) => {
                if (result.isConfirmed) {
                    tk.focus();
                }
            });
        } else if (!checkmail.test(email.value)) {
            Swal.fire({
                title: "Super Sneaker",
                text: "Sai định dạng email..!",
                icon: "error",
                showDenyButton: true,
                confirmButtonText: "OK",
            }).then((result) => {
                if (result.isConfirmed) {
                    email.focus();
                }
            });
        } else {
            let timerInterval;
            Swal.fire({
                title: "Super Sneaker",
                html: "Đang tiến hành gửi mã xác nhận đến email của bạn! \n Vui lòng chờ trong <b></b> giây.",
                icon: "info",
                timer: 2000,
                timerProgressBar: true,
                didOpen: () => {
                    Swal.showLoading();
                    const timer = Swal.getPopup().querySelector("b");
                    timerInterval = setInterval(() => {
                        timer.textContent = `${Swal.getTimerLeft()}`;
                    }, 100);
                },
                willClose: () => {
                    clearInterval(timerInterval);
                }
            }).then((result) => {
                if (result.dismiss === Swal.DismissReason.timer) {
                    let name = tk.value;
                    let otp_code = Math.floor(Math.random() * 1000000); // Generate a random OTP code
                    let datetime = new Date().toLocaleString();

                    let emailbody = `

                    <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <meta charset="UTF-8" />
                        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
                        <title>Static Template</title>
                        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />
                    </head>
                    <body style="margin: 0; font-family: 'Poppins', sans-serif; background: #ffffff; font-size: 14px;">
                        <div style="max-width: 680px; margin: 0 auto; padding: 45px 30px 60px; background: #f4f7ff; background-image: url(https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661497957196_595865/email-template-background-banner); background-repeat: no-repeat; background-size: 800px 452px; background-position: top center; font-size: 14px; color: #434343;">
                            <header>
                                <table style="width: 100%;">
                                    <tbody>
                                        <tr style="height: 0;">
                                            <td><img alt="" src="https://bizweb.dktcdn.net/100/514/587/theme_temp/947235/assets/logo-vip-b92c9bda-249b-4706-8f3c-4685ff351bcf.png?1712777380370" height="50"/></td>
                                            <td style="text-align: right;"><span style="font-size: 13px; line-height: 30px; color: black; font-weight: bold; margin-left: 60px;">`+datetime+`</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </header>
                            <main>
                                <div style="margin: 0; margin-top: 70px; padding: 92px 30px 115px; background: #ffffff; border-radius: 30px; text-align: center;">
                                    <div style="width: 100%; max-width: 489px; margin: 0 auto;">
                                        <h1 style="margin: 0; font-size: 24px; font-weight: 500; color: #1f1f1f;">Mã đặt lại mật khẩu</h1>
                                        <p style="margin: 0; margin-top: 17px; font-size: 16px; font-weight: 500;">Xin chào<span style="color: black; font-weight: bold;"> `+name+`</span>,</p>
                                        <p style="margin: 0; margin-top: 17px; font-weight: 500; letter-spacing: 0.56px;">Cảm ơn bạn đã lựa chọn Super Sneaker. Sử dụng mã OTP sau để hoàn tất quy trình thay đổi mật khẩu. Mã OTP có hiệu lực trong <span style="font-weight: 600; color: #1f1f1f;">5 phút</span>. Vui lòng không chia sẻ mã này với người khác, kể cả các thành viên của <span style="font-weight: 600; color: #1f1f1f;">Super Sneaker</span>.</p>
                                        <p style="margin: 0; margin-top: 60px; font-size: 40px; font-weight: 600; letter-spacing: 25px; color: #ba3d4f;">`+otp_code+`</p>
                                    </div>
                                </div>
                                <p style="max-width: 400px; margin: 0 auto; margin-top: 90px; text-align: center; font-weight: 500; color: #8c8c8c;">Bạn cần giúp đỡ? Liên hệ ngay <a href="mailto:nguyenanh02k1@gmail.com.com" style="color: #499fb6; text-decoration: none;">supersneaker@gmail.com</a> hoặc truy cập <a href="" target="_blank" style="color: #499fb6; text-decoration: none;">Trung tâm trợ giúp</a> của chúng tôi!</p>
                            </main>
                            <footer style="width: 100%; max-width: 490px; margin: 20px auto 0; text-align: center; border-top: 1px solid #e6ebf1;">
                                <p style="margin: 0; margin-top: 40px; font-size: 16px; font-weight: 600; color: #434343;">Super Sneaker</p>
                                <p style="margin: 0; margin-top: 8px; color: #434343;">Địa chỉ: 147 Phương Canh, Q.Nam Từ Liêm, TP.Hà Nội.</p>
                                <div style="margin: 0; margin-top: 16px;">
                                    <a href="https://www.facebook.com/supersneaker.pro" target="_blank" style="display: inline-block;"><img width="36px" alt="Facebook" src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661502815169_682499/email-template-icon-facebook"/></a>
                                    <a href="" target="_blank" style="display: inline-block; margin-left: 8px;"><img width="36px" alt="Instagram" src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661504218208_684135/email-template-icon-instagram"/></a>
                                    <a href="" target="_blank" style="display: inline-block; margin-left: 8px;"><img width="36px" alt="Twitter" src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661503043040_372004/email-template-icon-twitter"/></a>
                                    <a href="" target="_blank" style="display: inline-block; margin-left: 8px;"><img width="36px" alt="Youtube" src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661503195931_210869/email-template-icon-youtube"/></a>
                                </div>
                                <p style="margin: 0; margin-top: 16px; color: #434343;">Bản quyền © 2024 SuperSneaker.</p>
                            </footer>
                        </div>
                    </body>
                    </html>`
                    ;

                    Email.send({
                        SecureToken: "f000c825-0123-4a33-9f0a-bdca81922999", 
                        To: email.value,
                        From: "nguyenanh21k0@gmail.com", 
                        Subject: "OTP Verification - Super Sneaker",
                        Body: emailbody
                    }).then(
                        message => {
                            if (message === "OK") {
                                Swal.fire({
                                    title: "Super Sneaker",
                                    text: "Mã OTP đã được gửi đến email của bạn!",
                                    icon: "success",
                                    confirmButtonText: "OK"
                                }).then(() => {
                                    maxacnhan.style.display = "block";
                                    guima.style.display = "none";
                                });
                                let otp_inp = document.getElementById("maxn");
                                let otp_btn = document.getElementById("laylaimatkhau");
                  
                                otp_btn.addEventListener("click", () => {
                                  if(otp_inp.value==""){
                                    Swal.fire({
                                      title: "Super Sneaker",
                                      text: "Vui lòng nhập mã xác nhận",
                                      icon: "error",
                                      showDenyButton: true,
                                      confirmButtonText: "OK",
                                  }).then((result) => {
                                      if (result.isConfirmed) {
                                         otp_inp.focus();
                                      }
                                  });
                                  }
                                  else if(otp_inp.value == otp_code){
                                	  
                                	  let randomNumber = '';
                                	  for (let i = 0; i < 8; i++) {
                                	      randomNumber += Math.floor(Math.random() * 10); // Sinh số ngẫu nhiên từ 0 đến 9 và thêm vào chuỗi
                                	  }  
                                	
                                    Swal.fire({
                                      title: "Super Sneaker",
                                      text: 'Mật khẩu của bạn là: '+randomNumber,
                                      icon: "success",
                                      showDenyButton: true,
                                      confirmButtonText: "OK",
                                  }).then((result) => {
                                      if (result.isConfirmed) {
                                    	const nhapTkValue = document.getElementById("nhaptk").value;
                                      	const nhapEmailValue = document.getElementById("nhapemail").value;
                                      	  $.ajax({
                                                type: "POST",
                                                url: "ChangePassWordAjax",
                                                data: {
                                                    newPassword: randomNumber,
                                                    username: nhapTkValue,
                                                    email: nhapEmailValue
                                                },
                                                success: function() {
                                                        alert("Password đã được thay đổi thành công!");
                                                        location="Login.jsp"
                                                },
                                                error: function() {
                                                    alert("Password đã được thay đổi thành công!");
                                                    location="Login.jsp"


                                                }
                                            });
                                      }
                                  });
                                
                            } else {
                                Swal.fire({
                                    title: "Super Sneaker",
                                    text: "Mã xác nhận không chính xác hoặc đã hết hiệu lực..!",
                                    icon: "error",
                                    showDenyButton: true,
                                    confirmButtonText: "OK",
                                  }).then((result) => {
                                    if (result.isConfirmed) {
                                      otp_inp.text=="";
                                      otp_inp.focus()
                                    }
                                  });
                                }
                              })
                            }
                        }
                    );
                }
            });
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
                                     
                                <h4 class="text-center mb-4">Đăng nhập</h4>
                                
                                <form action="login" method="post">
                                    <div class="mb-3">
                                        <label class="text-label form-label" for="validationCustomUsername" >Tên đăng nhập</label>
                                        <div class="input-group">
                                            <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                            <input name="username" type="text" class="form-control" id="validationCustomUsername" placeholder="VD: tranh123" required>
                                            <div class="invalid-feedback">
                                               Vui lòng nhập tài khoản.
                                              </div>
                                              
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="text-label form-label" for="dlab-password">Mật khẩu</label>
                                        <div class="input-group transparent-append">
                                            <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                            <input name="password" type="password" class="form-control" id="dlab-password" placeholder="Nhập mật khẩu" required>
                                            <span class="input-group-text show-pass"> 
                                                <i class="fa fa-eye-slash"></i>
                                                <i class="fa fa-eye"></i>
                                            </span>
                                            <div class="invalid-feedback">
                                                Vui lòng nhập mật khẩu.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row d-flex justify-content-between mt-4 mb-2">
                                        
                                        <div class="mb-3">
                                        	
                                        	<span style="color:red;">${error}</span>
                                        	
											<a class="product-review" href="" data-bs-toggle="modal" data-bs-target="#reviewModal">Quên mật khẩu?</a>
                                        </div>
                                    </div>
                                    <div>
                                        <button  type="submit" class="btn btn-primary">Đăng nhập</button>
                                    </div>
                                </form>
                                
                                
                                
                                <div class="new-account mt-3">
                                    <p>Bạn chưa có tài khoản? <a class="text-primary" href="Register.jsp">Đăng ký ngay!</a></p>
                                </div>
								<script src="Chung/js/dangnhap/dangnhap.js"></script>

                            </div>
                            
                        </div>
					</div>
				</div>
            </div>




			<div class="modal fade" id="reviewModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" >Quên mật khẩu</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal">
							</button>
						</div>
						<div class="modal-body">
							<form action="javascript:guimail()">
								<div class="text-center mb-4">
									<img class="img-fluid rounded" width="78" src="img/username.png" alt="DexignZone">
								</div>
								<div class="mb-3">
									<label class="text-label form-label" for="validationCustomUsername">Tên tài khoản đăng ký</label>
									<input id="nhaptk" name="taikhoan" class="form-control" placeholder="Tên tai khoản đăng ký" >
								</div>
								<div class="mb-3">
									<label class="text-label form-label" for="validationCustomUsername">Email đăng ký</label>
									<input id="nhapemail" name="nhapemail" class="form-control" placeholder="Email đăng ký" >
								</div>



								<div class="xacnhanemail"style="display: none;">
									<div class="mb-3">
										<label class="text-label form-label" for="validationCustomUsername">Mã xác nhận</label>
										<input id="maxn" name="maxn" type="number"  class="form-control" placeholder="Mã OTP" >

									</div>
									<div class="mb-3">
										<a style="cursor: pointer;" onclick="guilaimail()" class="mb-3" id="guilaima">Bạn chưa nhận được mã?</a>
									</div>
									<div class="mb-3">
										<a id="laylaimatkhau" class="btn btn-primary btn-block">Lấy lại mật khẩu</a>
									</div>
								</div>

								<a onclick="guimail()"  id="guima" class="btn btn-primary btn-block">Gửi mã xác nhận</a>

							</form>
						</div>
					</div>
				</div>
				
			</div>
	            
	            
	            
	           <jsp:include page="footer.jsp"></jsp:include>
	            
        </div>
        
    </div>
    
	<script src="vendor/global/global.min.js"></script>
	<script src="vendor/chart.js/Chart.bundle.min.js"></script>
	<script src="vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
	
	<!-- Apex Chart -->
	
	
	<!-- Dashboard 1 -->
	<script src="js/dashboard/dashboard-1.js"></script>
	
	<script src="vendor/owl-carousel/owl.carousel.js"></script>
	
    <script src="js/custom.min.js"></script>
	<script src="js/dlabnav-init.js"></script>
	<script src="js/demo.js"></script>
    <script src="js/styleSwitcher.js"></script>
	

</body>
</html>