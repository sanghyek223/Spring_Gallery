<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
							<li><strong>Slide & Banner</strong></li>
							<li>Img Setting</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="clearfix"></div>
<script>

	function BannerModify(b_name) {
		var popupWidth = 700;
		var popupHeight = 400;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음

        window.open("/adm/banner_modify_popup?b_name=" + b_name, 'BannerModify', 'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);

	}

	function SlideModify(no) {
		var popupWidth = 550;
		var popupHeight = 400;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		window.open("/adm/slide_modify_popup?no=" + no, 'SlideModify', 'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);


	}

	function SlideInsert() {
		var popupWidth = 550;
		var popupHeight = 400;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		window.open("/adm/slide_insert_popup", 'SlideInsert', 'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);


	}

	function SlideDel(no) {

		var result = confirm("Slide IMG 를 삭제 하시겠씁니까?");

		if (result) {
			console.log(no);
			$.ajax({
				url : '/adm/slide_delete?no=' + no,
				type : 'get',
				dataType : 'text',
				async : false, // 비동기식으로 처리를 함 
				success : function(res) {
					if (res == "suc") {
						location.href = '/adm/slide';
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

		}

	}
</script>

<!-- main slide -->
<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="card-body-flex">
					<h4 class="box-title">Main slide</h4>
					<a href="javascript:SlideInsert();"><i class="fas fa-plus fa-2x"></i></a>
				</div>
				<div class="social-block">
									<c:forEach var="slidelist" items="${slidelist}" varStatus="status">
					<div class="social-block-setting">
						<img src="<c:out value='${slidelist.slide_path}' /><c:out value='${slidelist.slide_img}' />" class="img_preview">
						<div class="form-group">
							<label for="slide1">Slide <c:out value="${status.count}" /> :</label> <input type="text"
								class="form-control" value="<c:out value='${slidelist.slide_img}' />" readonly>
						</div>
						<span><a href="javascript:SlideModify(<c:out value='${slidelist.no}' />);"><i class="far fa-edit"></i></a></span> <span><a
							href="javascript:SlideDel(<c:out value='${slidelist.no}' />)"><i class="far fa-trash-alt"></i></a></span>
					</div>
									</c:forEach>

				</div>
			</div>
		</div>
	</div>
</div>
<!--# main slide -->

<div class="clearfix"></div>


<!-- Banner -->
<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="card-body-flex">
					<h4 class="box-title">Banner</h4>
				</div>
				<div class="social-block">
				<c:forEach var="bannerlist" items="${bannerlist}" varStatus="status">
					<div class="social-block-setting">
						<img src="<c:out value='${bannerlist.banner_path}' /><c:out value='${bannerlist.banner_img}' />" class="img_preview">
						<div class="form-group">
							<label for="profile"><c:out value='${bannerlist.banner_name}' />:</label> <input type="text"
								class="form-control" id="profile" value="<c:out value='${bannerlist.banner_img}' />" readonly>
						</div>
						<span><a href="javascript:BannerModify('<c:out value='${bannerlist.banner_name}' />');"><i class="far fa-edit"></i></a></span> 
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<!--# main slide -->

<style>
.img_preview {
	width: 300px;
	height: 90px;
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
	min-height: 350px;
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