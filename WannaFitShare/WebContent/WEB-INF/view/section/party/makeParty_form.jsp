<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript"
	src="${initParam.rootPath }/script/formcheck.js"></script>

<script type="text/javascript">
	function checkRadio() {
		var radioBtn = document.partyFrom.partyRight;
		var flag = false;
		for (var i = 0; i < radioBtn.length; i++) {
			if (radioBtn[i].checkd) {
				falg = true;
				break;
			}
		}
		if (!flag) {
			alert("권한을 선택하세요")
			radioBtn.focus();
			return false;
		}

	}
</script>

<h2>앨범만들기</h2>
<spring:hasBindErrors name="group" />
<form
	action="${initParam.rootPath}/partyController/logincheck/addParty.do"
	method="post" id="regForm" name="partyFrom"
	onsubmit="return checkRadio();">
	<table border="1" style="width: 500px">
		<tr>
			<th>이름</th>
			<td><input type="text" id="partyName" name="partyName" size="25"></td>
		</tr>
		<tr>
			<th>권한</th>
			<td><label>나만보기<input type="radio" name="partyRight"
					value="1" size="25" /></label> <label>친구만 보기<input type="radio"
					name="partyRight" value="2" size="25" /></label> <label>모두 보기<input
					type="radio" name="partyRight" value="3" size="25" /></label></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="앨범만들기"> <input
				type="reset" value="초기화"></td>
		</tr>
	</table>
</form>
