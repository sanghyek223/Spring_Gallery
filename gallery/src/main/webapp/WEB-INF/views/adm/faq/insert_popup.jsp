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

		var data = $("#faq_form").serialize();
		
		var isSubmit = false;

		$.ajax({
			url : '/adm/faq_insert',
			type : 'post',
			data : data,
			dataType : 'text',
			async : false, // 비동기식으로 처리를 함 
			success : function(res) {
				if (res == "suc") {
					opener.location.href = '/adm/faq';
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

td {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<form name="faq_form" id="faq_form" method="post">

			<div class="col-sm-12 pt-3">
				<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title">FAQ</h4>
						<p class="card-catagory"></p>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr style="line-height: 32px;">
										<td>질문:</td>
										<td colspan="3"><input type="text" name="faq_title"
											id="faq_title" class="form-control" value=""></td>
									</tr>
									<tr style="line-height: 32px;">
										<td>답변:</td>
										<td colspan="3"><textarea name="faq_contents"
												id="faq_contents" class="form-control"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="pt-3"></div>

			</div>

			<div class="text-center mt-3">
				<button type="button" class="btn btn-success" id="btn_faq"
					onclick="ajaxcheck();">추가하기</button>
				<button type="reset" class="btn btn-info">다시쓰기</button>
			</div>
		</form>
	</div>


</body>
</html>