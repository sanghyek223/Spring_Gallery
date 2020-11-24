<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Modify</title>
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
		
		var form = new FormData(document.getElementById('profile_modify'));
		var name = $("#profile_name").val();
		var content = $("#profile_content").val();
		
		var isSubmit = false;

		if (name == null || name == "") {

			alert("이름을 입력하세요");
			return false;

		}

		if (content == null || content == "") {

			alert("소개글을 작성해주세요");
			return false;

		}

	    $.ajax({
		      url: "/adm/profile_modify", //컨트롤러 URL
		      data: form,
		      dataType: 'text',
		      processData: false,
		      contentType: false,
		      type: 'POST',
		      success: function (res) {
					if (res == "suc") {
						opener.location.href = '/adm/profile';
						window.close();
						isSubmit = true;
					}
					isSubmit = false
		      },error : function(request, status, error) { // 오류가 발생했을 때 호출된다. 
					console.log("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error); // ajax 처리가 결과가 에러이면 전송 여부는 false 
					// 앞서 초기값을 false로 해 놓았지만 한번 더 선언을 한다. 
					isSubmit = false;
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
</style>
</head>
<body>
	<div class="container">
		<form name="profile_modify" id="profile_modify" method="post"
			 enctype="multipart/form-data">

			<div class="col-sm-12 pt-3">
				<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title">Profile Modify</h4>
						<p class="card-catagory"></p>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr style="line-height: 32px;">
										<td>Name:</td>
										<td><input type="text" name="profile_name"
											id="profile_name" class="form-control" value="${profile.profile_name}"></td>
	
									<tr>
										<td>소개</td>
										<td colspan="3"><textarea name="profile_content"
												id="profile_content" class="form-control">${profile.profile_content}</textarea></td>
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
				<button type="reset" class="btn btn-info">다시쓰기</button>
			</div>
		</form>
	</div>

</body>
</html>