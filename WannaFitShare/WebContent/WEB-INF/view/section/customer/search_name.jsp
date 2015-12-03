<%@ page contentType="text/html;charset=UTF-8"%>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> 친구찾기
		</h3>

		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h4 class="mb">
						<i class="fa fa-angle-right"></i> 친구 이름으로 검색
					</h4>
					<form class="form-horizontal style-form"
						action="${initParam.rootPath}/friendController/logincheck/findByName.do"
						method="post">
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">친구이름 입력 :
							</label>
							<div class="col-sm-10">
								<input type="text" name="csName" class="form-control round-form">
								<span class="help-block">찾고자 하는 친구의 이름을 입력해 주세요.</span>
							</div>
						</div>
						<input type="submit" class="btn btn-round btn-primary" value="찾기">
					</form>
				</div>
			</div>
		</div>
	</section>
</section>
<!-- /MAIN CONTENT -->

<!--main content end-->