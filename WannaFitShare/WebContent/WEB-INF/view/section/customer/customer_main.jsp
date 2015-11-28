<%@ page contentType="text/html;charset=UTF-8"%>


<hr>
<ul class="nav nav-tabs">
  <li role="presentation" class="active"><a href="${initParam.rootPath}/customer/logincheck/modifyForm.do">회원정보수정</a></li>
  <li role="presentation"><a href="${initParam.rootPath}/loginController/logincheck/logout.do">로그아웃</a></li>
  <li role="presentation"><a href="${initParam.rootPath}/customer/logincheck/remove.do">회원탈퇴</a></li>
</ul>

<h3>고객 메인페이지</h3>
<br>
<p class="lead" >안녕하세요 ${sessionScope.loginInfo.csName }님 환영합니다</p>
 
 id : <strong> ${sessionScope.loginInfo.csId}<br></strong>
 e-mail : ${sessionScope.loginInfo.csEmail }<br>
 휴대폰 : ${sessionScope.loginInfo.csPhone }
 
