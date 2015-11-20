<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<h2>고객님의 친구목록입니다.</h2>
<c:choose>
	<c:when test="${fn:length(requestScope.list)==0 }">
		등록된 고객이 없습니다.
	</c:when>
	<c:otherwise>
		<table style="width:500px" border="1">
			<tr>
				<th>friend_key</th>
				<th>친구 Id</th>
			</tr>
			<c:forEach items="${requestScope.list }" var="friendList">
			<tr>
				<td>${friendList.flKey}</td>
				<td>${friendList.friendId}</td>
				
			<tr>
			</c:forEach>
		</table>
	</c:otherwise>
</c:choose>