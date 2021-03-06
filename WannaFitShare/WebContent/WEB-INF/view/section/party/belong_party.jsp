<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<section id="main-content">
	<section class="wrapper">
		<hr>
		<ul class="nav nav-tabs">
			<li role="presentation"><a
				href="${initParam.rootPath}/partyController/logincheck/allParty.do">모든
					앨범 보기</a></li>
			<li role="presentation" class="active"><a
				href="${initParam.rootPath}/partyController/logincheck/belongParty.do">나의
					앨범 목록</a></li>
			<li role="presentation"><a
				href="${initParam.rootPath}/partyController/logincheck/makeParty_form.do">앨범
					만들기</a></li>
			<%-- <li role="presentation"><a
				href="${initParam.rootPath}/album/logincheck/see1.do">건강 블로그</a></li> --%>
		</ul>
		<h2>나의 앨범 목록</h2>
		<c:choose>
			<c:when test="${fn:length(requestScope.list)==0 }">
      등록된 앨범이 없습니다.
   </c:when>
			<c:otherwise>
				<table style="width: 500px" class="table table-hover">
					<tr>
						<th>앨범 이름</th>
					</tr>
					<c:forEach items="${requestScope.list }" var="partyList">
						<tr>
							<c:choose>
								<c:when test="${partyList.partyName=='건강블로그'}" />
								<c:otherwise>
									<td style="color: darkblue">${partyList.partyName}<br>

										<c:choose>
											<c:when test="${partyList.partyRight == 1}">(나만 보기)</c:when>
											<c:when test="${partyList.partyRight == 2}">(친구만 보기)</c:when>
											<c:when test="${partyList.partyRight == 3}">(모두 보기)</c:when>
										</c:choose>
								</c:otherwise>
							</c:choose>
							</td>
							<td><c:choose>
									<c:when test="${partyList.partyName=='건강블로그'}">
									</c:when>
									<c:otherwise>
										<a href="${initParam.rootPath}/album/logincheck/see.do?partyName=${partyList.partyName}">
											<button class="btn btn-info">보러가기</button>
										</a>
									</c:otherwise>

								</c:choose></td>
							<td><c:choose>
									<c:when test="${partyList.partyName=='건강블로그'}">
									</c:when>
									<c:otherwise>

										<a
											href="${initParam.rootPath}/partyController/logincheck/goUpdateParty.do?partyName=${partyList.partyName}"><button
												class="btn btn-warning">수정하기</button></a>
									</c:otherwise>

								</c:choose></td>

							<td><c:choose>
									<c:when test="${partyList.partyName=='건강블로그'}">
									</c:when>
									<c:otherwise>

										<a
											href="${initParam.rootPath}/partyController/deleteParty.do?partyName=${partyList.partyName}">
											<button class="btn btn-danger">앨범삭제</button>
										</a>
									</c:otherwise>

								</c:choose></td>
						<tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</section>
</section>