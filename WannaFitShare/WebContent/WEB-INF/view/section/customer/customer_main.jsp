<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- <script type="text/javascript">
opener.location.reload();
self.close();
</script> -->


<!--main content start-->
<section id="main-content">
	<section class="wrapper">

		<div class="row">
			<div class="col-lg-9 main-chart">
				<h4>
					<i class="fa fa-angle-right"></i> 회원 메뉴
				</h4>
				<div class="btn-group btn-group-justified">
					<div class="btn-group">
						<a href="${initParam.rootPath}/health/logincheck/healthForm.do"><button
								type="button" class="btn btn-theme">건강정보</button></a>
					</div>
					<div class="btn-group">
						<a href="${initParam.rootPath}/customer/logincheck/modifyForm.do"><button
								type="button" class="btn btn-theme">회원정보수정</button></a>
					</div>
					<div class="btn-group">
						<a
							href="${initParam.rootPath}/loginController/logincheck/logout.do"><button
								type="button" class="btn btn-theme">로그아웃</button></a>
					</div>
					<div class="btn-group">
						<a href="${initParam.rootPath}/customer/logincheck/remove.do"><button
								type="button" class="btn btn-theme">회원탈퇴</button></a>
					</div>
				</div>
				<h3>
					<i class="fa fa-angle-right"></i> 고객 메인페이지
				</h3>
				<div class="col-md-12">
					<div class="content-panel">
						<h4>
							<i class="fa fa-angle-right"></i> 고객 정보
						</h4>
						<hr>
						<table class="table table-hover">
							<tr>
								<th>ID</th>
								<td>${sessionScope.loginInfo.csId}</td>
								<td>
									<button class="btn btn-success btn-xs">
										<i class="fa fa-check"></i>
									</button>
									<button class="btn btn-primary btn-xs">
										<i class="fa fa-pencil"></i>
									</button>
									<button class="btn btn-danger btn-xs">
										<i class="fa fa-trash-o "></i>
									</button>
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>${sessionScope.loginInfo.csName }</td>
							</tr>
							<tr>
								<th>e-mail</th>
								<td>${sessionScope.loginInfo.csEmail }</td>
							</tr>
							<tr>
								<th>휴대폰</th>
								<td>${sessionScope.loginInfo.csPhone }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->

			<div class="col-lg-3 ds">
				<!-- USERS ONLINE SECTION -->
				<h3>친구 목록</h3>
				<!-- First Member -->
				<c:choose>
					<c:when test="${fn:length(sessionScope.seionFriendList)==0 }">
     				 등록된 고객이 없습니다.
   				</c:when>
					<c:otherwise>

						<c:forEach items="${sessionScope.seionFriendList }"
							var="friendList">

							<div class="desc">
								<div class="thumb">
									<img class="img-circle" src="assets/img/ui-divya.jpg"
										width="35px" height="35px" align="">
								</div>
								<div class="details">
									<p>
										<a href="#">${friendList.friendId}</a><br />
									</p>
								</div>
							</div>
						</c:forEach>

					</c:otherwise>
				</c:choose>
				<!-- CALENDAR-->
				<div id="calendar" class="mb">
					<div class="panel green-panel no-margin">
						<div class="panel-body">
							<div id="date-popover" class="popover top"
								style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
								<div class="arrow"></div>
								<h3 class="popover-title" style="disadding: none;"></h3>
								<div id="date-popover-content" class="popover-content"></div>
							</div>
							<div id="my-calendar"></div>
						</div>
					</div>
				</div>
				<!-- / calendar -->
			</div>
			<!-- /col-lg-3 -->
		</div>
	</section>
</section>