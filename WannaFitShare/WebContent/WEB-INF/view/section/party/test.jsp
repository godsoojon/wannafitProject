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
</head>

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


		<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
		<!--main content start-->
		<section class="wrapper site-min-height">
			<h3>
				<i class="fa fa-angle-right"></i>Gallery
			</h3>
			<a href="${initParam.rootPath}/album/logincheck/write.do"> 사진 올리기
			</a>
			<hr>
			<div class="row mt">
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
					<div class="project-wrapper">
						<div class="project">
							<div class="photo-wrapper">
								<div class="photo">
									<a class="fancybox"
										href="${initParam.rootPath}/assets/img/portfolio/port04.jpg"><img
										class="img-responsive"
										src="${initParam.rootPath}/assets/img/portfolio/port04.jpg"
										alt=""></a>
								</div>
								<div class="overlay"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- col-lg-4 -->

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
					<div class="project-wrapper">
						<div class="project">
							<div class="photo-wrapper">
								<div class="photo">
									<a class="fancybox"
										href="${initParam.rootPath}/assets/img/portfolio/port05.jpg"><img
										class="img-responsive"
										src="${initParam.rootPath}/assets/img/portfolio/port05.jpg"
										alt=""></a>
								</div>
								<div class="overlay"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- col-lg-4 -->

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
					<div class="project-wrapper">
						<div class="project">
							<div class="photo-wrapper">
								<div class="photo">
									<a class="fancybox"
										href="${initParam.rootPath}/assets/img/portfolio/port06.jpg"><img
										class="img-responsive"
										src="${initParam.rootPath}/assets/img/portfolio/port06.jpg"
										alt=""></a>
								</div>
								<div class="overlay"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- col-lg-4 -->
			</div>
			<!-- /row -->

			<div class="row mt">
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
					<div class="project-wrapper">
						<div class="project">
							<div class="photo-wrapper">
								<div class="photo">
									<a class="fancybox"
										href="${initParam.rootPath}/assets/img/portfolio/port01.jpg"><img
										class="img-responsive"
										src="${initParam.rootPath}/assets/img/portfolio/port01.jpg"
										alt=""></a>
								</div>
								<div class="overlay"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:choose>
				<c:when test="${fn:length(requestScope.listPhotoUpload)==0 }" />
				<c:otherwise>
					<c:forEach items="${requestScope.listPhotoUpload}" var="photoList">
						<div class="row mt">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
								<div class="project-wrapper">
									<div class="project">
										<div class="photo-wrapper">
											<div class="photo">
												<a class="fancybox" href="${photoList.photoContent}"><img
													class="img-responsive" ${photoList.photoContent}> </a>
											</div>
											<div class="overlay"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%-- <tr>

							<td><a
								href="${initParam.rootPath}/reple/findReple.do?photoId=${photoList.photoId}">${photoList.photoContent}</a><br>
								<a
								href="${initParam.rootPath}/album/logincheck/delete.do?deletephotoId=${photoList.photoId}">사진
									삭제 </a></td>

						</tr> --%>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</section>

		<!-- /MAIN CONTENT -->


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

<%-- <c:choose>
	<c:when test="${fn:length(requestScope.listPhotoUpload)==0 }">
		등록된 앨범이 없습니다.
	</c:when>
	<c:otherwise>
		<table style="width: 500px" border="1">
			<tr>
				<th>사진들</th>
			</tr>
			<c:forEach items="${requestScope.listPhotoUpload}" var="photoList">
				<tr>

					<td><a
						href="${initParam.rootPath}/reple/findReple.do?photoId=${photoList.photoId}">${photoList.photoContent}</a><br>
						<a
						href="${initParam.rootPath}/album/logincheck/delete.do?deletephotoId=${photoList.photoId}">사진
							삭제 </a></td>

				</tr>
			</c:forEach>
		</table>
	</c:otherwise>
</c:choose>
 --%>
