<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
    String ctx = request.getContextPath();    //콘텍스트명 얻어오기.
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스마트 에디터</title>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="${initParam.rootPath }/board/js/HuskyEZCreator.js" charset="utf-8"></script>

<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">

//
$(function(){

	//전역변수
	var oEditors = [];
	  //스마트 에디터 프레임 생성
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/WannaFitShare/board/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true	,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
            /*   fOnBeforeUnload : function(){              
              } */
          }	 
          /* fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", ["WannaFitShare 입니다."]);
          },
          fCreator: "createSEditor2" */
      });
    
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
    	  //id가 ir1인 textarea에 에디터에서 대입 명령어 
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          //alert(oEditors[0].getIR()); 
		  //form submit
          $("#frm").submit();
      });    
});


</script>
</head>
<body>
<!-- action : 에디터에 입력한 html 코드를 전달받을 Controller페이지 URL -->
<form action="${initParam.rootPath}/album/logincheck/submit.do" id="frm"  method="post" >

<table width="100%">
		<tr>

			<td>앨범 이름 : partyName</td>
		</tr>
        <tr>
            <td>제목</td>
            <td><input type="text" id="title" name="title" style="width:650px"/></td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea rows="10" cols="30" id="ir1" name="content" style="width:650px; height:350px; "></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" id="save" value="저장"/>
                <input type="button" value="취소"/>
            </td>
        </tr>
</table>
</form>
</body>
</html>