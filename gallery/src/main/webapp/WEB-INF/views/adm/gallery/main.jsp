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
							<li><strong>Gallery</strong></li>
							<li>Images Upload</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="clearfix"></div>


<!-- Content -->
<div class="content">
	<!-- Animated -->
	<div class="animated fadeIn">
		<!-- Widgets  -->
		<div class="row">
			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-1">
								<i class="far fa-images"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text">
										<span class="count"><%=request.getAttribute("All")%></span>
									</div>
									<div class="stat-heading">Total Img</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-2">
								<i class="pe-7s-users"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text">
										<span class="count"><%=request.getAttribute("P")%></span>
									</div>
									<div class="stat-heading">인물</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-3">
								<i class="fas fa-globe"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text">
										<span class="count"><%=request.getAttribute("S")%></span>
									</div>
									<div class="stat-heading">사물</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-4">
								<i class="fas fa-tree"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text">
										<span class="count"><%=request.getAttribute("T")%></span>
									</div>
									<div class="stat-heading">풍경</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /Widgets -->
		<!--  Traffic  -->
		<form id="Gallery_form" name="Gallery_form"
			onsubmit="return submitAction()" METHOD="post"
			enctype="multipart/form-data">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="card-body-flex">
								<h4 class="box-title">Img Upload</h4>
								<select name="gallery_title" id="gallery_title"
									class="custom-select" style="width: 15%;">
									<option>Img Title</option>
									<option value="인물">인물</option>
									<option value="풍경">풍경</option>
									<option value="사물">사물</option>
								</select> <a href="javascript:" onclick="fileUploadAction();"
									class="my_button">select IMG</a> <input type="file"
									id="input_imgs" name="file" multiple />
							</div>
						</div>
					</div>
					<!-- /# column -->
				</div>
			</div>
			<!--  Traffic  -->
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="card-body-flex">
								<h4 class="box-title">Upload Img prview</h4>
								<input type="submit" value="Upload">
							</div>
							<div class="imgs_wrap">
								<img id="img" />
							</div>
						</div>
					</div>
					<!-- /# column -->
				</div>
			</div>
		</form>

		<div class="clearfix"></div>

		<!-- 갤러리 리스트 -->
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="card-body-flex" id="loadStart">
							<h4 class="box-title">Gallery List</h4>
							<div class="Gallery_box_bottom">
								<h4
									class="mbr-section-subtitle mbr-fonts-style align-center mb-0 mt-2 display-5">
									<button type="button" class="btn btn-outline-dark"
										onclick="location.href='/adm/gallery?num=1' ">All</button>
									<button type="button" class="btn btn-outline-dark"
										onclick="location.href='/adm/gallery?num=1&searchType=인물' ">인물</button>
									<button type="button" class="btn btn-outline-dark"
										onclick="location.href='/adm/gallery?num=1&searchType=사물' ">사물</button>
									<button type="button" class="btn btn-outline-dark"
										onclick="location.href='/adm/gallery?num=1&searchType=풍경' ">풍경</button>
								</h4>
							</div>
						</div>


						<div class="imgs_wrap2">
							<c:forEach var="gallery" items="${gallery}" varStatus="status">
								<div class="img_box">
									<img id="img" style="width: 300px; height: 300px"
										src="<c:out value='${gallery.gallery_path }' /><c:out value='${gallery.gallery_img }' />" />
									<div class="MorD_class">
										<span><c:out value='${gallery.gallery_title }' /></span> <span><a
											href="javascript:GalleryModify(<c:out value='${gallery.no }' />);"><i
												class="far fa-edit"></i></a></span> <span><a
											href="javascript:GalleryDel(<c:out value='${gallery.no }' />);"><i
												class="far fa-trash-alt"></i></a></span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--# 갤러리 리스트 -->

		<!-- 페이징버튼 -->
		<div class="center">
			<div class="pagination">
				<c:if test="${page.prev}">
					<a class="a_click"
						href="/adm/gallery?num=${page.startPageNum - 1}${page.searchTypeKeyword}">&laquo;</a>
				</c:if>

				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
					var="num">

					<c:if test="${select != num}">
						<a class="a_click"
							href="/adm/gallery?num=${num}${page.searchTypeKeyword}">${num}</a>
					</c:if>

					<c:if test="${select == num}">
						<a style="background-color: bisque;">${num}</a>
					</c:if>
				</c:forEach>

				<c:if test="${page.next}">
					<a class="a_click"
						href="/adm/gallery?num=${page.endPageNum + 1}${page.searchTypeKeyword}">&raquo;</a>
				</c:if>
			</div>
		</div>
		<!--  /Traffic -->
		<div class="clearfix"></div>

	</div>
</div>
<!-- /.content -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

//파라미터 값 가져오기 함수
function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
			.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(
			/\+/g, " "));
}

$(document).ready(function() {

	var no = getParameterByName("num");
	if(no == 1 || no > 1){
		document.getElementById('loadStart').scrollIntoView();
	}

});

		
</script>
<style>
.imgs_wrap2 {
	width: 100%;
	height: auto;
	margin-top: 30px;
	min-height: 350px;
	display: flex;
	flex-wrap: wrap;
}

.card-body-flex {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}
</style>

<style type="text/css">
input[type=file] {
	display: none;
}

.my_button {
	display: inline-block;
	width: 150px;
	text-align: center;
	padding: 10px;
	background-color: #006BCC;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}

.imgs_wrap {
	margin-top: 30px;
	margin-bottom: 30px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.imgs_wrap img {
	min-width: 150px;
	min-height: 150px;
	max-width: 150px;
	max-height: 150px;
	margin-left: 10px;
	margin-right: 10px;
}

.imgUpload {
	width: 90%;
	margin-bottom: 5rem;
	margin: auto;
	min-height: 500px;
}

.img_box {
	width: 320px;
	height: 350px;
	margin-left: 3rem;
}

.MorD_class {
	display: flex;
	justify-content: space-around;
	margin-left: -1rem;
}
</style>
<style>
.Gallery_box_header {
	margin-bottom: 4rem;
}

.Gallery_box_bottom {
	margin-bottom: 4rem;
}

.center {
	text-align: center;
	margin-top: 4rem;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>
<script type="text/javascript">
	// 이미지 정보들을 담을 배열
	var sel_files = [];

	$(document).ready(function() {
		$("#input_imgs").on("change", handleImgFileSelect);
	});

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}

	function handleImgFileSelect(e) {

		// 이미지 정보들을 초기화
		sel_files = [];
		$(".imgs_wrap").empty();

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var index = 0;
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}

					sel_files.push(f);

					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
						$(".imgs_wrap").append(html);
						index++;

					}
					reader.readAsDataURL(f);

				});
	}

	function deleteImageAction(index) {
		console.log("index : " + index);
		console.log("sel length : " + sel_files.length);

		sel_files.splice(index, 1);

		var img_id = "#img_id_" + index;
		$(img_id).remove();
	}

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}

	function submitAction() {

		console.log("업로드 파일 갯수 : " + sel_files.length);
		var select_title = $("#gallery_title").val();

		if(select_title == "Img Title"){
			alert("타이틀을 선택해주세요");
			return false;
		}
		
		var data = new FormData();

		for (var i = 0, len = sel_files.length; i < len; i++) {
			var name = "image_" + i;
			data.append(name, sel_files[i]);
		}
		data.append("image_count", sel_files.length);

		if (sel_files.length < 1) {
			alert("한개이상의 파일을 선택해주세요.");
			return false;
		}

		var isSubmit = false;

		var form = new FormData(document.getElementById('Gallery_form'));

		$.ajax({
			url : "/adm/gallery_upload", //컨트롤러 URL
			data : form,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(res) {
				if (res == "suc") {
					location.reload(true);
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


	function GalleryDel(no) {

		var result = confirm("Gallery 사진을 삭제 하시겠씁니까?");

		var num = getParameterByName("num");
		
		if (result) {
			$.ajax({
				url : '/adm/gallery_delete?no=' + no,
				type : 'get',
				dataType : 'text',
				async : false, // 비동기식으로 처리를 함 
				success : function(res) {
					if (res == "suc") {
						location.href = '/adm/gallery?num='+num;
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

	function GalleryModify(no) {
		var popupWidth = 800;
		var popupHeight = 400;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		
			var page = getParameterByName("num");
		window.open("/adm/g_modify_popup?no=" + no +"&page="+page, 'GalleryModify', 'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);


	}
</script>
