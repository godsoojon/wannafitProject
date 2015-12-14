<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript"
	src="${initParam.rootPath }/script/formcheck.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#modifyForm").on("submit", modifyFormCheck);
	});
</script>
<spring:hasBindErrors name="customer" />
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
			<i class="fa fa-angle-right"></i> 회원 탈퇴
		</h3>

		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h4 class="mb">
						<i class="fa fa-angle-right"></i> 탈퇴 확인
					</h4>
					<form class="form-horizontal style-form"
						action="${initParam.rootPath}/customer/logincheck/remove.do"
						method="post" id="modifyForm">
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">고객 ID</label>
							<div class="col-sm-10">
								${sessionScope.loginInfo.csId } <input type="hidden"
									class="form-control" name="csId" id="csId"
									value="${sessionScope.loginInfo.csId }">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">비밀번호</label>
							<div class="col-sm-10">
								<input type="password" class="form-control round-form"
									id="csPassword" name="csPassword"><span
									class="errorMessage"><form:errors
										path="customer.csPassword" delimiter=" | " /></span>
							</div>
						</div>

						<p>
							<input type="submit" value="탈퇴" class="btn btn-round btn-success">
					</form>
					<p>
				</div>
			</div>
		</div>
	</section>
</section>
