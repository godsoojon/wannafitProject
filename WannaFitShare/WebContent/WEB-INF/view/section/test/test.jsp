<%@ page contentType="text/html;charset=UTF-8"%>

<div class="container">
	<div class="row">
		<div class="col-xs-12">
			<div class="jumbotron">
				<h1>
					<span class="glyphicon glyphicon-thumbs-up"></span> Hello, world!
				</h1>
				<p>Lorem Ipsum Dolor</p>
				<p>
					<a class="btn btn-primary btn-lg" href="#" role="button"
						data-toggle="tooltip" data-placement="bottom"
						title="Tooltip on bottom">Learn more</a>
				</p>
			</div>
		</div>
	</div>
</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
	$(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>