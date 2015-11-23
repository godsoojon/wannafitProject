<%@ page contentType="text/html;charset=UTF-8" %>
<h2>앨범 정보</h2>
<table border="1" style="width:300px">
	<tr>
		<th>앨범 이름</th>
		<td>${requestScope.party.partyName }</td>
	</tr>
	<tr>
		<th>앨범 관리자</th>
		<td>${requestScope.party.partyManager}</td>
	</tr>
	<tr>
		<th>앨범 권한</th>
		<td>${requestScope.party.partyRight }</td>
	</tr>
	<tr>
		<th>앨범 생성일</th>
		<td>${requestScope.party.partyDate }</td>
	</tr>
	<tr>
		<th>앨범 맴버수</th>
		<td>${requestScope.party.partyMember}</td>
	</tr>
</table>
	<a href="${initParam.rootPath}/partyController/joinParty.do?partyName=${requestScope.party.partyName }">가입하기</a>