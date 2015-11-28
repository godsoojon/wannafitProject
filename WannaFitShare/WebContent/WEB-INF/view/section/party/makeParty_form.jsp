<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript"
	src="${initParam.rootPath }/script/formcheck.js"></script>

<h2>앨범만들기</h2>

<spring:hasBindErrors name="party" />
<form
	action="${initParam.rootPath}/partyController/logincheck/addParty.do"
	method="post" name="partyFrom" onsubmit="return checkRadio();">
	<table border="1" style="width: 500px">
		<tr>
			<th>이름</th>
			<td><input type="text" id="partyName" name="partyName" size="25">
				<span class="errorMessage" id="idErrorMessage"> <form:errors
						path="party.partyName" /></span></td>
		</tr>
		<tr>
			<th>권한</th>
			<td><label>나만보기<input type="radio" name="partyRight"
					value="1" size="25" /></label> <label>친구만 보기<input type="radio"
					name="partyRight" value="2" size="25" /></label> <label>모두 보기<input
					type="radio" name="partyRight" value="3" size="25" /></label> <span
				class="errorMessage" id="idErrorMessage"> <form:errors
						path="party.partyRight" /></span></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="앨범만들기"> <input
				type="reset" value="초기화"></td>
		</tr>
	</table>
</form>
