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
<h2>댓글 수정폼</h2>
<form action="${initParam.rootPath}/reple/updateSuccess.do">
<input type="text" name="repletxt" id="repletxt" >

			<input type="hidden" name="repleId" id="repleId"
					value="${requestScope.repleId}">

<input type="submit" name="전송">

</form>
</body>
</html>