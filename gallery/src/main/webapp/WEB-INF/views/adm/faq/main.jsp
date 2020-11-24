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
							<li><strong>FAQ</strong></li>
							<li>Modify</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<style>
.row {
	margin: auto;
	margin-top: 2rem;
	margin-bottom: 2rem;
	width: 95%;
}

#accordion {
	width: 95%;
	margin-top: 3rem;
	margin-bottom: 2rem;
}

.MorD_class {
	width: 50px;
	float: right;
	margin-top: -4rem;
	margin-right: -3.5rem;
	display: flex;
	justify-content: space-evenly;
	float: right;
}

.card-body-flex {
	display: flex;
	justify-content: space-evenly;
}

.card-header {
	background-color: gainsboro;
}
</style>

<div class="clearfix"></div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	function FaqInsert() {
		var popupWidth = 1000;
		var popupHeight = 700;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		
		window.open("/adm/faq_insert_popup", 'FAQModify', 'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
		

	}

	function FaqModify(no) {
		var popupWidth = 1000;
		var popupHeight = 700;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
				
		window.open("/adm/faq_modify_popup?no=" + no, 'FAQModify', 'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
		

	}

	function FaqDel(no) {

		var result = confirm("FAQ 글을 삭제 하시겠씁니까?");

		if (result) {
			console.log(no);
			$.ajax({
				url : '/adm/faq_delete?no=' + no,
				type : 'get',
				dataType : 'text',
				async : false, // 비동기식으로 처리를 함 
				success : function(res) {
					if (res == "suc") {
						location.href = '/adm/faq';
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

<!-- 아코디언 -->
<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="card-body-flex">
					<h4 class="box-title">FAQ</h4>
					<a href="javascript:FaqInsert();"><i class="fas fa-plus fa-2x"></i></a>
				</div>
				<div id="accordion">

					<c:forEach var="FAQlist" items="${FAQlist}" varStatus="status">
						<!-- 아코디언 1ea 구분 -->
						<div class="card">
							<a class="card-link" data-toggle="collapse"
								href="#collapse_<c:out value='${FAQlist.no }' />">
								<div class="card-header">
									<c:out value='${FAQlist.faq_title }' />
								</div>
							</a>
							<div id="collapse_<c:out value='${FAQlist.no }' />"
								class="collapse" data-parent="#accordion">
								<div class="card-body">
									<c:out value='${FAQlist.faq_contents }' />
								</div>
							</div>
						</div>

						<div class="MorD_class">
							<span><a
								href="javascript:FaqModify(<c:out value='${FAQlist.no }' />);"><i
									class="far fa-edit"></i></a></span> <span><a
								href="javascript:FaqDel(<c:out value='${FAQlist.no }' />);"><i
									class="far fa-trash-alt"></i></a></span>
						</div>
						<!-- #아코디언 1ea 구분 -->
					</c:forEach>

				</div>

			</div>
		</div>
	</div>
</div>
<!--# 아코디언 -->




