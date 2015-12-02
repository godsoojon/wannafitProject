<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<<<<<<< HEAD
=======


>>>>>>> branch 'master' of https://github.com/godsoojon/wannafitProject.git
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
=======
<meta charset="UTF-8">
<title>Insert title here</title>
>>>>>>> branch 'master' of https://github.com/godsoojon/wannafitProject.git

<<<<<<< HEAD
<title>DASHGUM - FREE Bootstrap Admin Template</title>
=======
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
>>>>>>> branch 'master' of https://github.com/godsoojon/wannafitProject.git

<<<<<<< HEAD
<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"href="assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"href="assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">
=======
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

div.template {
	margin-top: 50px;
	margin-right: auto; /*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left: auto;
	width: 1024px;
}

section.template {
	position: relative;
}

.sidebar {
	position: relative;
	float: right;
	/* bottom: 20px;
	left:-200px;
	background-color: white;
	width: 500px;
 */
	/* float: right;
	position: fixed;
	right: 20px;
	top: 400px;
	position: fixed; */
}
</style>
<!-- jQuery Library import -->
<%--  <script type="text/javascript"
	src="${initParam.rootPath }/script/jquery.js"></script> --%>

<!-- <style type="text/css">


.normalMessage {
	font-size: 12px;
	color: blue;
}

img {
	/*이미지는 부모의 width에 리사이즈 처리*/
	max-width: 100%;
	height: auto;
}
/*링크에 밑줄 제거*/
a {
	text-decoration: none;
}

/*테이블 기본 스타일*/
table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
}

td, th {
	padding: 5px;
}

div.template {
	margin-top: 50px;
	margin-right: auto; /*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left: auto;
	width: 1024px;
}


nav.template {
	height: 50px;
	line-height: 50px;
	background-color: red;
	font-weight: bold;
	text-align: center;
	border-bottom: 1px solid gray;
}

nav.template a:link {
	text-decoration: none;
	color: white;
}

nav.template a:visited {
	text-decoration: none;
	color: white;
}

nav.template a:active {
	text-decoration: none;
	color: white;
}

nav.template a:hover {
	text-decoration: underline;
	color: blue;
}

</style>  -->
>>>>>>> branch 'master' of https://github.com/godsoojon/wannafitProject.git

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
<<<<<<< HEAD
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
=======
		<nav class="navbar">
			<tiles:insertAttribute name="menu" />
		</nav>
		<div>
			<section class="template">
				<tiles:insertAttribute name="body" />
			</section>
			<section class="sidebar">
				<tiles:insertAttribute name="side" />
			</section>
		</div>
>>>>>>> branch 'master' of https://github.com/godsoojon/wannafitProject.git
	</div>
</body>
</html>