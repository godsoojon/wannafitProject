<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>사진 정보랑 리플</h2>
<c:choose>
		<table style="width: 500px" border="1">
					<tr>
						<td> 세션스콥에 있는 사진아이디로 사진출력</td>
					</tr>
		<c:if test="${fn:length(requestScope.repleList)==0 }">
	 댓글이 없습니다
		</c:if>
			<c:forEach items="${requestScope.repleList}" var="reple">	
					
						<td> ${reple.csId} : ${reple.repleContent}  </td>
				</c:forEach>
				<td><form action="" id="">
		 댓글을 등록 하세요 <input type ="text" id="reple"><br></td>
		 				</form>
				
			</table>
	
	</c:choose>


</body>
</html>