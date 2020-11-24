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

		var form = new FormData(document.getElementById('banner_modify'));
		var fileCheck = $("#file").val();
		
		if (!fileCheck) {
			alert("파일을 첨부해 주세요");
			return false;
		}

		// 정규식을 사용히여 jpg, jpeg, png, gif, bmp등 이미지파일의 확장자를 가진것을 추려낸다.

		var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;

	  	if(!fileCheck.match(reg)) {

			alert("해당 파일은 이미지 파일이 아닙니다.");
			return false;

		}
		
		var isSubmit = false;

		$.ajax({
			url : "/adm/banner_modify", //컨트롤러 URL
			data : form,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(res) {
				if (res == "suc") {
					opener.location.href = '/adm/slide';
					window.close();
					isSubmit = true;
				}
				isSubmit = false
			},
			error : function(request, status, error) { // 오류가 발생했을 때 호출된다. 
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error); // ajax 처리가 결과가 에러이면 전송 여부는 false 
				// 앞서 초기값을 false로 해 놓았지만 한번 더 선언을 한다. 
				isSubmit = false;
			}
		});

		if (!isSubmit)
			return false;

	}

	//파라미터 값 가져오기 함수
	function getParameterByName(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
				.exec(location.search);
		return results == null ? "" : decodeURIComponent(results[1].replace(
				/\+/g, " "));
	}

	$(document).ready(function() {

		var b_name = getParameterByName("b_name");
		$("#banner_name").val(b_name);

	});
</script>

<style>
textarea {
	resize: none;
	min-height: 300px;
}

td {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<form name="banner_modify" id="banner_modify" method="post">

			<div class="col-sm-12 pt-3">
				<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title">Banner IMG Modify</h4>
						<p class="card-catagory"></p>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr style="line-height: 32px;">
										<td>Banner:</td>
										<td colspan="3"><input type="text" name="banner_name"
											readonly id="banner_name" class="form-control"></td>
									</tr>
									<tr style="line-height: 32px;">
										<td>Change IMG:</td>
										<td><input type="file" name="file" id="file"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="pt-3"></div>

			</div>

			<div class="text-center mt-3">
				<button type="button" class="btn btn-success" onclick="ajaxcheck();">수정하기</button>
				<button type="button" class="btn btn-info" onclick="window.close();">취소</button>
			</div>
		</form>
	</div>


</body>
</html>