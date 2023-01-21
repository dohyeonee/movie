<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원가입</title>

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
                        <div class="col-lg-12">
                            <div class="p-5">
                                <form class="user">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-9">
                                                <input type="text" class="form-control form-control-user"
                                                       id="id" name="id" placeholder="아이디">
                                            </div>
                                            <div class="col-md-3">
                                                <button type="button" class="btn btn-danger form-control" id="id_chk" style="height: 50px; font-size: 14px;">아이디 중복확인</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user"
                                               id="pwd" name="pwd" placeholder="비밀번호">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user"
                                               id="pwd_chk" name="pwd" placeholder="비밀번호 재확인">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user"
                                               id="name" name="name" placeholder="이름">
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-9">
                                                <input type="text" class="form-control form-control-user"
                                                       id="phone" name="phone" placeholder="폰번호">
                                            </div>
                                            <div class="col-3">
                                                <label class="col-form-label" style="position: absolute; top: 10%;">ex) "-"없이 숫자만 입력</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-4">
                                                <input type="text" class="form-control form-control-user"
                                                       id="email" name="address" placeholder="이메일">
                                            </div>
                                            <div class="col-1">
                                                <label id="at" class="col-form-label" style="position: absolute; top: 10%;">&nbsp;&nbsp;&nbsp;@</label>
                                            </div>
                                            <div class="col-4">
                                                <input type="text" class="form-control form-control-user"
                                                       id="email2">
                                            </div>
                                            <div class="col-3">
                                                <select id="mailRest" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" style="position: absolute; top: 20%;">
                                                    <option selected>직접입력</option>
                                                    <option value="naver.com">naver.com</option>
                                                    <option value="gmail.com">gmail.com</option>
                                                    <option value="nate.com">nate.com</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user"
                                               id="age" name="age" placeholder="나이">
                                    </div>
                                    <input type="submit" class="btn btn-facebook btn-user btn-block" id="join" value="회원가입 신청"/>
                                    <a href="/" class="btn btn-facebook btn-user btn-block">홈으로</a>
                                </form>
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
        var isCheck = false;
        $("#id_chk").click(function() {

            isCheck = true;
            var id_chk = $("#id");

            $.ajax({
                type: "POST",
                url: "/idChk",
                data: {id: id_chk.val()},
                dataType: "text",
                success: function(result) {
                    if(result === "fail") {
                        alert("사용가능한 아이디 입니다.");
                    } else {
                        alert("이미 사용중인 ID입니다.");
                    }
                },
                error: function(err) {
                    alert("에러발생");
                },
            })
        });

        $("#mailRest").change(function (){
            $("#email2").val($(this).val());
        })



        $("#join").click(function(e) {
            e.preventDefault();
            var id = $("#id");
            var pwd = $("#pwd");
            var pwdChk = $("#pwd_chk");
            var name = $("#name");
            var phone = $("#phone");
            var email = $("#email");
            var age = $("#age");
            var pwdReg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
            var phoneReg = /^[0-9]+/g;
            var email2 = $("#email2");
            var trimAt = $.trim($("#at").text());

            if(id.val() === "") {
                alert("아이디를 입력해주세요");
                id.focus();
                return false;
            }

            if(!pwdReg.test(pwd.val())) {
                alert("비밀번호는 영문자+숫자 조합으로 8자리 이상 입력해주세요");
                pwd.focus();
                return false;
            }

            if(pwdChk.val() !== pwd.val()) {
                alert("비밀번호가 일치하지 않습니다");
                pwdChk.focus();
                return false;
            }

            if(name.val() === "") {
                alert("이름을 입력해주세요");
                name.focus();
                return false;
            }

            if(!phoneReg.test(phone.val())) {
                alert("핸드폰 번호는 숫자만 입력해 주세요");
                phone.focus();
                return false;
            }

            if(email.val() === "") {
                alert("이메일을 입력해주세요");
                email.focus();
                return false;
            }

            if(email2.val() === "") {
                alert("이메일 두 번째 부분을 입력해주세요");
                email2.focus();
                return false;
            }

            if(age.val() === "") {
                alert("나이를 입력해주세요");
                age.focus();
                return false;
            }

            if(isCheck == false) {
                alert("아이디 중복확인을 눌러주세요");
                return false;
            }


            $.ajax({
                type: "POST",
                url: "/join",
                data: {id: id.val(), pwd: pwd.val(), name: name.val(), phone: phone.val(), email: email.val() + trimAt + email2.val() , age: age.val()},
                dataType: "text",
                success: function(result) {
                    if(result == 'success') {
                        alert("회원가입 성공");
                        window.location.href="/loginForm";
                    } else {
                        alert("회원가입 실패");
                        return false;
                    }
                },
                error: function(err) {
                    console.log(err);
                },
            })
        });
    });
</script>