


function dangnhap() {
	
document.querySelector("#dangnhap").addEventListener("click", function () {

    let tendangnhap = document.querySelector('#validationCustomUsername').value;
    let matkhau = document.querySelector('#dlab-password').value;

    if (tendangnhap && matkhau) {

        let localStorageData = localStorage.getItem("Tài khoản đã đăng ký");

        if (localStorageData) {

            localStorageData = JSON.parse(localStorageData);

            if (tendangnhap === localStorageData.Username && matkhau === localStorageData.Password) {

                Swal.fire({
                    title: "Super Sneaker",
                    text: "Đăng nhập thành công..!",
                    icon: "success",
                    showDenyButton: true,
                    confirmButtonText: "OK",
                  }).then((result) => {
                    if (result.isConfirmed) {
                      location = "/User/index.html";
                    }
                  });
            } 
            else if (tendangnhap =="admin" && matkhau == "567890") {

              Swal.fire({
                  title: "Super Sneaker",
                  text: "Trang admin đang được xây dựng..!",
                  icon: "info",
                  showDenyButton: true,
                  confirmButtonText: "OK",
                }).then((result) => {
                  if (result.isConfirmed) {
                    location = "/Chung/dangnhap.html";
                  }
                });
          } else if (tendangnhap =="user" && matkhau == "123456") {

            Swal.fire({
              title: "Super Sneaker",
              text: "Đăng nhập thành công..!",
              icon: "success",
              showDenyButton: true,
              confirmButtonText: "OK",
            }).then((result) => {
              if (result.isConfirmed) {
                location = "/User/index.html";
              }
            });
        } 
            else {
                Swal.fire({
                    title: "Super Sneaker",
                    text: "Tên đăng nhập hoặc mật khẩu không chính xác..!",
                    icon: "error",
                    showDenyButton: true,
                    confirmButtonText: "OK",
                  }).then((result) => {
                    if (result.isConfirmed) {
                      tendangnhap.text="";
                      matkhau.text="";
                    }
                  });
            }

        }
      


    }



    

    
})
}