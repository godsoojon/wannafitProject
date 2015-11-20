<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<h2>로그인</h2>
<spring:hasBindErrors name="customer"/>
<form action="${initParam.rootPath}/customer/login.do" method="post" id="regForm">
<!-- 요청 처리할 Controller에 대한 구분값 -->
<table border="1" style="width:500px">
	<tr>
		<th>고객 ID</th>
		<td><input type="text" id="csId" name="csId" size="25"> <span class="errorMessage" id="idErrorMessage"><form:errors path="customer.csId"/></span></td>
	</tr>
	<tr>
		<th>패스워드</th>
		<td><input type="password" id="csPassword" name="csPassword" size="25"> <span class="errorMessage"><form:errors path="customer.csPassword"/></span></td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="submit" value="로그인"> 
		</td>
	</tr>
</table>
</form>
<br>
<a href="${initParam.rootPath}/customer/register_form.do"> <b>회원가입</b> </a> <br>

