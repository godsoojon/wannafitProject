var idDuplicated = false;


function regModFormCheck(){
	if(!$("#csId").val()){
		$("#csId").focus();
		alert("고객 ID는 필수 입력사항입니다.");
		return false;
	}
	if(!$("#csPassword").val()){
		$("#csPassword").focus();
		alert("고객 패스워드는 필수 입력사항입니다.");
		return false;
	}
	
	return true;
}

function registerrFormCheck(){
	if(idDuplicated){
		alert("사용할 수 없는 ID입니다.");
		return false;
	}
	return regModFormCheck();
}

