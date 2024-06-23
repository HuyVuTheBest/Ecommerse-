// document.querySelector("#signup").addEventListener("click", function () {

//     let userName = document.querySelector("#username").value;
//     let userEmail = document.querySelector("#useremail").value;
//     let userPass = document.querySelector("#userpass").value;


//     if (userName && userEmail && userPass) {

//         let userDetails = { name: userName, email: userEmail, password: userPass };

//         localStorage.setItem("userDetails", JSON.stringify(userDetails));
//         window.location.href = "login.html";

//     } else {
//         alert("please enter all the details");
//     }

// })
function dangkytaikhoan(){
    let matkhau  = document.querySelector("#dlab-password").value;
    let nhaplaimatkhau = document.querySelector("#dlabpassword").value;
    let email = document.querySelector("#email").value;
    var checkmail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if(!checkmail.test(email)){
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
    else if(nhaplaimatkhau != matkhau){
    Swal.fire({
      title: "Super Sneaker",
      text: "Mật khẩu không trùng khớp..!",
      icon: "error",
      showDenyButton: true,
      confirmButtonText: "OK",
    }).then((result) => {
      if (result.isConfirmed) {
        matkhau.focus();
      }
    });
  }
  else{
    document.querySelector("#dangky").addEventListener("click", function () {

    let hoten = document.querySelector("#hovaten").value;
    let email = document.querySelector("#email").value;
    let tendangnhap = document.querySelector("#tendn").value;
    let matkhau  = document.querySelector("#dlab-password").value;
    let nhaplaimatkhau = document.querySelector("#dlabpassword").value;
   
     if (hoten && email && tendangnhap && matkhau && nhaplaimatkhau) {

        let thongtintaikhoan = { Fullname: hoten, Email: email, Username: tendangnhap, Password: matkhau ,RetypePassword: nhaplaimatkhau , };

        localStorage.setItem("Tài khoản đã đăng ký", JSON.stringify(thongtintaikhoan));
        Swal.fire({
            title: "Super Sneaker",
            text: "Đăng ký thành công..!",
            icon: "success",
            showDenyButton: true,
            confirmButtonText: "OK",
          }).then((result) => {
            if (result.isConfirmed) {
              location = "/Chung/dangnhap.html";
            }
          });
    } else {
        Swal.fire({
            title: "Super Sneaker",
            text: "Vui lòng kiểm tra lại thông tin..!",
            icon: "error",
            showDenyButton: true,
            confirmButtonText: "OK",
          }).then((result) => {
            if (result.isConfirmed) {
              hoten.focus();
            }
          });
    }

})


 
  }
}
   