<%@ page contentType="text/html;charset=UTF-8"%>
<section id="main-content">
	<section class="wrapper">
		<!-- JUSTIFIED BUTTONS -->
		<h3>
			<i class="fa fa-angle-right"></i> 가입 성공
		</h3>
		<div class="row">

			<div class="col-md-12">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i> 고객 정보
					</h4>
					<hr>
					<table class="table table-hover">
						<tr>
							<th>ID</th>
							<td>${requestScope.customer.csId }</td>
							<td>
								<button class="btn btn-success btn-xs">
									<i class="fa fa-check"></i>
								</button>
								<button class="btn btn-primary btn-xs">
									<i class="fa fa-pencil"></i>
								</button>
								<button class="btn btn-danger btn-xs">
									<i class="fa fa-trash-o "></i>
								</button>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${requestScope.customer.csName }</td>
						</tr>
						<tr>
							<th>e-mail</th>
							<td>${requestScope.customer.csEmail }</td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td>${requestScope.customer.csPhone}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>
</section>
