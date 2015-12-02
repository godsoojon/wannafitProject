<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>DASHGUM - FREE Bootstrap Admin Template</title>

<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"href="assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"href="assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/style-responsive.css" rel="stylesheet">
<script src="assets/js/chart-master/Chart.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    
  
<style type="text/css">

body {
	padding-top: 70px;
} 

/*메세지 스타일*/
.errorMessage {
	font-size: 12px;
	color: red
}

a {
	text-decoration: none;
} 

/*
div.template {
	margin-top: 50px;
	margin-right: auto;  //margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.
	margin-left: auto;
	width: 1024px;
} 
*/

/* nav.template a:hover {
	text-decoration: underline;
	background-color: darkblue;
}   */

 section.template {	
	position: relative;
} 
</style>
</head>
<body>
	<div class="template">
		<!--header start-->
      <header class="header black-bg">
			
			<!-- 우측 사이드바 사라지게하는 기능 start -->
            <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>	
            <!-- 우측 사이드바 사라지게하는 기능 end -->  
            
            <!--로고 start-->
            <a href="index.do" class="logo"><b>WANNAFIT SHARE</b></a>
            <!--로고 end-->

			<!-- 로그아웃 start -->
			<div class="top-menu">
				<ul class="nav pull-right top-menu">
					<li><a class="logout" href="login.html">Logout</a></li>
				</ul>
			</div>
			<!-- 로그아웃 end -->
	</header>
      <!--header end-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<tiles:insertAttribute name="menu" />
			</div>
		</aside>
		<section id="main-content">
			<section class="wrapper">
				<div class="container">
					<tiles:insertAttribute name="body" />
				</div>
			</section>
		</section>
	</div>
</body>
</html>