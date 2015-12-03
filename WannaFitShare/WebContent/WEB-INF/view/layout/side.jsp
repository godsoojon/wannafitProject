<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:choose>
   <c:when test="${fn:length(sessionScope.seionFriendList)==0 }">
      등록된 고객이 없습니다.
   </c:when>
   <c:otherwise>
      <table style="width: 300px" border="1">
         <tr>

            <th>내 친구들</th>
         </tr>
         <c:forEach items="${sessionScope.seionFriendList }" var="friendList">
            <tr>
               <td>${friendList.friendId}</td>
            <tr>
         </c:forEach>
      </table>
   </c:otherwise>
</c:choose>