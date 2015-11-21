<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form name="form" method="post">
	<table border="1" style="width: 1000px">
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<c:forEach items="${requestScope.row1 }" var="Integer">
			<td>${Integer }<input name="button" type="button" value="입력"
				onClick="javascript:window.open('/WannaFitShare/admin.jsp','new','width=200,height=200,menubar=no,toolbar=no,scrollbars=no,statusbar=no, status=no')">
			</td>

		</c:forEach>
		<tr>
			<c:forEach items="${requestScope.row2 }" var="Integer">
				<td>${Integer }<input name="button" type="button" value="입력"
					onClick="javascript:window.open('/WannaFitShare/admin.jsp','new','width=200,height=200,menubar=no,toolbar=no,scrollbars=no,statusbar=no, status=no')">
				</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${requestScope.row3 }" var="Integer">
				<td>${Integer }<input name="button" type="button" value="입력"
					onClick="javascript:window.open('/WannaFitShare/admin.jsp','new','width=200,height=200,menubar=no,toolbar=no,scrollbars=no,statusbar=no, status=no')">
				</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${requestScope.row4 }" var="Integer">
				<td>${Integer }<input name="button" type="button" value="입력"
					onClick="javascript:window.open('/WannaFitShare/admin.jsp','new','width=200,height=200,menubar=no,toolbar=no,scrollbars=no,statusbar=no, status=no')">
				</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${requestScope.row5 }" var="Integer">
				<td>${Integer }<input name="button" type="button" value="입력"
					onClick="javascript:window.open('/WannaFitShare/admin.jsp','new','width=200,height=200,menubar=no,toolbar=no,scrollbars=no,statusbar=no, status=no')">
				</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${requestScope.row6 }" var="Integer">
				<td>${Integer }<input name="button" type="button" value="입력"
					onClick="javascript:window.open('/WannaFitShare/admin.jsp','new','width=200,height=200,menubar=no,toolbar=no,scrollbars=no,statusbar=no, status=no')">
				</td>
			</c:forEach>
		</tr>
	</table>
</form>