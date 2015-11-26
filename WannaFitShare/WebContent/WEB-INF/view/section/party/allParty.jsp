<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<h2>모든 앨범 목록</h2>
<c:choose>
	<c:when test="${fn:length(requestScope.list)==0 }">
		등록된 앨범이 없습니다.
	</c:when>
	<c:otherwise>
		<table style="width: 500px" border="1" class="table">
			<tr>
				<th>앨범 이름</th>
			</tr>
			<c:forEach items="${requestScope.list }" var="partyList">
				<tr>
					<td><a href="${initParam.rootPath}/partyController/findParty.do?partyName=${partyList}"> ${partyList} </a></td>
				<tr>
			</c:forEach>
		</table>
	</c:otherwise>
</c:choose>