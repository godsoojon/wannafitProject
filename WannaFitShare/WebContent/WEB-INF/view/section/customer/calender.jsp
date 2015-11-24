<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script language="JavaScript">
function open_pop(arg1, arg2, arg3){
	var url = '/WannaFitShare/calendarPop.jsp?year='+arg1+'&month='+arg2+'&day='+arg3;
	window.open(url,'new','width=500,height=500,menubar=no,toolbar=no,scrollbars=no,statusbar=no, status=no');
}
function pre_year(root,arg1,arg2){
	var url = root+'/customer/calender.do?year'+arg1+'&month='+arg2+'&day=1';
	window.open(url,'new','width=500,height=500,menubar=no,toolbar=no,scrollbars=no,statusbar=no, status=no');
}
</script>
<form name="form" method="post">
	<table border="0" style="width: 1000px">
	<tr>
		<th><a href="${initParam.rootPath}/customer/calender.do?mode=1&year=${requestScope.year }&month=${requestScope.month }&day=1">이전년도</a></th>
		<th><font size="6">${requestScope.year }</font></th>
		<th><a href="${initParam.rootPath}/customer/calender.do?mode=2&year=${requestScope.year }&month=${requestScope.month }&day=1">이후년도</a></th>
	</tr>
	</table>
	<table border="0" style="width: 1000px">
	<tr>
		<th><a href="${initParam.rootPath}/customer/calender.do?mode=3&year=${requestScope.year }&month=${requestScope.month }&day=1">이전달</a></th>
		<th><font size="6">${requestScope.month }</font></th>
		<th><a href="${initParam.rootPath}/customer/calender.do?mode=4&year=${requestScope.year }&month=${requestScope.month }&day=1">이후달</a></th>
	</tr>
	</table>
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
		<c:forEach items="${requestScope.row1 }" var="String">
			<td>${String }<br><c:choose>
					<c:when test='${String=="" }'></c:when>
					<c:otherwise>
						<input name=${String } type="button" value="입력" onClick='open_pop(${requestScope.year },${requestScope.month },${String })'>
					</c:otherwise>
				</c:choose></td>
		</c:forEach>
		<tr>
			<c:forEach items="${requestScope.row2 }" var="String">
				<td>${String }<br><c:choose>
					<c:when test='${String=="" }'></c:when>
					<c:otherwise>
						<input name=${String } type="button" value="입력" onClick='open_pop(${requestScope.year },${requestScope.month },${String })'>
					</c:otherwise>
				</c:choose></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${requestScope.row3 }" var="String">
				<td>${String }<br><c:choose>
					<c:when test='${String=="" }'></c:when>
					<c:otherwise>
						<input name=${String } type="button" value="입력" onClick='open_pop(${requestScope.year },${requestScope.month },${String })'>
					</c:otherwise>
				</c:choose></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${requestScope.row4 }" var="String">
				<td>${String }<br><c:choose>
					<c:when test='${String=="" }'></c:when>
					<c:otherwise>
						<input name=${String } type="button" value="입력" onClick='open_pop(${requestScope.year },${requestScope.month },${String })'>
					</c:otherwise>
				</c:choose></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${requestScope.row5 }" var="String">
				<td>${String }<br><c:choose>
					<c:when test='${String=="" }'></c:when>
					<c:otherwise>
						<input name=${String } type="button" value="입력" onClick='open_pop(${requestScope.year },${requestScope.month },${String })'>
					</c:otherwise>
				</c:choose></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${requestScope.row6 }" var="String">
				<td>${String }<br><c:choose>
					<c:when test='${String=="" }'></c:when>
					<c:otherwise>
						<input name=${String } type="button" value="입력" onClick='open_pop(${requestScope.year },${requestScope.month },${String })'>
					</c:otherwise>
				</c:choose></td>
			</c:forEach>
		</tr>
	</table>
</form>