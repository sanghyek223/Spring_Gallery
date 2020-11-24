<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="gallery6 mbr-gallery cid-sguDHXFPY6" style="margin-bottom: 10rem;" id="gallery6-2k">


<div id="reload_box">

		<div class="container-fluid">
			<div class="mbr-section-head">
			<div class="Gallery_box_header">
				<h3
					class="mbr-section-title mbr-fonts-style align-center m-0 display-2">
					<strong>Gallery</strong>
				</h3>
				</div>
				<div class="Gallery_box_bottom">
				<h4
					class="mbr-section-subtitle mbr-fonts-style align-center mb-0 mt-2 display-5">
					<button type="button" class="btn btn-outline-dark" onclick="location.href='/gallery?num=1' ">All</button>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='/gallery?num=1&searchType=인물' ">인물</button>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='/gallery?num=1&searchType=사물' ">사물</button>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='/gallery?num=1&searchType=풍경' ">풍경</button>
				</h4>
				</div>
			</div>
			<div class="row mbr-gallery mt-4">



				<c:set var="check" value="0" />
				<c:forEach var="gallery" items="${gallery}" varStatus="status">
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
									<c:forEach var="gallery" items="${gallery}" varStatus="status">
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
									<c:forEach var="gallery" items="${gallery}" varStatus="status">
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

		<!-- 페이징버튼 -->
		<div class="center">
			<div class="pagination">
				<c:if test="${page.prev}">
					<a  class="a_click" href="/gallery?num=${page.startPageNum - 1}${page.searchTypeKeyword}">&laquo;</a>
				</c:if>

				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
					var="num">

					<c:if test="${select != num}">
						<a class="a_click" href="/gallery?num=${num}${page.searchTypeKeyword}">${num}</a>
					</c:if>

					<c:if test="${select == num}">
						<a style="background-color: bisque;">${num}</a>
					</c:if>
				</c:forEach>

				<c:if test="${page.next}">
					<a  class="a_click" href="/gallery?num=${page.endPageNum + 1}${page.searchTypeKeyword}">&raquo;</a>
				</c:if>
			</div>
		</div>
		
</div>
		<style>
		
		.Gallery_box_header{
		
		margin-bottom:4rem;
		
		}
				.Gallery_box_bottom{
		
		margin-bottom:4rem;
		
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
	</section>