<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<h2>앨범 보기</h2>

<a href="${initParam.rootPath}/album/logincheck/write.do"> 사진 올리기 </a><p>

<c:choose>
		<c:when test="${fn:length(requestScope.listPhotoUpload)==0 }">
		등록된 앨범이 없습니다.
	</c:when>
		<c:otherwise>
			<table style="width: 500px" border="1">
				<tr>
					<th>사진들</th>
				</tr>
				<c:forEach items="${requestScope.listPhotoUpload}" var="photoList">
					<tr>
						<td>${photoList.photoContent}<br>
						<a href="${initParam.rootPath}/album/logincheck/delete.do?deletephotoId=${photoList.photoId}">사진 삭제 </a>
						</td>
					<tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>