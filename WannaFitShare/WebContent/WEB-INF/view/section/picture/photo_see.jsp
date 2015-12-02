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
					<td>
					${sessionScope.photo.photoContent}
					</td>
					<td>
					</td>
				</tr>	
				
				
				<c:if test="${requestScope.reple!='' ||requestScope.reple ne null}">
				<c:forEach items="${requestScope.repleList }" var="repleList">
					<tr>
					<th><h4>${repleList.csId}</h4>  </th>
					<td>${repleList.repleContent }
					
						<a href="${initParam.rootPath}/reple/updateReple.do?repleId=${repleList.repleId}">수정</a>
						<a href="${initParam.rootPath}/reple/deleteReple.do?repleId=${repleList.repleId}">삭제</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						</td>
						
						<td>${repleList.repleTime}</td>
						
					</tr>
				</c:forEach>
				</c:if>
				<tr>
				<th></th>
				       <td><form action="${initParam.rootPath}/reple/addReple.do">
				       <input type="text" id="repletxt" name="repletxt">
				       <input type="submit" value="댓글 달기">
				       </form></td>
					<td>
					</td>
				</tr>
					
						
			</table>
		
	

</body>
</html>