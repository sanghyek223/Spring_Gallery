<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>Dashboard</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><strong>Admin</strong></li>
							<li>User Info</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




<div class="clearfix"></div>


<!-- Sign Up -->
<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="card-body-flex">
					<h4 class="box-title">Sign Up</h4>
				</div>
				<div class="social-block">
					<div class="social-block-setting">
						<a href="javascript:SignUpWithKakao();"><img
							src="/resources/admin/images/kakao_login_large_wide.png"></a>
					</div>

				</div>
			</div>
		</div>
		<!--# Sign Up -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script type='text/javascript'>
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init("48b12a75f26c73faa8806b6931ff1c25");
    function SignUpWithKakao() {
        // 로그인 창을 띄웁니다.
        Kakao.Auth.loginForm({ 
          success: function(authObj) {
           // alert(JSON.stringify(authObj));            
         	// 로그인 성공시, API를 호출합니다.
            Kakao.API.request({
              url: '/v2/user/me',
              success: function(res) {
                //console.log(JSON.stringify(res));
            	  id_check(res.id); //회원인지 먼저 체크
              },
              fail: function(error) {
                alert(JSON.stringify(error));
              }
            });
          },
          fail: function(err) {
            alert(JSON.stringify(err));
          }
        });
    };


	function id_check(check) {

		$.ajax({
			url : "/IDCheck", //컨트롤러 URL
			data : { "admin_id": check },
			dataType : 'text',
			type : 'POST',
			success : function(res) {
				if(res == "suc"){ //ID가 있으면
					alert("가입된 회원입니다");
				}
				if(res == "fail"){ //ID가 없으면 가입진행
					signup(check);
				}
			},
			error : function(request, status, error) { // 오류가 발생했을 때 호출된다. 
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error); // ajax 처리가 결과가 에러이면 전송 여부는 false 
				// 앞서 초기값을 false로 해 놓았지만 한번 더 선언을 한다. 
			}
		});
	  }

	  function signup(check) {

		  
			$.ajax({
				url : "/SignUp", //컨트롤러 URL
				data : { "admin_id": check },
				dataType : 'text',
				type : 'POST',
				success : function(res) {
					if(res == "suc"){
						alert("가입 성공!!");
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
		<style>
table {
	text-align: center;
}

.td_ibox {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}

.td_ibox span {
	margin-top: 0;
}

.table table-bordered {
	width: 90%;
}

.form-group {
	width: 50%;
}

span {
	margin-top: 2rem;
}

.breadcrumbs {
	margin-bottom: 3rem;
}

.card-body-flex {
	margin-bottom: 3rem;
}

.row {
	width: 95%;
	margin: auto;
}

.social-block {
	width: 90%;
	height: auto;
	margin: auto;
	margin-top: 30px;
	min-height: 150px;
	margin-top: 30px;
}

.social-block-setting {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}

.social-block-setting {
	margin-bottom: 3rem;
}

.card-body-flex {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}
</style>