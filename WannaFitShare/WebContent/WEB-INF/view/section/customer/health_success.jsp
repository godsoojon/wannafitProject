<%@ page contentType="text/html;charset=UTF-8"%>

<section id="main-content">
	<section class="wrapper">
		<div class="showback">
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
		</div>
		<h3>
			<i class="fa fa-angle-right"></i> 고객 건강정보
		</h3>
		<div class="row">

			<div class="col-md-12">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i> 건강 정보
					</h4>
					<hr>
					<table class="table table-hover">
						<tr>
							<th>ID</th>
							<td>${requestScope.health.csId }</td>
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
							<th>몸무게</th>
							<td>${requestScope.health.hWeight }</td>
						</tr>
						<tr>
							<th>키</th>
							<td>${requestScope.health.hTall }</td>
						</tr>
						<tr>
							<th>혈액형</th>
							<td>${requestScope.health.hBloodType }</td>
						</tr>
						<tr>
							<th>혈압</th>
							<td>${requestScope.health.hBloodPressure}</td>
						</tr>
						<tr>
							<th>BMI</th>
							<td>${requestScope.health.hBmi}</td>
						</tr>
						<tr>
							<th>혈당</th>
							<td>${requestScope.health.hBloodSugar}</td>
						</tr>
						<tr>
							<th>LDL</th>
							<td>${requestScope.health.hLdl}</td>
						</tr>
						<tr>
							<th>HDH</th>
							<td>${requestScope.health.hHdh}</td>
						</tr>
					</table>
				</div>
			</div>


		</div>
		<a href="${initParam.rootPath}/health/healthModify.do"><button
				class="btn btn-info">건강 정보 수정</button></a>
	</section>
</section>

