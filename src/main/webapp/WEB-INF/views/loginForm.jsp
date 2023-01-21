<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Login</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</head>

<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">환영합니다</h1>
                                </div>

                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user"
                                           placeholder="아이디"
                                           id="id">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user"
                                           placeholder="비밀번호" id="pwd">
                                </div>
                                <button class="btn btn-facebook btn-user btn-block" id="login">로그인</button>
                                <a href="/joinForm" class="btn btn-facebook btn-user btn-block">
                                    회원가입
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>


</body>

</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        $("#login").click(function() {
            var id = $("#id");
            var pwd = $("#pwd");

            if(id.val() === "") {
                alert("아이디를 입력해주세요");
                id.focus();
                return false;
            }

            if(pwd.val() === "") {
                alert("비밀번호를 입력해주세요");
                pwd.focus();
                return false;
            }

            $.ajax({
                type: "POST",
                url: "/login",
                data: {id: id.val(), pwd: pwd.val()},
                dataType: "text",
                success: function(result) {
                    if(id.val() !== result) {
                        alert("아이디와 비밀번호를 정확히 입력해주세요");
                        return false;
                    } else {
                        window.location.href="/";
                    }
                },
                error: function(err) {
                    console.log(err);
                },
            })

        })

    })
</script>
