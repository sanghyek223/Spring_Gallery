<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



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
							<li><strong>Profile</strong></li>
							<li>modify</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="clearfix"></div>

<style>
section {
	margin: auto;
	margin-top: 3rem;
	margin-bottom: 3rem;
}

.container {
	background-color: white;
	min-height: 600px;
}

.text-wrapper {
	min-height: 300px;
	margin-top:3rem;
	margin-left:2.5rem;
}

.image-wrapper {
	min-height: 300px;
}

.social_icon {
	padding-top: 4rem;
	min-height: 300px;
	display: flex;
	justify-content: space-evenly;
}

.display-4 {
	height: 150px;
	margin-top: -3rem;
	margin-LEFT: -1rem;
}

.text-wrapper p {
	margin-top: 5rem;
	margin-LEFT: 2rem;
}

.profile_btn {
	float: left;
	margin-top: 2.5rem;
	margin-left:2rem;
}
</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	function profileModify() {
		var popupWidth = 800;
		var popupHeight = 650;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		
		window.open("/adm/profile_modify_popup", 'ProfilModify', 'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);

	}

	function ProfileImgModify() {
		var popupWidth = 550;
		var popupHeight = 400;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음

        window.open("/adm/profile_ImgModify_popup", 'ProfileIMG', 'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);


	}
</script>

<!-- profile -->
<section class="testimonials1 cid-sgtfUHEtFE" id="testimonials1-1a">

	<div class="container">

		<div class="row align-items-center">
			<div class="col-12 col-md-6">

				<div class="text-wrapper">
					<pre>
						<p class="mbr-text mbr-fonts-style mb-4 display-7">${profile.profile_content}</p>
					</pre>
					<p class="name mbr-fonts-style mb-1 display-4">
						<strong style="font-size: 18px;">${profile.profile_name}</strong>
					</p>
					
										<input type="button" value="프로필 수정" class="profile_btn"
						onclick="profileModify();">

				</div>
			</div>
			<div class="col-12 col-md">
				<div class="image-wrapper">
					<a href="javascript:ProfileImgModify();"><img src="${profile.profile_path}${profile.profile_img}" style="width:400px;height:450px;"></a>
				</div>
			</div>
		</div>
	</div>

</section>


<!-- #profile -->
