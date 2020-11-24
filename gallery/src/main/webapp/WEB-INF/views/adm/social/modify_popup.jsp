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

		var data = $("#social_modify").serialize();
		var name = $("#social_name").val();
		var link = $("#social_link").val();

		var isSubmit = false;

		 console.log(data);
		 console.log(name);
		 console.log(link);

		if (link == null || link == "") {

			alert("소셜 링크를 등록하세요");
			return false;

		}

		$.ajax({
			url : '/adm/social_modify',
			type : 'post',
			data : data,
			dataType : 'text',
			async : false, // 비동기식으로 처리를 함 
			success : function(res) {
				if (res == "suc") {
					opener.location.href = '/adm/social';
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

/* 	//파라미터 값 가져오기 함수
	function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
    
	$(document).ready(function() {

		var social =getParameterByName("social");

	}); */
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
		<form name="social_modify" id="social_modify" method="post">

			<div class="col-sm-12 pt-3">
				<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title">Social Link Modify</h4>
						<p class="card-catagory"></p>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr style="line-height: 32px;">
										<td>Social Name:</td>
										<td colspan="3"><input type="text" name="social_name" readonly
											id="social_name" class="form-control" value="${socialView.social_name }"></td>
									</tr>
									<tr style="line-height: 32px;">
										<td>Social Link:</td>
										<td colspan="3"><input type="text" name="social_link"
											id="social_link" class="form-control" value="${socialView.social_link }"></td>
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