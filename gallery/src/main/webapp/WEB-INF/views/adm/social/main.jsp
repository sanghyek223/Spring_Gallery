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
							<li><strong>Social</strong></li>
							<li>Link Setting</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="clearfix"></div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	function SocialModify(social) {
		var popupWidth = 1300;
		var popupHeight = 400;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		window.open("/adm/Social_modify_popup?social=" + social, 'SocialModify', 'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);


	}
</script>

<!-- 소셜 리스트 -->
<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="card-body-flex">
					<h4 class="box-title">Social Link Setting</h4>
				</div>
				<div class="social-block">
				
					<c:forEach var="social" items="${social}">
						<div class="social-block-setting">
							<c:if test="${social.social_name == 'instagram' }">
								<i class="fab fa-instagram fa-7x"></i>
							</c:if>
							<c:if test="${social.social_name == 'facebook' }">
								<i class="fab fa-facebook-square fa-7x"></i>
							</c:if>
							<c:if test="${social.social_name == 'kakao' }">
								<i class="fab fa-instagram fa-7x"></i>
							</c:if>
							<c:if test="${social.social_name == 'email' }">
								<i class="far fa-envelope fa-7x"></i>
							</c:if>
							<div class="form-group">
								<label for="usr"><c:out value='${social.social_name }' />:</label>
								<input type="text" class="form-control"
									id="<c:out value ='${social.social_name }'/>"
									value="<c:out value ='${social.social_link }'/>" readonly>
							</div>
							<span><a
								href="javascript:SocialModify('<c:out value ='${social.social_name }'/>');"><i
									class="far fa-edit"></i></a></span>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
</div>
<!--# 소셜 리스트 -->

<style>
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