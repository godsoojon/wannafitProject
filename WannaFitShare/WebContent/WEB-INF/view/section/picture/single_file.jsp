<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>파일 업로드 폼</h2>
<!-- 
	파일 업로드 :
	form : method = "post" enctype="multipart/form-data"로 지정해야만 함. 
--> 
  
<form action="${initParam.rootPath}/loginController/logincheck/singleup.do" method="post" enctype="multipart/form-data">
	전송할 사진 : <input type="file" name="upImage"><br>
	<input type="submit" value="전송">
	 
</form>
</body>
</html>