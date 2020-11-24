<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Header-->
<header id="header" class="header">
	<div class="top-left">
		<div class="navbar-header">
			<a class="navbar-brand" href="/adm/main"
				style="width: 120px; margin-left: 2rem;"><strong> P T G
					K </strong></a> <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
		</div>
	</div>
	<div class="top-right">
		<div class="header-menu">
			<div class="header-left">

				<div class="user-area dropdown float-right">
					<a class="nav-link" href="javascript:logout();"
						style="padding: 0;"><i class="fa fa-power-off"></i>Logout</a>
				</div>
			</div>
		</div>
</header>
<!-- /header -->

<script>
function logout(){
	$.ajax({
		url : "/logout", //컨트롤러 URL
		dataType : 'text',
		type : 'POST',
		success : function(res) {
				console.log(res);
				location.href='/adm';
		},
		error : function(request, status, error) { // 오류가 발생했을 때 호출된다. 
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error); // ajax 처리가 결과가 에러이면 전송 여부는 false 
			// 앞서 초기값을 false로 해 놓았지만 한번 더 선언을 한다. 
		}
	});
}

</script>