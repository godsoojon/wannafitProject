<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%    
    //제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
    request.setCharacterEncoding("utf-8");

    String title = request.getParameter("title");
    String content = request.getParameter("content");


    //콘솔 출력

    System.out.println("제목:"+title);

    System.out.println("내용:"+content);    

%>
</head>
<body>

제목 : <%=title %><br>

내용 : <br>

<%=content %>

</body>
</html>