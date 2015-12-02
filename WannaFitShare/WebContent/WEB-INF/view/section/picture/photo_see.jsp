<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="650" border="3" align="center" bordercolor="gray">
		<tr height="30">
			<td colspan="3" align="center" bgcolor="blue"><font
				color="white">사진보기</font></td>
		</tr>
	</table>


	
	
			<table style="width: 500px" border="1">
				<tr>
					<th>사진들</th>
					<td>사진 뿌리는 곳 세션에 사진 정보 있어야함. 이페이지에오는 컨트롤러에서
					세션에 정보 담아줘야함
					${sessionScope.photo.photoContent}
					</td>
				</tr>	
				
				
				<c:if test="${requestScope.reple!='' ||requestScope.reple ne null}">
				<c:forEach items="${requestScope.repleList }" var="repleList">
					<tr>
					<th>댓글 쓴사람 id :${repleList.csId}  </th>
							<td>${repleList.repleContent }
					
						<a href="${initParam.rootPath}/reple/updateReple.do?repleId=${repleList.repleId}">수정</a>
						<a href="${initParam.rootPath}/reple/deleteReple.do?repleId=${repleList.repleId}">삭제</a>
						</td>
					</tr>
				</c:forEach>
				</c:if>
				<tr>
				<th></th>
				       <td><form action="${initParam.rootPath}/reple/addReple.do">
				       <input type="text" id="repletxt" name="repletxt">
				       <input type="submit" value="전송">
				       </form></td>
				
				</tr>
					
						
			</table>
		
	

</body>
</html>