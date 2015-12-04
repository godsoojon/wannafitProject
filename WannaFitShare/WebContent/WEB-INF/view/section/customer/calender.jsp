<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script language="JavaScript">
function open_pop(arg1, arg2, arg3, arg4){
	//var url = '/WannaFitShare/calendarPop.jsp?year='+arg1+'&month='+arg2+'&day='+arg3+'&csId='+arg4;
	var url = '/WannaFitShare/CalorieCalendarController/printcal.do?year='+arg1+'&month='+arg2+'&day='+arg3+'&csId='+arg4;
	window.open(url,'new','width=500,height=500,menubar=no,toolbar=no,scrollbars=no,statusbar=no, status=no');
}
</script>

<style type="text/css">
table { background: #e6e6e6; border:1px #F000000 solid;}  
caption {display:none;} 
td { background:#FFFFFF; height:25px; border:1px #F000000 solid;} 
th { background:#f8f5ee; color:#CC723D; border:1px #F000000 solid;} 
button { background: #fff; border:1px #fff solid; width: 130px; height:50px;}
</style>


<section id="main-content">
	<section class="wrapper">
	
<form name="form" method="post">
<center><font size="6" color="brown">${requestScope.csId }님의 CalorieCalendar</font></center>
	<table border="1" style="width: 1000px">
	<tr>
		<th><a href="${initParam.rootPath}/customer/logincheck/calender.do?mode=1&year=${requestScope.year }&month=${requestScope.month }&day=1"><font color="#47C83E">이전년도</font></a></th>
		<th><table border="1" style="width: 200px"><font size="6">${requestScope.year }</font></table></th>
		<th><a href="${initParam.rootPath}/customer/logincheck/calender.do?mode=2&year=${requestScope.year }&month=${requestScope.month }&day=1"><font color="#47C83E">이후년도</font></a></th>
	</tr>
	</table>
	<table border="1" style="width: 1000px">
	<tr>
		<th><a href="${initParam.rootPath}/customer/logincheck/calender.do?mode=3&year=${requestScope.year }&month=${requestScope.month }&day=1"><font color="#47C83E">이전달</font></a></th>
		<th><table border="1" style="width: 155px"><font size="6">${requestScope.month }</font></table></th>
		<th><a href="${initParam.rootPath}/customer/logincheck/calender.do?mode=4&year=${requestScope.year }&month=${requestScope.month }&day=1"><font color="#47C83E">이후달</font></a></th>
	</tr>
	</table>
	<table border="1" style="width: 1000px">
		<tr>
			<th><font color="red">일</font></th>
			<th><font color="black">월</font></th>
			<th><font color="black">화</font></th>
			<th><font color="black">수</font></th>
			<th><font color="black">목</font></th>
			<th><font color="black">금</font></th>
			<th><font color="blue">토</font></th>
		</tr>
		<c:forEach items="${requestScope.row1 }" var="String">
			<td><button name=${String } type="button" value="입력" onClick='open_pop(${requestScope.year },${requestScope.month },${String },"${requestScope.csId }")'>${String }<br><c:choose>
					<c:when test='${String=="" }'></c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose></button></td>
		</c:forEach>
		<tr>
			<c:forEach items="${requestScope.row2 }" var="String">
				<td><button name=${String } type="button" value="입력" onClick='open_pop(${requestScope.year },${requestScope.month },${String },"${requestScope.csId }")'>${String }<br><c:choose>
					<c:when test='${String=="" }'></c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose></button></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${requestScope.row3 }" var="String">
				<td><button name=${String } type="button" value="입력" onClick='open_pop(${requestScope.year },${requestScope.month },${String },"${requestScope.csId }")'>${String }<br><c:choose>
					<c:when test='${String=="" }'></c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose></button></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${requestScope.row4 }" var="String">
				<td><button name=${String } type="button" value="입력" onClick='open_pop(${requestScope.year },${requestScope.month },${String },"${requestScope.csId }")'>${String }<br><c:choose>
					<c:when test='${String=="" }'></c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose></button></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${requestScope.row5 }" var="String">
				<td><button name=${String } type="button" value="입력" onClick='open_pop(${requestScope.year },${requestScope.month },${String },"${requestScope.csId }")'>${String }<br><c:choose>
					<c:when test='${String=="" }'></c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose></button></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${requestScope.row6 }" var="String">
				<td><button name=${String } type="button" value="입력" onClick='open_pop(${requestScope.year },${requestScope.month },${String },"${requestScope.csId }")'>${String }<br><c:choose>
					<c:when test='${String=="" }'></c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose></button></td>
			</c:forEach>
		</tr>
	</table>
</form>

<section id="main-content">
	<section class="wrapper">	