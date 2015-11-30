<%@ page contentType="text/html;charset=UTF-8"%>

<hr>
<ul class="nav nav-tabs">
	<li role="presentation" class="active"><a
		href="${initParam.rootPath}/partyController/logincheck/allParty.do">모든
			앨범 보기</a></li>
	<li role="presentation"><a
		href="${initParam.rootPath}/partyController/logincheck/belongParty.do">나의 앨범 목록</a></li>
	<li role="presentation"><a
		href="${initParam.rootPath}/partyController/logincheck/makeParty_form.do">앨범
			만들기</a></li>
</ul>
<h2>앨범 정보</h2>
<table border="1" style="width: 300px">
	<tr>
		<th>앨범 이름</th>
		<td>${requestScope.party.partyName }</td>
	</tr>
	<tr>

		<th>앨범 만든이</th>

		<td>${requestScope.party.csId}</td>
	</tr>
	<tr>
		<th>앨범 권한</th>
		<td>${requestScope.party.partyRight }</td>
	</tr>
	<tr>
		<th>앨범 생성일</th>
		<td>${requestScope.party.partyDate }</td>
	</tr>

</table>
<a
	href="${initParam.rootPath}/partyController/joinParty.do?partyName=${requestScope.party.partyName }&csId=${requestScope.party.csId}&partyRight=${requestScope.party.partyRight }">
	앨범보기</a>
