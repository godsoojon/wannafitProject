<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.Enumeration"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript"
	src="${initParam.rootPath }/script/formcheck.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#regForm").on("submit", registerFormCheck);
		$("#csId").on("keyup", function() {
			$.ajax({
				url : "${initParam.rootPath}/customer/idDuplicatedCheck.do", //요청 url
				type : "POST",
				data : {
					csId : $("#csId").val()
				},//요청파라미터   id=aaaaa
				dataType : "text",//응답 데이터 타입 - text(기본), json, jsonp, xml
				beforeSend : function() {
					//전송 전에 호출할 함수 등록
					if ($("#id").val() == "") {
						alert("조회할 ID를 입력하세요");
						return false;//false 리턴시 서버단으로 요청을 하지 않는다.
					}
				},
				success : function(txt) {
					if (txt == 'true') {//중복
						$("#idErrorMessage").text("이미 사용중인 ID입니다.");
						idDuplicated = true;
					} else {
						$("#idErrorMessage").text("사용가능한 ID입니다.");
						idDuplicated = false;
					}
				}
			});
		});
	});
</script>
<spring:hasBindErrors name="customer" />
<section id="main-content">
	<h3>
		<i class="fa fa-angle-right"></i> 회원 가입
	</h3>

	<!-- BASIC FORM ELELEMNTS -->
	<div class="row mt">
		<div class="col-lg-12">
			<div class="form-panel">
				<h4 class="mb">
					<i class="fa fa-angle-right"></i> 회원 가입
				</h4>
				<form class="form-horizontal style-form"
					action="${initParam.rootPath}/customer/add.do" method="post"
					id="regForm">
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">고객 ID</label>
						<div class="col-sm-10">
							<input type="text" id="csId" name="csId"
								class="form-control round-form"><span class="help-block">
								ID는 5글자 이상을 입력해 주세요</span><br> <span class="errorMessage"
								id="idErrorMessage"><form:errors path="customer.csId" /></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">비밀번호</label>
						<div class="col-sm-10">
							<input type="password" class="form-control round-form"
								id="csPassword" name="csPassword"><span
								class="errorMessage"><form:errors
									path="customer.csPassword" delimiter=" | " /></span> <br> <span
								class="help-block"> 비밀번호는 6글자 이상을 입력해 주세요</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">고객 이름</label>
						<div class="col-sm-10">
							<input type="text" id="csName" name="csName"
								value="${requestScope.customer.csName }"
								class="form-control round-form"><br> <span
								class="errorMessage"> <form:errors path="customer.csName"
									delimiter=" | " />
							</span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">고객 Email</label>
						<div class="col-sm-10">
							<input type="text" id="csEmail" name="csEmail"
								class="form-control round-form"
								value="${requestScope.customer.csEmail}"> <span
								class="errorMessage"><form:errors path="customer.csEmail"
									delimiter=" | " /></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">휴대폰 번호</label>
						<div class="col-sm-10">
							<input type="text" id="csPhone" name="csPhone"
								class="form-control round-form"
								value="${requestScope.customer.csPhone }"><span
								class="errorMessage"><form:errors path="customer.csPhone"
									delimiter=" | " /></span>
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
