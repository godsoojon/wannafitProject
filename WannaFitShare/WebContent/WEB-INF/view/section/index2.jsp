<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<spring:hasBindErrors name="customer" />

<form class="form-horizontal"
	action="${initParam.rootPath}/loginController/login.do" method="post">
	<div class="control-group">
		<label class="control-label" for="inputEmail">ID</label>
		<div class="controls">
			<input type="text" id="csId" name="csId" placeholder="ID를 입력하세요">
			<span class="errorMessage"><form:errors path="customer.csId"
					delimiter=" | " /></span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputPassword">P/W</label>
		<div class="controls">
			<input type="password" id="csPassword" name="csPassword"
				placeholder="비밀번호를 입력하세요"> <span class="errorMessage"><form:errors
					path="customer.csPassword" delimiter=" | " /></span>
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<br>
			<button class="btn btn-success" type="submit" class="btn">로그인</button>
		</div>
	</div>
</form>


<br>
<a class="btn btn-info"
	href="${initParam.rootPath}/customer/register_form.do"> <b>회원가입</b>
</a>
<br>




