<%@ page contentType="text/html;charset=UTF-8"%>

<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> 친구 찾기
		</h3>

		<div class="row mt">
			<div class="col-md-12">
				<div class="content-panel">
					<table class="table table-striped table-advance table-hover">
						<h4>
							<i class="fa fa-angle-right"></i> 친구 정보
						</h4>
						<hr>
						<thead>
							<tr>
								<th><i class="fa fa-bullhorn"></i> 고객 ID</th>
								<th class="hidden-phone"><i class="fa fa-question-circle"></i>
									고객 이름</th>
								<th><i class="fa fa-bookmark"></i> 고객 Email</th>
								<th><i class=" fa fa-edit"></i> 고객 번호</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${requestScope.customer.csId }</td>
								<td class="hidden-phone">${requestScope.customer.csName }</td>
								<td>${requestScope.customer.csEmail }</td>
								<td>${requestScope.customer.csPhone}</td>
								<td><a
									href="${initParam.rootPath}/friendController/addFriendList.do?friendId=${requestScope.customer.csId}&friendPicture=${requestScope.customer.csPicture}"><button
											class="btn btn-success btn-xs">
											<i class="fa fa-check"></i>
										</button></a></td>
							</tr>
						</tbody>
					</table>
					<a
						href="${initParam.rootPath}/friendController/addFriendList.do?friendId=${requestScope.customer.csId}&friendPicture=${requestScope.customer.csPicture}">
						<button type="button" class="btn btn-round btn-success">친구
							등록</button>
					</a>
				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-md-12 -->
		</div>
		<!-- /row -->
	</section>
</section>
<!-- /MAIN CONTENT -->