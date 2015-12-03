<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
.thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
}

.thumbnail img {
    width: 100%;
    height: 100%;
    margin-bottom: 10px;
}

</style>
<div class="container-fluid text-center bg-grey">
	<h2>My Album Story</h2>
	<h4>
		<a href="${initParam.rootPath}/album/logincheck/write.do"> 사진 올리기
		</a>
	</h4>
	<br>
	<div class="row text-center">
		<c:choose>
			<c:when test="${fn:length(requestScope.listPhotoUpload)==0 }">
				<!-- 		등록된 앨범이 없습니다. -->
			</c:when>
			<c:otherwise>
				<c:forEach items="${requestScope.listPhotoUpload}" var="photoList">
					<div class="col-sm-4">
						<div class="thumbnail">
							${photoList.photoContent}
							<p>
								<strong>${photoList.photoTitle}</strong>
							</p>
							<a href="${initParam.rootPath}/album/logincheck/delete.do?deletephotoId=${photoList.photoId}">사진 삭제 </a>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>





<!-- Set height and width with CSS -->
<div id="googleMap" style="height:400px;width:100%;"></div>

Add Google Maps
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
var myCenter = new google.maps.LatLng(37.401936, 127.106250);

function initialize() {
var mapProp = {
center:myCenter,
 zoom:12,
scrollwheel:false,
draggable:false,
 mapTypeId:google.maps.MapTypeId.ROADMAP
};

var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker = new google.maps.Marker({
position:myCenter,
});

 marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script> 
