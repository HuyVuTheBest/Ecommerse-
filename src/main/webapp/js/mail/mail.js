


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
    if(email.value=="" || tk.value==""){
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
    }
    else if(!checkmail.test(email.value)){
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
    }
    else{
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
      //chuyentrang
      if (result.dismiss === Swal.DismissReason.timer) {
        let name = tk.value;
        let otp_code = Math.floor(Math.random() * 1000000);      
        let emailbody = `<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0" /><meta http-equiv="X-UA-Compatible" content="ie=edge" /><title>Static Template</title><link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"rel="stylesheet"/></head> <body style="margin: 0; font-family: 'Poppins', sans-serif; background: #ffffff;font-size: 14px; "><div style=" max-width: 680px; margin: 0 auto;padding: 45px 30px 60px;background: #f4f7ff; background-image: url(https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661497957196_595865/email-template-background-banner);background-repeat: no-repeat;background-size: 800px 452px;background-position: top center;font-size: 14px; color: #434343;"><header><table style="width: 100%;"><tbody><tr style="height: 0; " ><td><img alt=""src="https://bizweb.dktcdn.net/100/514/587/theme_temp/947235/assets/logo-vip-b92c9bda-249b-4706-8f3c-4685ff351bcf.png?1712777380370" height="50"/> </td>  <td style="text-align: right;"><span style="font-size: 13px; line-height: 30px; color: black;font-weight:bold; margin-left:60px">${datetime}</span></td></tr></tbody>	</table></header><main><div style="margin: 0; margin-top: 70px;padding: 92px 30px 115px;background: #ffffff; border-radius: 30px; text-align: center;" ><div style="width: 100%; max-width: 489px; margin: 0 auto;"><h1 style="margin: 0;font-size: 24px; font-weight: 500;color: #1f1f1f;">Mã đặt lại mật khẩu</h1><p style="margin: 0;margin-top: 17px;font-size: 16px; font-weight: 500; ">Xin chào<span style="color:black;font-weight:bold"> ${name}</span>,</p><p style="margin: 0;margin-top: 17px;font-weight: 500;letter-spacing: 0.56px;">Cảm ơn bạn đã lựa chọn Super Sneaker. Sử dụng mã OTP sau để hoàn tất quy trình thay đổi mật khẩu. Mã OTP có hiệu lực trong <span style="font-weight: 600; color: #1f1f1f;">5 phút</span>.Vui lòng không chia sẻ mã này với người khác, kể cả các thành viên của <span style="font-weight: 600; color: #1f1f1f;">Super Sneaker</span> .</p> <p style="margin: 0; margin-top: 60px;font-size: 40px;font-weight: 600;letter-spacing: 25px;color: #ba3d4f; ">${otp_code}</p></div></div> <p style="max-width: 400px;margin: 0 auto; margin-top: 90px;text-align: center;font-weight:500;color: #8c8c8c;">Bạn cần giúp đỡ? Liên hệ ngay <a href="mailto:nguyenanh02k1@gmail.com.com"style="color: #499fb6; text-decoration: none;">supersneaker@gmail.com</a> hoặc truy cập <a href="" target="_blank" style="color: #499fb6; text-decoration: none;">Trung tâm trợ giúp </a><a>của chúng tôi !</a></a></p></main><footer style="width: 100%;max-width: 490px;margin: 20px auto 0; text-align: center;border-top: 1px solid #e6ebf1;"><p style="margin: 0;margin-top: 40px;font-size: 16px;font-weight: 600;color: #434343;">Super Sneaker</p><p style="margin: 0; margin-top: 8px; color: #434343;">Địa chỉ: 147 Phương Canh, Q.Nam Từ Liêm, TP.Hà Nội.</p><div style="margin: 0; margin-top: 16px;"><a href="https://www.facebook.com/supersneaker.pro" target="_blank" style="display: inline-block;"><img width="36px"alt="Facebook"src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661502815169_682499/email-template-icon-facebook"/></a><a href=""target="_blank"style="display: inline-block; margin-left: 8px;"><img width="36px"alt="Instagram"src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661504218208_684135/email-template-icon-instagram"/></a><a href=""target="_blank"style="display: inline-block; margin-left: 8px;"><img width="36px"alt="Twitter"src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661503043040_372004/email-template-icon-twitter"/></a><a href=""target="_blank"style="display: inline-block; margin-left: 8px;"><img width="36px"alt="Youtube"src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661503195931_210869/email-template-icon-youtube"/></a></div><p style="margin: 0; margin-top: 16px; color: #434343;">Bản quyền © 2024 SuperSneaker.</p></footer></div></body></html>`;
          Email.send({
          SecureToken: "f000c825-0123-4a33-9f0a-bdca81922999",
          To: email.value,
          From: "nguyenanh21k0@gmail.com",
          Subject : "Đặt lại mật khẩu tài khoản SuperSneaker",
          Body: emailbody,
        }).then(
          message => {
            if (message === "OK") {
              Swal.fire({
                title: "Super Sneaker",
                text: "Mã xác nhận đã được gửi tới " + email.value + ", vui lòng kiểm tra email..!",
                icon: "success",
                showDenyButton: true,
                confirmButtonText: "OK",
              }).then((result) => {
                if (result.isConfirmed) {
                  maxacnhan.style.display = "block";
                  guima.style.display="none";
                }
    
    
    
    
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
                    Swal.fire({
                      title: "Super Sneaker",
                      text: "Mật khẩu của bạn là: 567890",
                      icon: "success",
                      showDenyButton: true,
                      confirmButtonText: "OK",
                  }).then((result) => {
                      if (result.isConfirmed) {
                        location="/Chung/dangnhap.html";
                      }
                  });
                  
                  
                  }
                  else if(otp_inp.value == otp_code){
                    Swal.fire({
                      title: "Super Sneaker",
                      text: "Mật khẩu của bạn là: 123456",
                      icon: "success",
                      showDenyButton: true,
                      confirmButtonText: "OK",
                  }).then((result) => {
                      if (result.isConfirmed) {
                        location="/Chung/dangnhap.html";
                      }
                  });
                  }
                
               
                  else {
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
                
              });
              
              
              
            }
          }
        );
  
      }
    });
  
    }
    
  
  }