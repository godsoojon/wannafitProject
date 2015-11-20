<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>고객 메인페이지</h3>
 <p>안녕하세요 ${sessionScope.loginInfo.csName }님 환영합니다</p>
 
 id : ${sessionScope.loginInfo.csId}<br>
 e-mail : ${sessionScope.loginInfo.csEmail }<br>
 휴대폰 : ${sessionScope.loginInfo.csPhone }
 
 <br><br>
 <a href="${initParam.rootPath}/customer/logincheck/modifyForm.do"> <b>회원정보수정</b> </a> <br>
 <a href="${initParam.rootPath}/customer/logincheck/logout.do"> <b>로그아웃</b> </a> <br>
 <a href="${initParam.rootPath}/customer/logincheck/remove.do"> <b>회원탈퇴</b> </a> <br>

</body>
</html>