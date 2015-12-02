<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<hr>
<ul class="nav nav-tabs">
	<li role="presentation" class="active"><a
		href="${initParam.rootPath}/partyController/logincheck/allParty.do">모든
			앨범 보기</a></li>
	<li role="presentation"><a
		href="${initParam.rootPath}/partyController/logincheck/belongParty.do">나의
			앨범 목록</a></li>
	<li role="presentation"><a
		href="${initParam.rootPath}/partyController/logincheck/makeParty_form.do">앨범
			만들기</a></li>
</ul>

<h2>모든 앨범 목록</h2>
<c:choose>
	<c:when test="${fn:length(requestScope.list)==0 }">
		등록된 앨범이 없습니다.
	</c:when>
	<c:otherwise>
		<table style="width: 500px" class="table table-hover">
			<tr>
				<th>앨범 이름</th>
			</tr>
			<c:forEach items="${requestScope.list }" var="partyList">
				<tr>
					<td style="color: darkblue">${partyList.partyName}<br> <c:choose>
							<c:when test="${partyList.partyRight == 1}">(나만 보기)</c:when>
							<c:when test="${partyList.partyRight == 2}">(친구만 보기)</c:when>
							<c:when test="${partyList.partyRight == 3}">(모두 보기)</c:when>
						</c:choose>
					</td>
					<td><a
						href="${initParam.rootPath}/partyController/joinParty.do?${initParam.rootPath}/partyController/joinParty.do?partyName=${partyList.partyName }&csId=${partyList.csId}&partyRight=${partyList.partyRight }">
							<button class="btn btn-info">보러가기</button>
					</a></td>
					<td><a
						href="${initParam.rootPath}/partyController/goParty.do?partyName=${partyList.partyName}">
							<button class="btn btn-warning">정보보기</button>
					</a></td>
				<tr>
			</c:forEach>
		</table>
	</c:otherwise>
</c:choose>