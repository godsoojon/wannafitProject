<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div id="layer"></div>
<h2>건강 정보 수정</h2>
<spring:hasBindErrors name="health" />
<form action="${initParam.rootPath}/health/modifyHealth.do"
	method="post" id="regForm">
	<!-- 요청 처리할 Controller에 대한 구분값 -->
	<table border="1" style="width: 500px">
		<tr>
			<th>고객 ID</th>

			<td>${sessionScope.loginInfo.csId }<input type="hidden"
				name="csId" id="csId" value="${requestScope.health.csId }">
				<span class="errorMessage" id="idErrorMessage"></span></td>
		</tr>
		<tr>
			<th>몸무게</th>
			<td><input type="text" id="hWeight" name="hWeight"
				value="${requestScope.health.hWeight }" size="25"> <span
				class="errorMessage"></span></td>
		</tr>
		<tr>
			<th>키</th>
			<td><input type="text" id="hTall" name="hTall" size="25"
				value="${requestScope.health.hTall}"> <span
				class="errorMessage"></span></td>
		</tr>
		<tr>
			<th>혈액형</th>
			<td>${requestScope.health.hBloodType } A<input type="radio"
				id="hBloodType" name="hBloodType" value="A" size="25"> B<input
				type="radio" id="hBloodType" name="hBloodType" value="B" size="25">
				AB<input type="radio" id="hBloodType" name="hBloodType" value="AB"
				size="25"> O<input type="radio" id="hBloodType"
				name="hBloodType" value="O" size="25"> <span
				class="errorMessage"></span></td>
		</tr>
		<tr>
			<th>혈압</th>
			<td><input type="text" id="hBloodPressure" name="hBloodPressure"
				size="25" value="${requestScope.health.hBloodPressure}"> <span
				class="errorMessage"></span></td>
		</tr>
		<tr>
			<th>bmi</th>
			<td><input type="text" id="hBmi" name="hBmi" size="25"
				value="${requestScope.health.hBmi}"> <span
				class="errorMessage"></span></td>
		</tr>
		<tr>
			<th>혈당</th>
			<td><input type="text" id="hBloodSugar" name="hBloodSugar"
				size="25" value="${requestScope.health.hBloodSugar}"> <span
				class="errorMessage"></span></td>
		</tr>
		<tr>
			<th>LDL</th>
			<td><input type="text" id="hLdl" name="hLdl" size="25"
				value="${requestScope.health.hLdl}"> <span
				class="errorMessage"></span></td>
		</tr>
		<tr>
			<th>HDH</th>
			<td><input type="text" id="hHdh" name="hHdh" size="25"
				value="${requestScope.health.hHdh}"> <span
				class="errorMessage"></span></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="건강정보 등록"> <input
				type="reset" value="초기화"></td>
		</tr>
	</table>
</form>