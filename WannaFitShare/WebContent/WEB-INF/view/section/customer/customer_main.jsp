<%@ page contentType="text/html;charset=UTF-8"%>
<!-- <script type="text/javascript">
opener.location.reload();
self.close();
</script> -->
<section id="main-content">
	<section class="wrapper">
		<!-- JUSTIFIED BUTTONS -->
		<div class="showback">
			<h4>
				<i class="fa fa-angle-right"></i> Justified Buttons
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
		</div>
		<h3>
			<i class="fa fa-angle-right"></i> 고객 메인페이지
		</h3>
		<div class="row">

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
								<button class="btn btn-success btn-xs" >
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

	</section>
</section>