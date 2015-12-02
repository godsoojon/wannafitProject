<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

div.template {
	margin-top: 50px;
	margin-right: auto; /*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left: auto;
	width: 1024px;
}


nav.template a:hover {
	text-decoration: underline;
	background-color: darkblue;
}

.template {
	position: relative;
}

.sidebar {
	position: relative;
	float: right;
	top: -250px;
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

</head>
<body>
	<div class="template">
		<nav class="navbar">
			<tiles:insertAttribute name="menu" />
		</nav>
		<section class="template">
			<tiles:insertAttribute name="body" />
		</section> 
	</div>
</body>
</html>