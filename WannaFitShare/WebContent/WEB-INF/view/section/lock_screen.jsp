<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>DASHGUM - Bootstrap Admin Template</title>

<!-- Bootstrap core CSS -->
<link href="${initParam.rootPath}/assets/css/bootstrap.css"
	rel="stylesheet">
<!--external css-->
<link
	href="${initParam.rootPath}/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="${initParam.rootPath}/assets/css/style.css" rel="stylesheet">
<link href="${initParam.rootPath}/assets/css/style-responsive.css"
	rel="stylesheet">

</head>
<body>
<body onload="getTime()">

	<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	<div class="container">

		<div id="showtime"></div>
		<div class="col-lg-4 col-lg-offset-4">
			<div class="lock-screen">
				<h2>
					<a data-toggle="modal" href="#myModal"><i class="fa fa-lock"></i></a>
				</h2>
				<p>UNLOCK</p>

				<!-- Modal -->
				<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
					tabindex="-1" id="myModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title">Welcome Back</h4>
							</div>
							<form action="${initParam.rootPath}/loginController/lock.do"
								method="post">

								<div class="modal-body">
									<p class="centered">
										<img class="img-circle" width="80"
											src="${initParam.rootPath}/upimage/${sessionScope.loginInfo.csPicture}">
									</p>
									<input type="password" name="csPassword" id="csPassword"
										placeholder="Password" autocomplete="off"
										class="form-control placeholder-no-fix">

								</div>
								<div class="modal-footer centered">
									<button data-dismiss="modal" class="btn btn-theme04"
										type="button">Cancel</button>
									<button class="btn btn-theme03" type="submit">Login</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- modal -->


			</div>

		</div>
		<!-- /col-lg-4 -->

	</div>
	<!-- /container -->

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="${initParam.rootPath}/assets/js/jquery.js"></script>
	<script src="${initParam.rootPath}/assets/js/bootstrap.min.js"></script>

	<!--BACKSTRETCH-->
	<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
	<script type="text/javascript"
		src="${initParam.rootPath}/assets/js/jquery.backstretch.min.js"></script>
	<script>
		$.backstretch("/WannaFitShare/assets/img/login-bg.jpg", {
			speed : 500
		});
	</script>

	<script>
		function getTime() {
			var today = new Date();
			var h = today.getHours();
			var m = today.getMinutes();
			var s = today.getSeconds();
			// add a zero in front of numbers<10
			m = checkTime(m);
			s = checkTime(s);
			document.getElementById('showtime').innerHTML = h + ":" + m + ":"
					+ s;
			t = setTimeout(function() {
				getTime()
			}, 500);
		}

		function checkTime(i) {
			if (i < 10) {
				i = "0" + i;
			}
			return i;
		}
	</script>
</body>
</html>



