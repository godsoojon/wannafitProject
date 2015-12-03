<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">


<title>DASHGUM - FREE Bootstrap Admin Template</title>

<!-- Bootstrap core CSS -->
<link href="${initParam.rootPath}/assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="${initParam.rootPath}/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"href="${initParam.rootPath}/assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"href="${initParam.rootPath}/assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css" href="${initParam.rootPath}/assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="${initParam.rootPath}/assets/css/style.css" rel="stylesheet">
<link href="${initParam.rootPath}/assets/css/style-responsive.css" rel="stylesheet">
<script src="${initParam.rootPath}/assets/js/chart-master/Chart.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    
</head>

<body>
	<div class="template">
		<nav class="navbar">
			<tiles:insertAttribute name="menu" />
		</nav>
		<div>
			<section class="template">
				<tiles:insertAttribute name="body" />
			</section>
		</div>
	</div>
</body>
</html>