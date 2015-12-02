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

<h2>앨범만들기</h2>


<spring:hasBindErrors name="party" />
<form
	action="${initParam.rootPath}/partyController/logincheck/addParty.do"
	method="post" name="partyFrom">

	<div class="form-group">
		<label for="exampleInputEmail1">앨범 이름</label> <input type="text"
			id="partyName" name="partyName" class="form-control"
			placeholder="이름을 입력하세요" style="width: 500px"><span
			class="errorMessage" id="idErrorMessage"> <form:errors
				path="party.partyName" /></span>
	</div>

	<div class="form-group">
		<label for="exampleInputPassword1">권한</label> <br> <label
			class="radio-inline"> <input type="radio" name="partyRight"
			value="1" />나만보기
		</label> <label class="radio-inline"><input type="radio"
			name="partyRight" value="2" />친구만 보기</label> <label class="radio-inline"><input
			type="radio" name="partyRight" value="3" />모두 보기</label> <span
			class="errorMessage" id="idErrorMessage"> <form:errors
				path="party.partyRight" /></span>

	</div>

	<button type="submit" class="btn btn-info">만들기</button>
</form>
