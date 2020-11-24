<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Main -->

<section class="header13 cid-sgtiNj1Qoj" style="margin-bottom: 10rem;" id="header13-1f">



	<div class="mbr-overlay"
		style="opacity: 0.4; background-color: rgb(255, 255, 255); background-image: url('${banner.banner_path}${banner.banner_img}');"></div>

	<div class="align-center container-fluid">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-10">
				<h1 class="mbr-section-title mbr-fonts-style mb-3 display-1">
					<strong>Gallery</strong>
				</h1>

				<p class="mbr-text mbr-fonts-style mb-3 display-7">My photo
					Gallery</p>


			</div>
		</div>
	</div>
</section>

<section class="slider2 cid-sgtPXEF4HV" style="margin-bottom: 10rem;" id="slider2-2f">


	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-11">
				<div class="carousel slide" id="sguEC8YBmQ" data-ride="carousel"
					data-interval="5000">

					<ol class="carousel-indicators">
						<c:set var="check" value="0" />
						<c:forEach var="gallery" items="${galleryRandom}"
							varStatus="status">
							<c:if test="${check eq 0}">
								<li data-slide-to="<c:out value ='${check}'/>" class="active"
									data-target="#sguEC8YBmQ"></li>
							</c:if>
							<c:if test="${check ne 0}">
								<li data-slide-to="<c:out value ='${check}'/>"
									data-target="#sguEC8YBmQ"></li>
							</c:if>
							<c:set var="check" value="${check + 1}" />
						</c:forEach>
						
						
					</ol>
					<div class="carousel-inner">
						<c:set var="check_2" value="0" />
						<c:forEach var="gallery" items="${galleryRandom}"
							varStatus="status">
							<c:if test="${check_2 eq 0}">
								<div class="carousel-item slider-image item active">
									<div class="item-wrapper">
										<img class="d-block w-100"
											src="<c:out value ='${gallery.gallery_path }'/><c:out value ='${gallery.gallery_img }'/>">

									</div>
								</div>
							</c:if>
							<c:if test="${check_2 ne 0}">
								<div class="carousel-item slider-image item">
									<div class="item-wrapper">
										<img class="d-block w-100"
											src="<c:out value ='${gallery.gallery_path }'/><c:out value ='${gallery.gallery_img }'/>">

									</div>
								</div>
							</c:if>
							<c:set var="check_2" value="${check_2 + 1}" />
						</c:forEach>


					</div>
					<a class="carousel-control carousel-control-prev" role="button"
						data-slide="prev" href="#sguEC8YBmQ"> <span
						class="mobi-mbri mobi-mbri-arrow-prev" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="carousel-control carousel-control-next" role="button"
						data-slide="next" href="#sguEC8YBmQ"> <span
						class="mobi-mbri mobi-mbri-arrow-next" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</section>

<div id="inc_box">
	<jsp:include page="./incGallery.jsp" />
</div>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
		document.getElementById('inc_box').scrollIntoView();
	}

});

		
</script>