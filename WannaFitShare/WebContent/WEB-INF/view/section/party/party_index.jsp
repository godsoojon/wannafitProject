<%@ page contentType="text/html;charset=UTF-8"%>



<section id="main-content">
	<section class="wrapper">
		<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a
				href="${initParam.rootPath}/partyController/logincheck/allParty.do">모든
					앨범 보기</a></li>
			<li role="presentation"><a
				href="${initParam.rootPath}/partyController/logincheck/belongParty.do">나의
					앨범 목록</a></li>
			<li role="presentation"><a
				href="${initParam.rootPath}/partyController/logincheck/makeParty_form.do">앨범
					만들기</a></li>
			<%-- <li role="presentation"><a
				href="${initParam.rootPath}/album/logincheck/see1.do">건강 블로그</a></li> --%>
		</ul>
		<%-- 
		<h2>앨범</h2>


		<a href="${initParam.rootPath}/partyController/logincheck/allParty.do">모든
			앨범 보기</a><br> <a
			href="${initParam.rootPath}/partyController/logincheck/belongParty.do">내가
			만든 앨범 보기</a><br> --%>
		<%-- <a href="${initParam.rootPath}/partyController/logincheck/makeParty_form.do">앨범 만들기</a><br> --%>
	</section>
</section>

<script type="text/javascript"
	src="${initParam.rootPath}/assets/js/jquery.backstretch.min.js"></script>
<script>
	$.backstretch("/WannaFitShare/assets/img/albumback.png", {
		speed : 500
	});
</script>