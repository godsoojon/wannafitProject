<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

.thumbnail img {
	width: 100%;
	height: 100%;
	margin-bottom: 10px;
}
</style>

<section id="main-content">
	<section class="wrapper">

		<%-- <ul class="nav nav-tabs">
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
 --%>

		<!--main content start-->

		<h3>
			<i class="fa fa-angle-right"></i> Health Blog
		</h3>

		<div class="row">

			<div class="row mt">
				<div class="col-md-12">
					<div class="content-panel">
						<table class="table table-striped table-advance table-hover">

							<thead>
								<tr>
									<th><i class="fa fa-bullhorn"></i>분류</th>
									<th class="hidden-phone"><i class="fa fa-question-circle"></i>
										글 제목</th>
									<th><i class="fa fa-bookmark"></i> 글쓴이</th>
									<th><i class=" fa fa-edit"></i> 날짜</th>
									<th><a
										href="${initParam.rootPath}/album/logincheck/write.do">
											글쓰기</a></th>
								</tr>
							</thead>
							<c:choose>
								<c:when test="${fn:length(requestScope.listPhotoUpload1)==0 }">
									<!-- 		등록된 앨범이 없습니다. -->
								</c:when>
								<c:otherwise>
									<c:forEach items="${requestScope.listPhotoUpload1}"
										var="photoList">

										<tbody>
											<tr>
												<td>${photoList.partyName }</td>
												<td class="hidden-phone"><a
													href="${initParam.rootPath}/reple/findReple.do?photoId=${photoList.photoId}">${photoList.photoTitle}</a></td>
												<td>${photoList.csId}</td>
												<td>${photoList.photoTime}</td>
												<td><a
													href="${initParam.rootPath}/album/logincheck/delete1.do?deletephotoId=${photoList.photoId}">
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
												</a></td>
											</tr>
										</tbody>
									</c:forEach>
						</table>
						</c:otherwise>
						</c:choose>
					</div>
					<!-- /content-panel -->
				</div>
				<!-- /col-md-12 -->
			</div>
			<!-- /row -->
		</div>
	</section>
</section>
<!-- /MAIN CONTENT -->


<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
	var myCenter = new google.maps.LatLng(37.401936, 127.106250);

	function initialize() {
		var mapProp = {
			center : myCenter,
			zoom : 12,
			scrollwheel : false,
			draggable : false,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};

		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);

		var marker = new google.maps.Marker({
			position : myCenter,
		});

		marker.setMap(map);
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>







<%-- 		<section class="wrapper site-min-height">
			<div class="container-fluid text-center bg-grey">
				<h3>Health Blog</h3>
				<h4>
					<a href="${initParam.rootPath}/album/logincheck/write.do"> 글쓰기
					</a>
				</h4>
				<br>
				<div class="row text-center">
					<c:choose>
						<c:when test="${fn:length(requestScope.listPhotoUpload1)==0 }">
							<!-- 		등록된 앨범이 없습니다. -->
						</c:when>
						<c:otherwise>
							<c:forEach items="${requestScope.listPhotoUpload1}"
								var="photoList">
								<!-- <div class="col-sm-4">
								<div class="thumbnail"> -->
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
									<div class="project-wrapper">
										<div class="project">
											<div class="photo-wrapper">
												<a
													href="${initParam.rootPath}/reple/findReple.do?photoId=${photoList.photoId}">${photoList.photoContent}</a>
												<p>
													<strong>${photoList.photoTitle}</strong>
												</p>
												<a
													href="${initParam.rootPath}/album/logincheck/delete1.do?deletephotoId=${photoList.photoId}">사진
													삭제 </a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>





			<!-- Set height and width with CSS -->
			<!-- <div id="googleMap" style="height:400px;width:100%;"></div> Add Google Maps -->
		</section>
	</section>
</section> --%>