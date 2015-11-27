<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">


<title>Insert title here</title>
</head>
<body>
<a href="${initParam.rootPath}/album/logincheck/write.do"> 사진 올리기 </a><p>

	<c:choose>
		<c:when test="${fn:length(requestScope.listPhotoUpload)==0 }">
		등록된 앨범이 없습니다.
	</c:when>
		<c:otherwise>
			<div class="section">
				<div class="container">
					<div class="row">
						<c:forEach items="${requestScope.listPhotoUpload}" var="photoList">
							<div class="col-md-3">
								${photoList.photoContent }
								<h2>${photoList.photoTitle</h2>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>