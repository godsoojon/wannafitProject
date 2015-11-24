<%@ page contentType="text/html;charset=UTF-8" %>
<h2>조회한 고객정보</h2>
<table border="1" style="width:300px">
	<tr>
		<th>앨범 이름</th>
		<td>${requestScope.party.partyName }</td>
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
