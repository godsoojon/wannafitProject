<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, 	Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>Admin</title>

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



<spring:hasBindErrors name="customer" />
<div id="login-page">
	<div class="container">


		<form class="form-login"
			action="${initParam.rootPath}/loginController/login.do" method="post">
			<h2 class="form-login-heading">WANNA FIT SHARE</h2>
			<div class="login-wrap">
				<input type="text" class="form-control" id="csId" name="csId"
					placeholder="User ID" autofocus> <br> <span
					class="errorMessage"><form:errors path="customer.csId"
						delimiter=" | " /></span> <input type="password"
					class="form-control" id="csPassword" name="csPassword"
					placeholder="Password"> <br> <span
					class="errorMessage"> <form:errors
						path="customer.csPassword" delimiter=" | " />
				</span><label class="checkbox"> <span class="pull-right">
						<a data-toggle="modal" href="login.html#myModal"> Forgot ID?</a>
				</span>
				</label>
				<button class="btn btn-theme btn-block" type="submit">
					<i class="fa fa-lock"></i> LOGIN
				</button>
				<hr>

				<!-- 	            <div class="login-social-link centered">
		            <p>or you can sign in via your social network</p>
		                <button class="btn btn-facebook" type="submit"><i class="fa fa-facebook"></i> Facebook</button>
		                <button class="btn btn-twitter" type="submit"><i class="fa fa-twitter"></i> Twitter</button>
		            </div> -->
				<div class="registration">
					Don't have an account yet?<br /> <a class="btn btn-info"
						href="${initParam.rootPath}/customer/register_form.do"> Create
						an account </a>
				</div>

			</div>
		</form>

		<!-- Modal -->
		<form class="form-login"
			action="${initParam.rootPath}/loginController/findId.do"
			method="post">
			<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
				tabindex="-1" id="myModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">Forgot ID ?</h4>
						</div>
						<div class="modal-body">
							<p>회원가입시 작성한 번호를 작성해주시면 해당 ID를 알려드리겠습니다.</p>
							<input type="text" id="csPhone" name="csPhone"
								placeholder="번호 입력" autocomplete="off"
								class="form-control placeholder-no-fix">

						</div>
						<div class="modal-footer">
							<button data-dismiss="modal" class="btn btn-default"
								type="button">Cancel</button>
							<button class="btn btn-theme" type="submit">Submit</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- modal -->


	</div>
</div>

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