<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:hasBindErrors name="health" />
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
			<i class="fa fa-angle-right"></i> 건강정보
		</h3>

		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h4 class="mb">
						<i class="fa fa-angle-right"></i> 건강정보 수정
					</h4>
					<form class="form-horizontal style-form"
						action="${initParam.rootPath}/health/modifyHealth.do"
						method="post" id="regForm">
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">고객 ID</label>
							<div class="col-sm-10">
								${sessionScope.loginInfo.csId }<input type="hidden" name="csId"
									id="csId" value="${sessionScope.loginInfo.csId }"> <span
									class="errorMessage" id="idErrorMessage"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">몸무게</label>
							<div class="col-sm-10">
								<input type="number" class="form-control round-form"
									id="hWeight" name="hWeight"
									value="${requestScope.health.hWeight }"> <span
									class="help-block">몸무게를 입력해 주세요</span><br> <span
									class="errorMessage" id="idErrorMessage"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">키</label>
							<div class="col-sm-10">
								<input type="number" class="form-control round-form" id="hTall"
									name="hTall" value="${requestScope.health.hTall}"> <span
									class="help-block">키를 입력해 주세요.</span><br> <span
									class="errorMessage" id="idErrorMessage"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">혈액형</label>
							<div class="col-sm-10">

								<div class="radio">
									<label> <input type="radio" id="hBloodType"
										name="hBloodType" value="A">A 
								</div>
								<div class="radio">
									<label> <input type="radio" id="hBloodType"
										name="hBloodType" value="B">B 
								</div>
								<div class="radio">
									<label> <input type="radio" id="hBloodType"
										name="hBloodType" value="O">O 
								</div>
								<div class="radio">
									<label> <input type="radio" id="hBloodType"
										name="hBloodType" value="AB">AB 
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">혈압</label>
							<div class="col-sm-10">
								<input type="number" class="form-control round-form"
									id="hBloodPressure" name="hBloodPressure"> <span
									class="help-block"
									value="${requestScope.health.hBloodPressure}">혈압~~~~</span><br>
								<span class="errorMessage" id="idErrorMessage"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">bmi</label>
							<div class="col-sm-10">
								<input type="hidden" class="form-control round-form" name="bmi"
									id="bmi" value="${requestScope.health.hBmi}"> <span
									class="help-block">키와 몸무게 입력하면 자동 입력됩니다.</span><br> <span
									class="errorMessage" id="idErrorMessage"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">혈당</label>
							<div class="col-sm-10">
								<input type="number" class="form-control round-form"
									id="hBloodSugar" name="hBloodSugar"
									value="${requestScope.health.hBloodSugar}"> <span
									class="help-block">혈당을 입력하세요.</span><br> <span
									class="errorMessage" id="idErrorMessage"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">LDL</label>
							<div class="col-sm-10">
								<input type="number" class="form-control round-form" id="hLdl"
									name="hLdl" value="${requestScope.health.hLdl}"> <span
									class="help-block">low density lipoprotein의 약칭이며 비중
									1,019~1,063 사이의 분리되는 혈장지질단백질로, 콜레스테롤을 말초로 보내는 기능을 한다. LDL 농도가
									높으면 죽상동맥경화가 되기 쉽다. 간에서 합성된 콜레스테롤을 체조직으로 운반하는 역할을 한다.</span><br> <span
									class="errorMessage" id="idErrorMessage"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">HDH</label>
							<div class="col-sm-10">
								<input type="number" class="form-control round-form" id="hHdh"
									name="hHdh" value="${requestScope.health.hHdh}"> <span
									class="help-block">HDH</span><br> <span
									class="errorMessage" id="idErrorMessage"></span>
							</div>
						</div>
						<input type="submit" value="건강정보 수정"
							class="btn btn-round btn-success"> <input type="reset"
							value="초기화" class="btn btn-round btn-warning">
					</form>
				</div>
			</div>
		</div>
	</section>
</section>