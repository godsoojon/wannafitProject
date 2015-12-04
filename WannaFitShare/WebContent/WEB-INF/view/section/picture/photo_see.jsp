<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<h3>
				<i class="fa fa-angle-right"></i> Health Blog
			</h3>

			<!-- BASIC FORM ELELEMNTS -->
			<div class="row mt">
				<div class="col-lg-12">
					<div class="form-panel">
						<h4 class="mb">
							<i class="fa fa-angle-right"></i>
							${sessionScope.photo.photoTitle}
						</h4>

						${sessionScope.photo.photoContent}
					</div>
				</div>
				<!-- col-lg-12-->
			</div>
			<!-- /row -->


			<div class="col-md-12">

				<table class="table">
					<thead>
						<tr>
							<th></th>
							<th></th>

							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${requestScope.reple!='' ||requestScope.reple ne null}">
							<c:forEach items="${requestScope.repleList }" var="repleList">
								<tr>
									<td>${repleList.csId}</td>
									<td>${repleList.repleContent }</td>
									<td>${repleList.repleTime}</td>
									<td><a
										href="${initParam.rootPath}/reple/updateReple.do?repleId=${repleList.repleId}">수정</a>
										<a
										href="${initParam.rootPath}/reple/deleteReple.do?repleId=${repleList.repleId}">삭제</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>


			<!-- /col-md-12 -->





			<form action="${initParam.rootPath}/reple/addReple.do">
				<input type="text" id="repletxt" name="repletxt"> <input
					type="submit" value="댓글 달기">
			</form>
		</section>
	</section>
</body>
</html>
