<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
img {
	max-width: 300px;
	max-height: 300px;
}
</style>
<script>
	function ajaxcheck() {

		var data = $("#adminlogin").serialize();
		var id = $("#admin_id").val();
		var pw = $("#admin_pw").val();

		if(id == null || id == ""){
			alert("ID 를 입력하세요");
			$("#admin_id").focus();
			return false;
		}

		if(pw == null || pw == ""){
			alert("PW 를 입력하세요");
			$("#admin_pw").focus();
			return false;
		}
		
		var isSubmit = false;

		$.ajax({
			url : '/adm/Usr_LoginCheck',
			type : 'post',
			data : data,
			dataType : 'text',
			async : false, // 비동기식으로 처리를 함 
			success : function(res) {
				if (res == "suc") {
					//console.log(res);
					opener.location.reload();//부모창 url 고침
					window.close();
				}else if(res == "fail"){
					alert("가입된 ID 가 아닙니다");
				}else{
					alert("PW 가 다릅니다")
				}
				isSubmit = false
			},
			error : function(request, status, error) { // 오류가 발생했을 때 호출된다. 
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error); // ajax 처리가 결과가 에러이면 전송 여부는 false 
				// 앞서 초기값을 false로 해 놓았지만 한번 더 선언을 한다. 
				isSubmit = false;
			},
			beforeSend : function() { // 로딩바를 보여준다. 

			},
			complete : function() { // 로딩바를 해제한다. 

			}
		});

		if (!isSubmit)
			return false;

	}

</script>

<style>
textarea {
	resize: none;
	min-height: 300px;
}
td{
text-align:center;
}
</style>
</head>
<body>
	<div class="container">
		<form name="adminlogin" id="adminlogin" method="post">

			<div class="col-sm-12 pt-3">
				<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title">Admin Login</h4>
						<p class="card-catagory"></p>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr style="line-height: 32px;">
										<td>User ID:</td>
										<td colspan="3"><input type="text" name="admin_id" 
											id="admin_id" class="form-control" value=""></td>
									</tr>
									<tr style="line-height: 32px;">
										<td>User PW:</td>
										<td colspan="3"><input type="password" name="admin_pw"
											id="admin_pw" class="form-control" value=""></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="pt-3"></div>

			</div>

			<div class="text-center mt-3">
				<button type="button" class="btn btn-success" onclick="ajaxcheck();">로그인</button>
				<button type="button" onclick="window.close();" class="btn btn-info">취소</button>
			</div>
		</form>
	</div>


</body>
</html>