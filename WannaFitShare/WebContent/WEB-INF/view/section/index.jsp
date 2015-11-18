<%@ page contentType="text/html;charset=UTF-8"%>

메인페이지

<!-- 로그인 수정 한 부분! -->

<form action ="${initParam.rootPath}/customer/login.do" method="post">
		<input type ="text" name ="csId"/>
		<input type="password" name ="csPassword"/>
		<input type="submit" value="전송"/>

</form>