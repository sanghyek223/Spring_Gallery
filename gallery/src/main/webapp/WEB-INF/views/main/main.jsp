<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Main -->

<section class="slider1 cid-sgt335uEef mbr-fullscreen" id="slider1-k">

	<div class="carousel slide" id="sguEBXbUXC" data-ride="carousel"
		data-interval="5000">
		<ol class="carousel-indicators">
			<c:forEach var="slidelist" items="${slidelist}" varStatus="status">
				<c:set var="count" value="${status.count }" />
				<c:choose>

					<c:when test="${count eq 1}">
						<li data-slide-to="<c:out value="${status.count}" />"
							class="active" data-target="#sguEBXbUXC"></li>
					</c:when>
					<c:when test="${count ne 1}">
						<li data-slide-to="<c:out value="${status.count}" />"
							data-target="#sguEBXbUXC"></li>
					</c:when>
				</c:choose>

			</c:forEach>
		</ol>


		<div class="carousel-inner">
			<c:forEach var="slidelist" items="${slidelist}" varStatus="status">
				<c:set var="count" value="${status.count }" />
				<c:choose>

					<c:when test="${count eq 1}">
						<div class="carousel-item slider-image item active">
							<div class="item-wrapper">
								<img class="d-block w-100"
									src="<c:out value='${slidelist.slide_path}' /><c:out value='${slidelist.slide_img}' />"
									data-slide-to="<c:out value="${status.count}" />">
							</div>
						</div>
					</c:when>
					<c:when test="${count ne 1}">
						<div class="carousel-item slider-image item">
							<div class="item-wrapper">
								<img class="d-block w-100"
									src="<c:out value='${slidelist.slide_path}' /><c:out value='${slidelist.slide_img}' />"
									data-slide-to="<c:out value="${status.count}" />">


							</div>
						</div>
					</c:when>

				</c:choose>
			</c:forEach>


		</div>
		<a class="carousel-control carousel-control-prev" role="button"
			data-slide="prev" href="#sguEBXbUXC"> <span
			class="mobi-mbri mobi-mbri-arrow-prev" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control carousel-control-next" role="button"
			data-slide="next" href="#sguEBXbUXC"> <span
			class="mobi-mbri mobi-mbri-arrow-next" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</section>

<section class="team2 cid-sgt39vGFMn"
	xmlns="http://www.w3.org/1999/html" id="team2-m">


	<div class="container">
		<div class="card">
			<div class="card-wrapper">
				<div class="row align-items-center">
					<div class="col-12 col-md-3">
						<div class="image-wrapper">
							<img style="width: 253px; height: 253px;"
								src="${profile.profile_path}${profile.profile_img}"
								alt="Mobirise">
						</div>
					</div>
					<div class="col-12 col-md">
						<div class="card-box">
							<h5 class="card-title mbr-fonts-style m-0 display-5">
								<strong>${profile.profile_name}</strong>
							</h5>
							<pre><p class="mbr-text mbr-fonts-style display-7">${profile.profile_content}</p></pre>

							<div class="social-row display-7">
								<div class="mbr-social-likes align-center" data-counters="false">
									<c:forEach var="social" items="${social}">
										<c:if test="${social.social_name == 'instagram' }">
											<a href="<c:out value ='${social.social_link }'/>"
												target="_blank"> <span
												class="mbr-iconfont mbr-iconfont-social socicon-instagram socicon"></span>
											</a>
										</c:if>
										<c:if test="${social.social_name == 'facebook' }">
											<a href="<c:out value ='${social.social_link }'/>"
												target="_blank"> <span
												class="socicon-facebook socicon mbr-iconfont mbr-iconfont-social"></span>
											</a>
										</c:if>
									</c:forEach>
								</div>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<style>
.mbr-social-likes a span {
	margin: 1rem;
	font-size: 27px;
	border-radius: 50%;
	text-align: center;
	color: #232323;
	align-content: center;
	transition: all 0.3s;
}

.card-wrapper {
	margin-bottom: 10rem;
	margin-top: 8rem;
}

.mbr-section-head {
	margin-top: 5rem;
}
</style>


	</div>
</section>

<section class="gallery6 mbr-gallery cid-sguDHXFPY6" id="gallery6-2k">




	<div class="container-fluid">
		<div class="mbr-section-head">
			<h3
				class="mbr-section-title mbr-fonts-style align-center m-0 display-2">
				<strong>Gallery</strong>
			</h3>
			<h4
				class="mbr-section-subtitle mbr-fonts-style align-center mb-0 mt-2 display-5">
				<a href="/gallery">more..</a>
			</h4>
		</div>
		<div class="row mbr-gallery mt-4">



			<c:set var="check" value="0" />
			<c:forEach var="gallery" items="${galleryRandom}" varStatus="status">
				<div class="col-12 col-md-6 col-lg-3 item gallery-image">
					<div class="item-wrapper" data-toggle="modal"
						data-target="#sguEBYtf3d-modal">
						<img class="w-100"
							src="<c:out value ='${gallery.gallery_path }'/><c:out value ='${gallery.gallery_img }'/>"
							alt="" data-slide-to="<c:out value ='${check}'/>"
							data-target="#lb-sguEBYtf3d">
						<div class="icon-wrapper">
							<span
								class="mobi-mbri mobi-mbri-search mbr-iconfont mbr-iconfont-btn"></span>
						</div>
					</div>
				</div>
				<c:set var="check" value="${check + 1}" />
			</c:forEach>



		</div>

		<div class="modal mbr-slider" tabindex="-1" role="dialog"
			aria-hidden="true" id="sguEBYtf3d-modal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<div class="carousel slide" id="lb-sguEBYtf3d"
							data-ride="carousel" data-interval="5000">
							<div class="carousel-inner">


								<c:set var="check_2" value="0" />
								<c:forEach var="gallery" items="${galleryRandom}" varStatus="status">
									<c:if test="${check_2 eq 0}">
										<div class="carousel-item active">
											<img class="d-block w-100"
												src="<c:out value ='${gallery.gallery_path }'/><c:out value ='${gallery.gallery_img }'/>"
												alt="">
										</div>
									</c:if>
									<c:if test="${check_2 ne 0}">
										<div class="carousel-item">
											<img class="d-block w-100"
												src="<c:out value ='${gallery.gallery_path }'/><c:out value ='${gallery.gallery_img }'/>"
												alt="">
										</div>
									</c:if>
									<c:set var="check_2" value="${check_2 + 1}" />
								</c:forEach>


							</div>


							<ol class="carousel-indicators">
								<c:set var="check_3" value="0" />
								<c:forEach var="gallery" items="${galleryRandom}" varStatus="status">
									<c:if test="${check_3 eq 0}">
										<li data-slide-to="<c:out value ='${check_3 }'/>"
											class="active" data-target="#lb-sguEBYtf3d"></li>
									</c:if>
									<c:if test="${check_3 ne 0}">
										<li data-slide-to="<c:out value ='${check_3}'/>"
											data-target="#lb-sguEBYtf3d"></li>
									</c:if>
									<c:set var="check_3" value="${check_3 + 1}" />
								</c:forEach>


							</ol>


							<a role="button" href="" class="close" data-dismiss="modal"
								aria-label="Close"> </a> <a
								class="carousel-control-prev carousel-control" role="button"
								data-slide="prev" href="#lb-sguEBYtf3d"> <span
								class="mobi-mbri mobi-mbri-arrow-prev" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next carousel-control" role="button"
								data-slide="next" href="#lb-sguEBYtf3d"> <span
								class="mobi-mbri mobi-mbri-arrow-next" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="content16 cid-sgt38jMa1d" id="content16-l">




	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-10">
				<div class="mbr-section-head align-center mb-4">
					<h3 class="mbr-section-title mb-0 mbr-fonts-style display-2">
						<strong>FAQ</strong>
					</h3>

				</div>
				<div id="bootstrap-accordion_7"
					class="panel-group accordionStyles accordion" role="tablist"
					aria-multiselectable="true">

					<c:forEach var="FAQlist" items="${FAQlist}" varStatus="status">

						<div class="card mb-3">
							<div class="card-header" role="tab" id="headingOne">
								<a role="button" class="panel-title collapsed"
									data-toggle="collapse" data-core=""
									href="#collapse<c:out value='${FAQlist.no }' />"
									aria-expanded="false" aria-controls="collapse1">
									<h6 class="panel-title-edit mbr-fonts-style mb-0 display-7">
										<strong>${FAQlist.faq_title }</strong>
									</h6> <span class="sign mbr-iconfont mbri-arrow-down"></span>
								</a>
							</div>
							<div id="collapse<c:out value='${FAQlist.no }' />"
								class="panel-collapse noScroll collapse" role="tabpanel"
								aria-labelledby="headingOne"
								data-parent="#bootstrap-accordion_7">
								<div class="panel-body">
									<p class="mbr-fonts-style panel-text display-4">
										${FAQlist.faq_contents }</p>
								</div>
							</div>
						</div>


					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>