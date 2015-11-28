<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script language="JavaScript">
function submit_data(){
	
	document.f.action="/WannaFitShare/CalorieCalendarController/save.do";
	window.f.submit();
	window.close();
}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<form  name="f" method="post">

${param.year }년${param.month }월${param.day }일<br>
<input id="year" type="hidden" name="year" value=${param.year }>
<input id="month" type="hidden" name="month" value=${param.month }>
<input id="day" type="hidden" name="day" value=${param.day }>
<input id="csId" type="hidden" name="csId" value=${param.csId }>
<input type="button" value="저장" onClick="submit_data()">
<a href="javascript:window.close()">닫기</a>
</form>
</body>
</html>