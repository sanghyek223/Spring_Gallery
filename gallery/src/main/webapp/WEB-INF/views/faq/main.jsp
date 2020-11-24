<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- main -->

<section class="header13 cid-sgtmjTd4b0" id="header13-1p">



	<div class="mbr-overlay"
		style="opacity: 0.4; background-color: rgb(255, 255, 255); background-image: url('${banner.banner_path}${banner.banner_img}');"></div>

	<div class="align-center container-fluid">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-10">
				<h1 class="mbr-section-title mbr-fonts-style mb-3 display-1">
					<strong>F A Q</strong>
				</h1>

				<p class="mbr-text mbr-fonts-style mb-3 display-7">궁금한 점이 있으신가요?</p>


			</div>
		</div>
	</div>
</section>

<section class="content16 cid-sgtmZBVE0s" id="content16-20">




	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12 col-md-10">

				<div id="bootstrap-accordion_24"
					class="panel-group accordionStyles accordion" role="tablist"
					aria-multiselectable="true">



					<!-- 아코디언 1ea 구분 -->

					<c:forEach var="FAQlist" items="${FAQlist}" varStatus="status">
						<div class="card mb-3">
							<div class="card-header" role="tab" id="headingOne">
								<a role="button" class="panel-title collapsed"
									data-toggle="collapse" data-core=""
									href="#collapse<c:out value="${status.count}" />"
									aria-expanded="false" aria-controls="collapse2">
									<h6 class="panel-title-edit mbr-fonts-style mb-0 display-7">
										<strong><c:out value='${FAQlist.faq_title }' /></strong>
									</h6> <span class="sign mbr-iconfont mbri-arrow-down"></span>
								</a>
							</div>
							<div id="collapse<c:out value="${status.count}" />"
								class="panel-collapse noScroll collapse" role="tabpanel"
								aria-labelledby="headingOne"
								data-parent="#bootstrap-accordion_24">
								<div class="panel-body">
									<p class="mbr-fonts-style panel-text display-4">
										<c:out value='${FAQlist.faq_contents }' />
									</p>
								</div>
							</div>
						</div>

					</c:forEach>
					<!-- #아코디언 1ea 구분 -->


				</div>
			</div>
		</div>
	</div>
</section>