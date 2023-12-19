<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloServlet.jsp</title>
</head>
<body>
<h2>
<p>
<strong><%= request.getAttribute("message") %></strong> <br />
<a href="./HelloServlet.do">바로가기</a>

<!-- 서블릿은 요청명을 통해 서블릿이 직접 요청을 처리한 후
	-> 데이터를 영역에 저장하고
	-> 결과를 출력할 JSP를 선택하여
	-> 영역을 통해 공유된 데이터를 출력하는 형식으로 클라이언트에게 응답합니다. -->
</p>
</h2>
</body>
</html>