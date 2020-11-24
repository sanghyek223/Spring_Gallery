<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Main -->
<section class="header13 cid-sgtfTkkODT" id="header13-19">



	<div class="mbr-overlay"
		style="opacity: 0.4; background-color: rgb(255, 255, 255);
  background-image: url('${banner.banner_path}${banner.banner_img}');"></div>

	<div class="align-center container-fluid">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-10">
				<h1 class="mbr-section-title mbr-fonts-style mb-3 display-1">
					<strong>Profile</strong>
				</h1>

				<p class="mbr-text mbr-fonts-style mb-3 display-7">Profile</p>


			</div>
		</div>
	</div>
</section>
<style>
.cid-sgtfTkkODT {
    padding-top: 7rem;
    padding-bottom: 5rem;
    background-image: url();
}
</style>
<section class="testimonials1 cid-sgtfUHEtFE" id="testimonials1-1a">



	<div class="container">

		<div class="row align-items-center">
			<div class="col-12 col-md-6">
				<div class="image-wrapper">
					<img src="${profile.profile_path}${profile.profile_img}"
						alt="Mobirise">
				</div>
			</div>
			<div class="col-12 col-md">
				<div class="text-wrapper">
					<pre><p class="mbr-text mbr-fonts-style mb-4 display-7">${profile.profile_content}</p></pre>
					<p class="name mbr-fonts-style mb-1 display-4">
						<strong>${profile.profile_name}</strong>
					</p>

				</div>
			</div>
		</div>
	</div>
</section>

<section class="social2 cid-sgti479BL6" id="share2-1d">





	<div class="container">
		<div class="media-container-row">
			<div class="col-12">

				<div>

					<div class="mbr-social-likes align-center" data-counters="false">
						<c:forEach var="social" items="${social}">
							<c:if test="${social.social_name == 'instagram' }">
								<a href="<c:out value ='${social.social_link }'/>" target="_blank"> <span
									class="mbr-iconfont mbr-iconfont-social socicon-instagram socicon"></span>
								</a>
							</c:if>
							<c:if test="${social.social_name == 'facebook' }">
								<a
									href="<c:out value ='${social.social_link }'/>"
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
</section>
<style>
.mbr-social-likes a span {
	margin: 2rem;
	font-size: 50px;
	border-radius: 50%;
	text-align: center;
	color: #232323;
	align-content: center;
	transition: all 0.3s;
}
</style>