<%@ page contentType="text/html;charset=UTF-8"%>
고객님의 건강정보를 등록했습니다.<br>
등록한 정보는 다음과 같습니다.<br>
<table border="1" style="width:300px">
	<tr>
		<th>고객 ID</th>
		<td>${requestScope.health.csId }</td>
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

<a href ="${initParam.rootPath}/health/healthModify.do">건강 정보 수정</a>