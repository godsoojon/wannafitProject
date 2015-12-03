<%@ page contentType="text/html;charset=UTF-8"%>

<section id="main-content">
	<section class="wrapper">

<h2>친구찾기</h2>
<form action ="${initParam.rootPath}/friendController/logincheck/findByName.do" method="post">
친구이름 입력 :<input type ="text" name ="csName"><br> 
<input type="submit" value ="찾기">
</form>
</section></section>