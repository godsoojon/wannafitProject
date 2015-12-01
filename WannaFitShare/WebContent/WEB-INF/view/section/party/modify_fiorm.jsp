<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript"
	src="${initParam.rootPath }/script/formcheck.js"></script>


<hr>
<ul class="nav nav-tabs">
	<li role="presentation"><a
		href="${initParam.rootPath}/partyController/logincheck/allParty.do">모든
			앨범 보기</a></li>
	<li role="presentation"><a
		href="${initParam.rootPath}/partyController/logincheck/belongParty.do">나의
			앨범 목록</a></li>
	<li role="presentation" class="active"><a
		href="${initParam.rootPath}/partyController/logincheck/makeParty_form.do">앨범
			만들기</a></li>
</ul>

<h2>앨범 권한 수정</h2>


<spring:hasBindErrors name="party" />
<form
	action="${initParam.rootPath}/partyController/logincheck/updateParty.do"
	method="post" name="partyFrom" onsubmit="return checkRadio();">

	<div class="form-group">
		<label for="exampleInputEmail1">앨범 이름 : </label> <b>${sessionScope.party }</b>
	</div>

	<div class="form-group">
		<label for="exampleInputPassword1">권한</label> <br> 
		<label class="radio-inline"><input type="radio" name="partyRight"value="1" />나만보기	</label> 
		<label class="radio-inline"><input type="radio" name="partyRight" value="2" />친구만 보기</label> 
		<label class="radio-inline"><input type="radio" name="partyRight" value="3" />모두 보기</label> 
		<span class="errorMessage" id="idErrorMessage"> 
		<form:errors path="party.partyRight" /></span>
	</div>

	<button type="submit" class="btn btn-info">수정</button>
</form>
