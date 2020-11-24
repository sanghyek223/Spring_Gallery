<%@page import="org.springframework.web.bind.annotation.ResponseBody"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("id") != null) {
	response.sendRedirect("/adm/main.adm");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Admin Login</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

	<div class="Login_font">Admin Login</div>

	<div class="img_box">
		<a
			href="javascript:functionConfirm('Admin Login?', function yes() {
    	  LoginWithKakao();
      }, function no() {
		AdminLogin();
      }
      );">
			<div class="lion">
				<div class="ear-right"></div>
				<div class="ear-left"></div>
				<div class="face">
					<div class="eyebrow-right"></div>
					<div class="eyebrow-left"></div>
					<div class="eyes-right"></div>
					<div class="eyes-left"></div>
					<div class="nose"></div>
					<div class="mouth"></div>
					<div class="mouth2"></div>
					<div class="whitebox"></div>
				</div>
		</a>
	</div>

	<script>
		function functionConfirm(msg, myYes, myNo, cancel) {
			var confirmBox = $("#confirm");
			confirmBox.find(".message").text(msg);
			confirmBox.find(".yes,.no,.cancel").unbind().click(function() {
				confirmBox.hide();
			});
			confirmBox.find(".yes").click(myYes);
			confirmBox.find(".no").click(myNo);
			confirmBox.find(".no").click(cancel);
			confirmBox.show();
		}

		function AdminLogin() {
			var popupWidth = 700;
			var popupHeight = 400;

			var popupX = (window.screen.width / 2) - (popupWidth / 2);
			// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

			var popupY= (window.screen.height / 2) - (popupHeight / 2);
			// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
			window.open('/adm/user_login', 'AdminLogin', 'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);

		}
	</script>
	<style>
#confirm {
	z-index: 99999999999999999999;
	display: none;
	background-color: white;
	border: 1px solid black;
	position: fixed;
	width: 500px;
	left: 42%;
	margin-left: -100px;
	margin-top: 6rem;
	padding: 6px 8px 8px;
	box-sizing: border-box;
	text-align: center;
	height: 200px;
}

#confirm button {
	background-color: darkgrey;
	display: flex;
	border-radius: 5px;
	border: 1px solid #aaa;
	padding: 5px;
	justify-content: space-around;
	width: 150px;
	text-align: center;
	cursor: pointer;
	margin-bottom: 0.5rem;
	margin-left: 10rem;
}

#confirm .message {
	text-align: center;
	margin-top: 1rem;
	margin-bottom: 2rem;
}
</style>
	<div id="confirm">
		<div class="message"></div>
		<button class="yes">카카오로 시작하기</button>
		<button class="no">AdminUser</button>
		<button class="cancel">Cancel</button>

	</div>
	<style>
button_box

 

.{
display


:

 

flex


;
}
.Login_font {
	min-height: 50px;
	font-size: 32px;
	text-align: center;
	margin-top: 7rem;
	color: darkgoldenrod;
}

html, body {
	width: 100%;
}

.lion {
	position: absolute;
	top: calc(50% - 250px);
	left: calc(50% - 250px);
}

.face {
	position: absolute;
	z-index: 10;
	width: 500px;
	height: 500px;
	border: 10px solid black;
	border-radius: 500px;
	background-color: rgb(211, 149, 64);
}

.ear-left {
	position: absolute;
	top: -5px;
	left: 50px;
	z-index: 1;
	width: 100px;
	height: 100px;
	border: 10px solid black;
	border-radius: 100px;
	background-color: rgb(211, 149, 64);
}

.ear-right {
	position: absolute;
	top: -5px;
	left: 345px;
	z-index: 1;
	width: 100px;
	height: 100px;
	border: 10px solid black;
	border-radius: 100px;
	background-color: rgb(211, 149, 64);
}

.eyebrow-left {
	position: absolute;
	top: 150px;
	left: 100px;
	width: 80px;
	border-radius: 10px;
	border: 9px solid black;
}

.eyebrow-right {
	position: absolute;
	top: 150px;
	right: 100px;
	width: 80px;
	border-radius: 10px;
	border: 9px solid black;
}

.eyes-right {
	position: absolute;
	top: 200px;
	right: 140px;
	border-radius: 15px;
	border: 15px solid black;
}

.eyes-left {
	position: absolute;
	top: 200px;
	left: 140px;
	border-radius: 15px;
	border: 15px solid black;
}

.mouth {
	position: absolute;
	top: 270px;
	left: 160px;
	z-index: 1;
	width: 90px;
	height: 70px;
	border: 10px solid black;
	border-radius: 100% 90% 100% 100%;
	background-color: white;
}

.mouth2 {
	position: absolute;
	top: 270px;
	right: 160px;
	z-index: 1;
	width: 90px;
	height: 70px;
	border: 10px solid black;
	border-radius: 90% 100% 100% 100%;
	background-color: white;
}

.nose {
	position: absolute;
	z-index: 100;
	top: 262px;
	left: 232.5px;
	height: 40px;
	width: 35px;
	border-radius: 50% 50% 50% 50%/40% 40% 60% 60%;
	background-color: black;
}

.whitebox {
	position: absolute;
	z-index: 90;
	top: 286px;
	left: 220px;
	width: 50px;
	height: 57px;
	background-color: white;
}

a {
	color: #39c;
	text-decoration: none;
}

.github {
	text-align: center;
	position: absolute;
	top: 515px;
	left: calc(50% - 100px);
}
</style>

	<script type='text/javascript'>
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init("48b12a75f26c73faa8806b6931ff1c25");
		function LoginWithKakao() {
			// 로그인 창을 띄웁니다.
			Kakao.Auth.loginForm({
				success : function(authObj) {
					// alert(JSON.stringify(authObj));            
					// 로그인 성공시, API를 호출합니다.
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(res) {
							id_check(res.id);

						},
						fail : function(error) {
							alert(JSON.stringify(error));
						}
					});
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
		};

		function id_check(check) {

			$.ajax({
				url : "/loginCheck", //컨트롤러 URL
				data : {
					"admin_id" : check
				},
				dataType : 'text',
				type : 'POST',
				success : function(res) {
					if (res == "suc") {
						console.log("성공 로그인 진행 세션값 등록");
						location.href = "/adm/main";
					}
					if (res == "fail") {
						alert("관리자가 아닙니다!");
					}
				},
				error : function(request, status, error) { // 오류가 발생했을 때 호출된다. 
					console.log("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error); // ajax 처리가 결과가 에러이면 전송 여부는 false 
					// 앞서 초기값을 false로 해 놓았지만 한번 더 선언을 한다. 
				}
			});
		}
	</script>
</body>
</html>