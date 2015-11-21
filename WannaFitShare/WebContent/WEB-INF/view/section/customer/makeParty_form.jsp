<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${initParam.rootPath }/script/formcheck.js"></script>

<div id="layer"></div>
<h2>고객등록</h2>
<spring:hasBindErrors name="group"/>
<form action="${initParam.rootPath}/partyController/logincheck/addParty.do" method="post" id="regForm">
<table border="1" style="width:500px">
	<tr>
		<th>이름</th>
		<td><input type="text" id="partyName" name="partyName" size="25"></td>
	</tr>
	<tr>
		<th>권한</th>
		<td><input type="number" id="partyRight" name="partyRight" size="25"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="앨범만들기"> <input type="reset" value="초기화">
		</td>
	</tr>
</table>
</form>
