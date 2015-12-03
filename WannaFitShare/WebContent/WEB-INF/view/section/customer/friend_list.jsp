<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> 친구 찾기
		</h3>
		<div class="row">
			<div class="row mt">
				<div class="col-md-12">
					<div class="content-panel">
						<c:choose>
							<c:when test="${fn:length(requestScope.friendList)==0 }">
								등록된 고객이 없습니다.
							</c:when>
							<c:otherwise>
								<table class="table table-striped table-advance table-hover">
									<h4>
										<i class="fa fa-angle-right"></i> 고객님의 친구목록
									</h4>
									<hr>
									<thead>
										<tr>
											<th><i class="fa fa-bullhorn"></i> 고객 ID</th>
										</tr>
									</thead>
									<c:forEach items="${requestScope.friendList }" var="friendList">

										<tbody>
											<tr>

												<td>${friendList.friendId}</td>
												<td><a
													href="${initParam.rootPath}/friendController/deleteFriendList.do?friendId=${friendList.friendId}"><button
															class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button></a><a
													href="${initParam.rootPath}/friendController/deleteFriendList.do?friendId=${friendList.friendId}">삭제</a></td>
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
	</section>
	<! --/wrapper -->
</section>
<!-- /MAIN CONTENT -->