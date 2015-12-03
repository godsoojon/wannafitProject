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
			<i class="fa fa-angle-right"></i> 회원정보 수정
		</h3>

		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h4 class="mb">
						<i class="fa fa-angle-right"></i> 회원정보 수정
					</h4>
					<form class="form-horizontal style-form"
						action="${initParam.rootPath}/customer/modify.do" method="post"
						id="modifyForm">
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">고객 ID</label>
							<div class="col-sm-10">
								${requestScope.customer.csId } <input type="hidden"
									class="form-control" name="csId" id="csId"
									value="${requestScope.customer.csId }">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">비밀번호</label>
							<div class="col-sm-10">
								<input type="password" class="form-control round-form"
									id="csPassword" name="csPassword"><span
									class="errorMessage"><form:errors
										path="customer.csPassword" delimiter=" | " /></span> <span
									class="help-block"> 비밀번호는 6글자 이상을 입력해 주세요</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">고객 이름</label>
							<div class="col-sm-10">
								<input type="text" id="csName" name="csName"
									value="${requestScope.customer.csName }"
									class="form-control round-form"><br> <span
									class="errorMessage"> <form:errors
										path="customer.csName" delimiter=" | " />
								</span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">고객 Email</label>
							<div class="col-sm-10">
								<input type="text" id="csEmail" name="csEmail"
									class="form-control round-form"
									value="${requestScope.customer.csEmail}"> <span
									class="errorMessage"><form:errors
										path="customer.csEmail" delimiter=" | " /></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">휴대폰 번호</label>
							<div class="col-sm-10">
								<input type="text" id="csPhone" name="csPhone"
									class="form-control round-form"
									value="${requestScope.customer.csPhone }"><span
									class="errorMessage"><form:errors
										path="customer.csPhone" delimiter=" | " /></span>
							</div>
						</div>
						<p>
							<input type="submit" value="수정" class="btn btn-round btn-success">
							<input type="reset" value="초기화" class="btn btn-round btn-warning">
					</form>
					<p>
				</div>
			</div>
		</div>
	</section>
</section>
