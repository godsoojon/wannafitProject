<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<h2>팝업</h2>
<form action="${initParam.rootPath}/loginController/logincheck/singleup.do" method="post" enctype="multipart/form-data" >
	전송할 사진 : <input type="file" name="upImage"><br>
	<input type="submit" value="전송" >
<!-- <script type="text/javascript">
opener.location.reload();
self.close();
</script> -->
</form>	

</body>
</html>