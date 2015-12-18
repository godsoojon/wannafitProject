<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- Bootstrap core CSS -->
<link href="${initParam.rootPath}/assets/css/bootstrap.css"
	rel="stylesheet">
<!--external css-->
<link
	href="${initParam.rootPath}/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link
	href="${initParam.rootPath}/assets/js/fancybox/jquery.fancybox.css"
	rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="${initParam.rootPath}/assets/css/style.css" rel="stylesheet">
<link href="${initParam.rootPath}/assets/css/style-responsive.css"
	rel="stylesheet">

<script src="${initParam.rootPath}/assets/js/jquery.js"></script>
<!-- PopupOpen -->
<script type="text/javascript">
	function popupOpen() {
		window.open("${initParam.rootPath}/window_popup2.jsp", "",
				"width=500,heigth=350,resizable=no");
	}
</script>
</head>

<!-- ------------------------------------------------------------------------------------------------------------ -->

<section id="main-content">
	<section class="wrapper">

		<ul class="nav nav-tabs">
			<li role="presentation"><a
				href="${initParam.rootPath}/partyController/logincheck/allParty.do">모든
					앨범 보기</a></li>
			<li role="presentation" class="active"><a
				href="${initParam.rootPath}/partyController/logincheck/belongParty.do">나의
					앨범 목록</a></li>
			<li role="presentation"><a
				href="${initParam.rootPath}/partyController/logincheck/makeParty_form.do">앨범
					만들기</a></li>
		</ul>

		<!-- ------------------------------------------------------------------------------------------------------------ -->

		<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
*********************************************************************************************************************************************************** -->
		<!--main content start-->
		<section class="wrapper site-min-height">
			<h3>
				<i class="fa fa-angle-right"></i>Gallery
			</h3>
			<button class="btn btn-success btn-xs" onclick="popupOpen();">
				<i class="fa fa-check">사진올리기</i>
			</button>
			<hr>
			<div class="row mt">

				<%-- <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
					<div class="project-wrapper">
						<div class="project">
							<div class="photo-wrapper">
								<div class="photo">
									<!-- ${initParam.rootPath}/album/logincheck/sample.do?pictureName=port04.jpg -->
									<a class="fancybox"
										href="${initParam.rootPath}/assets/img/portfolio/port04.jpg">
										<img class="img-responsive"
										src="${initParam.rootPath}/assets/img/portfolio/port04.jpg"
										alt="">
									</a>
									<!-- 이미지를 반응형으로 사용하기 위해선 이미지 태그에 img-responsive 클래스를 추가 -->
								</div>
								<div class="overlay"></div>
							</div>
						</div>
					</div>
				</div>
--%>

				<%-- <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
					<div class="project-wrapper">
						<div class="project">
							<div class="photo-wrapper">
								<div class="photo">
									<a 
										href="${initParam.rootPath}/album/logincheck/pictureView.do?pictureName=port06.jpg " ><img
										class="img-responsive"
										src="${initParam.rootPath}/assets/img/portfolio/port06.jpg"
										alt=""></a>
								</div>
								<div class="overlay"></div>
							</div>
						</div>
					</div>
				</div>  --%>
				
				<c:choose>
					<c:when test="${fn:length(requestScope.listPhotoUpload)==0 }" />
					<c:otherwise>
						<c:forEach items="${requestScope.listPhotoUpload}" var="photoList">

							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<div class="photo">
												<a 
													href="${initParam.rootPath}/album/logincheck/pictureView.do?pictureName=${photoList.photoContent}&pictureNumber=${photoList.photoId}"><img
													class="img-responsive"
													src="${initParam.rootPath}/upimage/${photoList.photoContent}"
													alt=""></a>
											</div>
											<div class="overlay"></div>
											<a
												href="${initParam.rootPath}/album/logincheck/delete.do?deletephotoId=${photoList.photoId}">사진삭제 </a>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

		</section>
	</section>
	<!-- /MAIN CONTENT -->

	<!-- ------------------------------------------------------------------------------------------------------------ -->


	<!--footer start-->
	<footer class="site-footer">
		<div class="text-center">
			2014 - Alvarez.is <a href="gallery.html#" class="go-top"> <i
				class="fa fa-angle-up"></i>
			</a>
		</div>
	</footer>
	<!--footer end-->

</section>

<!-- js placed at the end of the document so the pages load faster -->
<script
	src="${initParam.rootPath}/assets/js/fancybox/jquery.fancybox.js"></script>
<script src="${initParam.rootPath}/assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
	src="${initParam.rootPath}/assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${initParam.rootPath}/assets/js/jquery.scrollTo.min.js"></script>
<script src="${initParam.rootPath}/assets/js/jquery.nicescroll.js"
	type="text/javascript"></script>


<!--common script for all pages-->
<script src="${initParam.rootPath}/assets/js/common-scripts.js"></script>

<!--script for this page-->

<script type="text/javascript">
	$(function() {
		//    fancybox
		jQuery(".fancybox").fancybox();
		
	});
</script>

<script>
	//custom select box

	$(function() {
		$("select.styled").customSelect();
	});
</script>
</html>