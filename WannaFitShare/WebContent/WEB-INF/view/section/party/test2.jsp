<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkboxCheck() {
		//name="hobby" 인 checkbox객체가 여러개 이므로 배열(node list)로 리턴된다
		var chkList = document.f1.hobby //chkList 는 배열
		alert("checkbox수 : " + chkList.length);
		//checkbox/radio의 체크 여부 - checked속성 : ture-체크, false-체크해제

		var cnt = 0;
		for (var i = 0; i < chkList.length; i++) {
			// 			alert(chkList[i].checked);//chkList[i] - checkbox객체
			// 			chkList[i].checked = true;//체크박스 체크되도록 처리
			if (chkList[i].checked) {
				cnt++;
			}//end of if
		}//end if for

		if (!cnt) {//숫자 false:0
			alert("취미를 하나이상 선택하세요..")
			return;
		}

		document.f1.submit();

	}

	function checkAll(allchk) {

		// 		var flag = document.f1.allCheck.checked;
		var flag = allchk.checked;
		var hobbyChk = document.f1.hobby;
		for (var i = 0; i < hobbyChk.length; i++) {
			hobbyChk[i].checked = flag;
		}
	}

	function checkRadio() {
		//메뉴 선택 라디오 버튼이 선택되었을때만 전송되도록 처리
		var menuRD = document.f1.menu; //radio객체(input type="radio") 배열
		var flag = false; //라디오는 선택되면 1개->선택된 것이 있니?(true) 없니?(false)
		for (var i = 0; i < menuRD.length; i++) {
			if (menuRD[i].checked) {//radio버튼이 선택 돼 있다면, true이면
				flag = true;
				break;//반복문을 빠져나감
			}
		}
		if (!flag) {
			alert("메뉴를 선택하세요");
			return false;
		}

	}
</script>
</head>
<body>
	<form action="response.jsp" name="f1" onsubmit="return checkRadio();">
	 	취미를 선택하세요(1개 이상 선택하세요)<br>
	 	<label>독서<input type="checkbox" name="hobby" value="reading"></label>
	 	<label>음악감상<input type="checkbox" name="hobby" value="music"></label>
	 	<label>게임<input type="checkbox" name="hobby" value="game"></label>
	 	<label>스포츠<input type="checkbox" name="hobby" value="sports"></label>
	 	<label>요리<input type="checkbox" name="hobby" value="cooking"></label>
	 	<br>
	 	<label>전체선택/해제<input type="checkbox" name="allCheck" onclick="checkAll(allCheck);"></label>
	 	<input type="button" value="전송" onclick="checkboxCheck();">
	 	<p>
	 	메뉴를 선택하세요<br>
	 	<label>짜장면<input type="radio" name="menu" value="짜장면"></label>
	 	<label>짬뽕<input type="radio" name="menu" value="짬뽕"></label>
	 	<label>우육면<input type="radio" name="menu" value="우육면"></label>
	 	<label>우동<input type="radio" name="menu" value="우동"></label>
	 	<br>
	 	<input type="submit" value="전송-라디오체크" >
	 	</p>
	</form>
</body>
</html>