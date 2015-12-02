<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table style="width:500px" border="1">
<tr>
	<th>고객 ID</th>
	<th>고객 번호</th>
</tr>
<tr>
	<td>${requestScope.customer1.csId }</td>
	<td>${requestScope.customer1.csPhone }</td>
</tr>
<a href="${initParam.rootPath}/index.do">로그인 페이지 이동</a>
</table>
</body>
</html>