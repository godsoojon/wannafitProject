<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
</head>
<body>
	<table width="650" border="3" align="center" bordercolor="gray">
		<tr height="30">
			<td colspan="3" align="center" bgcolor="blue"><font
				color="white">사진보기</font></td>
		</tr>
	</table>

	<c:choose>
		<c:when test="${fn:length(requestScope.contents)==0}">
		등록된 앨범이 없습니다.
	</c:when>
		<c:otherwise>
			<table style="width: 500px" border="1">
				<tr>
					<th>사진들</th>
				</tr>
				<c:forEach items="${requestScope.contents }" var="contentList">
					<tr>
						<td><a href="${initParam.rootPath}/reple/findReple.do?photoId=${contentList.photoId}"> ${contentList} </a></td>
					<tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>