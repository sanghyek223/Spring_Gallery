<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- main -->

<section class="header13 cid-sgtnELc8TZ" id="header13-22">



	<div class="mbr-overlay"
		style="opacity: 0.4; background-color: rgb(255, 255, 255); background-image: url('${banner.banner_path}${banner.banner_img}');"></div>

	<div class="align-center container-fluid">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-10">
				<h1 class="mbr-section-title mbr-fonts-style mb-3 display-1">
					<strong>Inquiry</strong>
				</h1>

				<p class="mbr-text mbr-fonts-style mb-3 display-7">촬영 문의는 카카오 /
					Email 로 가능합니다</p>


			</div>
		</div>
	</div>
</section>

<section class="features23 cid-sgtteGukCr" id="features24-2c">



	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12">
				<div class="card-wrapper mb-4">
					<div class="card-box align-center">
						<h4 class="card-title mbr-fonts-style mb-4 display-2">
							<strong>Steps</strong>
						</h4>


					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-4">
				<div class="item first mbr-flex p-4">
					<div class="icon-wrap w-100">
						<div class="icon-box">
							<span class="step-number mbr-fonts-style display-5">1</span>
						</div>
					</div>

					<div class="text-box">
						<h4
							class="icon-title card-title mbr-black mbr-fonts-style display-7">
							<strong>촬영 문의</strong>
						</h4>
						<h5 class="mbr-text mbr-black mbr-fonts-style display-4">카카오
							or E-mail 문의</h5>
					</div>
				</div>
				<!-- <span mbr-icon class="mbr-iconfont mobi-mbri-devices mobi-mbri"></span> -->
			</div>
			<div class="col-12 col-md-6 col-lg-4">
				<div class="item mbr-flex p-4">
					<div class="icon-wrap w-100">
						<div class="icon-box">
							<span class="step-number mbr-fonts-style display-5">2</span>
						</div>
					</div>
					<div class="text-box">
						<h4
							class="icon-title card-title mbr-black mbr-fonts-style display-7">
							<strong>촬영 예약</strong>
						</h4>
						<h5 class="mbr-text mbr-black mbr-fonts-style display-4">상담후
							촬영 예약</h5>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-4">
				<div class="item mbr-flex p-4">
					<div class="icon-wrap w-100">
						<div class="icon-box">
							<span class="step-number mbr-fonts-style display-5">3</span>
						</div>
					</div>
					<div class="text-box">
						<h4
							class="icon-title card-title mbr-black mbr-fonts-style display-7">
							<strong>스튜디오 촬영</strong>
						</h4>
						<h5 class="mbr-text mbr-black mbr-fonts-style display-4">스튜디오
							촬영 진행</h5>
					</div>
				</div>
			</div>





		</div>
	</div>
</section>

<section class="contacts1 cid-sgtvJwcto2" id="contacts1-2d">




	<div class="container">
		<div class="mbr-section-head">
			<h3
				class="mbr-section-title mbr-fonts-style align-center mb-0 display-2">
				<strong>촬영 문의 ?!</strong><br> <strong><br></strong>
			</h3>

		</div>
		<div class="row justify-content-center mt-4">

			<c:forEach var="social" items="${social}">
				<c:if test="${social.social_name == 'email' }">
					<div class="card col-12 col-lg-6">
						<div class="card-wrapper">
							<div class="card-box align-center">
								<a href="javascript:mail();"> <input type="hidden"
									id="hidden_email"
									value="<c:out value ='${social.social_link }'/>">
									<div class="image-wrapper">
										<span class="mbr-iconfont mobi-mbri-letter mobi-mbri"></span>
									</div>
									<h4 class="card-title mbr-fonts-style mb-2 display-2">
										<strong><c:out value='${social.social_name }' /></strong>
									</h4>
								</a>

							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${social.social_name == 'kakao' }">
					<div class="card col-12 col-lg-6">
						<div class="card-wrapper">
							<div class="card-box align-center">
								<a href="<c:out value ='${social.social_link }'/>"><div
										class="image-wrapper">
										<span class="mbr-iconfont socicon-mail socicon"></span>
									</div>
									<h4
										class="card-title mbr-fonts-style align-center mb-2 display-2">
										<strong><c:out value='${social.social_name }' /></strong>
									</h4> </a>

							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>


		</div>
	</div>
</section>
<script>
	function mail() {

		alert("Email 주소 : " + $("#hidden_email").val());

	}
</script>
<section class="contacts4 cid-sgtrQ5o073" id="contacts4-2a">





	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="text-content col-12 col-md-6 order-2">
				<h2 class="mbr-section-title mbr-fonts-style display-5">
					<strong>Follow Us</strong>
				</h2>

			</div>
			<div
				class="icons d-flex align-items-center col-12 col-md-6 justify-content-end mt-md-0 mt-2 flex-wrap">
				<c:forEach var="social" items="${social}">
					<c:if test="${social.social_name == 'instagram' }">
						<a href="<c:out value ='${social.social_link }'/>" target="_blank">
							<span
							class="mbr-iconfont mbr-iconfont-social socicon-instagram socicon"></span>
						</a>
					</c:if>
					<c:if test="${social.social_name == 'facebook' }">
						<a href="<c:out value ='${social.social_link }'/>" target="_blank">
							<span
							class="socicon-facebook socicon mbr-iconfont mbr-iconfont-social"></span>
						</a>
					</c:if>
				</c:forEach>

			</div>
		</div>
	</div>

</section>