<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script language="JavaScript">
function submit_data(){
	
	var para = document.getElementById("rice");
	document.f.action="/WannaFitShare/CalorieCalendarController/save.do";
	var cal=0;
	if(document.getElementById("rice").checked){
		cal = cal+(300*document.getElementById("ricecount").value);
	}
	if(document.getElementById("meet").checked){
		cal = cal+(1000*document.getElementById("meetcount").value);
	}
	document.getElementById("totalCalorie").value=cal;
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
식단입력<br>
<input id="year" type="hidden" name="year" value=${param.year }>
<input id="month" type="hidden" name="month" value=${param.month }>
<input id="day" type="hidden" name="day" value=${param.day }>
<input id="csId" type="hidden" name="csId" value="son">
<label>밥-<input id="rice" type="checkbox" name="rice" ></label><input id="ricecount" type="text" name="ricecount" value="0"><br>
<label>고기-<input id="meet" type="checkbox" name="meet" ></label><input id="meetcount" type="text" name="meetcount"value="0"><br>
<input id="totalCalorie" type ="text" name="totalCalorie" readonly="readonly">
<input type="button" value="계산" onClick="submit_data()">
<a href="javascript:window.close()">닫기</a>
</form>
</body>
</html>