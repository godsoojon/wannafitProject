<%@ page contentType="text/html;charset=UTF-8"%>

<script type="text/javascript">
	/*
	 * window.open():("새창에 보여질 문서의 URL","창의 이름","새창에 대한 설정들")-팝업 창을 띄우는 함수
	 * window.close()-창을 닫는 메소드.
	 */
	function popupOpen() {
		window.open("${initParam.rootPath}/window_popup.jsp", "",
				"width=500,heigth=350,resizable=no");
	}
</script>
<!--header start-->
<header class="header black-bg">

	<!-- 우측 사이드바 사라지게하는 기능 start -->
	<div class="sidebar-toggle-box">
		<div class="fa fa-bars tooltips" data-placement="right"
			data-original-title="Toggle Navigation"></div>
	</div>
	<!-- 우측 사이드바 사라지게하는 기능 end -->

	<!--로고 start-->
	<a href="${initParam.rootPath}/loginController/logincheck/home.do"
		class="logo"><b>WANNA FIT SHARE</b></a>
	<!--로고 end-->

	<!-- 로그아웃 start -->
	<div class="top-menu">
		<ul class="nav pull-right top-menu">
			<li><a class="logout"
				href="${initParam.rootPath}/loginController/logincheck/logout.do">Logout</a></li>
		</ul>
	</div>	
	<!-- 로그아웃 end -->
	
	
	<script type="text/javascript">
		function myFunction() {
			window.open("/WannaFitShare/lock1.do","mywindow","status=1,toolbar=0");
			parent.close();
		}
	</script>

</header>

<!--header end-->
<!--header end-->

<!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
<!--sidebar start-->
<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">

			<!-- 로그인한 ID와 프로필 사진 start -->
			<!--"${initParam.rootPath}/assets/img/basic.png"-->
			<p class="centered">
				<%-- <img src="${initParam.rootPath}/upimage/${sessionScope.loginInfo.csPicture}"
					class="img-circle" width="100" onclick="popupOpen();"> --%>
				<img
					src="${initParam.rootPath}/upimage/${sessionScope.loginInfo.csPicture}"
					class="img-circle" width="100" onclick="popupOpen();">
			</p>
			<h5 class="centered">${sessionScope.loginInfo.csName }</h5>
			<!-- 로그인한 ID와 프로필 사진 end -->

			<li class="mt"><a
				href="${initParam.rootPath}/loginController/logincheck/home.do">
					<i class="fa fa-dashboard"></i> <span>HOME</span>
			</a></li>
			<!-- Album 화면  -->
			<li class="sub-menu"><a
				href="${initParam.rootPath}/partyController/logincheck/party_index.do">
					<i class="fa fa-th"></i> <span>ALBUM</span>
			</a> <!-- 친구찾기 -->
			<li class="sub-menu"><a
				href="${initParam.rootPath}/friendController/logincheck/search_name.do">
					<i class="fa fa-desktop"></i> <span>Friend Search</span>
			</a> <!-- 친구 목록 -->
			<li class="sub-menu"><a
				href="${initParam.rootPath}/friendController/logincheck/myFriend.do">
					<i class="fa fa-tasks"></i> <span>Friends</span>
			</a> <!-- 달력 -->
			<li class="sub-menu"><a
				href="${initParam.rootPath}/customer/logincheck/calender.do?mode=0&year=-1&month=0&day&=0">
					<i class="fa fa-book"></i> <span>Calorie Calender</span>
			</a>
			<li class="sub-menu"><a
				href="${initParam.rootPath}/album/logincheck/see1.do"> <i
					class="fa fa-book"></i> <span>Health Blog</span>
			</a>
			<li class="sub-menu"><a href="javascript:;"> <i
					class=" fa fa-bar-chart-o"></i> <span>기타</span>
			</a>
				<ul class="sub">
					<li><a href="javascript:myFunction();">lock_screen</a></li>
				</ul></li>
		</ul>
		<!-- sidebar menu end-->
	</div>
</aside>
<!--sidebar end-->

<!-- js placed at the end of the document so the pages load faster -->
<script src="${initParam.rootPath}/assets/js/jquery.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="${initParam.rootPath}/assets/js/jquery-1.8.3.min.js"></script>
<script src="${initParam.rootPath}/assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
	src="${initParam.rootPath}/assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${initParam.rootPath}/assets/js/jquery.scrollTo.min.js"></script>
<script src="${initParam.rootPath}/assets/js/jquery.sparkline.js"></script>


<!--common script for all pages-->
<script src="${initParam.rootPath}/assets/js/common-scripts.js"></script>

<script type="text/javascript"
	src="${initParam.rootPath}/assets/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript"
	src="${initParam.rootPath}/assets/js/gritter-conf.js"></script>

<!--script for this page-->
<script src="${initParam.rootPath}/assets/js/sparkline-chart.js"></script>
<script src="${initParam.rootPath}/assets/js/zabuto_calendar.js"></script>

<script type="application/javascript">
	
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    

</script>
