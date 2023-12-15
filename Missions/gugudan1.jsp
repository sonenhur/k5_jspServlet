<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
int mul(int a, int b){
	return a * b;
}
%>
<%
	// http://localhost:8080/ServletStudy/Mission/gugudan1.jsp?dan=2
	String param = request.getParameter("dan");
	int dan = 2;
	if (param != null){
		try {
			dan = Integer.parseInt(param);
		} catch (Exception e) {
			return;
		}
	}
	%>
<html>
<head>
<title>Mission 1</title>
</head>
<body>
	<h2>
		<%= dan %>단입니다
	</h2>
	<%
	for (int i = 1; i <= 9; i++) {
	%>
	<ul>
		<%= dan %> * <%= i %> = <%= mul(dan, i) %> 
	</ul>
	<% } %>
	주소창 뒤에 ?dan=(정수) 를 입력하세요
</body>
</html>
