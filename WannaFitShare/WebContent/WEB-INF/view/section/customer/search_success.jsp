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
							<c:when test="${fn:length(requestScope.namelist)==0 }">
								등록된 고객이 없습니다.
							</c:when>
							<c:otherwise>
								<table class="table table-striped table-advance table-hover">
									<h4>
										<i class="fa fa-angle-right"></i> 검색 친구 목록
									</h4>
									<hr>
									<thead>
										<tr>
											<th><i class="fa fa-bullhorn"></i> 고객 ID</th>
											<th class="hidden-phone"><i
												class="fa fa-question-circle"></i> 고객 이름</th>
											<th><i class="fa fa-bookmark"></i> 이메일주소</th>
											<th><i class=" fa fa-edit"></i> 전화번호</th>
											<th></th>
										</tr>
									</thead>
									<c:forEach items="${requestScope.namelist }" var="customer">

										<tbody>
											<tr>
												<td><a
													href="${initParam.rootPath}/friendController/findById.do?csId=${customer.csId }">${customer.csId }</a></td>
												<td class="hidden-phone"><span
													class="label label-info label-mini">${customer.csName}</span></td>
												<td>${customer.csEmail}</td>
												<td>${customer.csPhone}</td>
												<td><a
													href="${initParam.rootPath}/friendController/findById.do?csId=${customer.csId }">
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
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
	</section>
	<! --/wrapper -->
</section>
<!-- /MAIN CONTENT -->