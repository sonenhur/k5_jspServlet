<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
int mul(int i, int j){
	return i * j;
}
%>
<% 
	//http://localhost:8080/ServletStudy/Mission/gugudan2.jsp?col=3
	String colParam = request.getParameter("col");
    int col = 3;
    if (colParam != null){
	    try {
    	    col = Integer.parseInt(colParam);
    	} catch (Exception e) {
			return;
    	}
    }
    %>
<html>
<head>
<title>Mission 2</title>
</head>
<body>

<!-- HTML 테이블 서식 -->
<!-- <tr>: 테이블 가로행 -->
<!-- <th>: 테이블 헤드(주로 1행에서 열제목) -->
<!-- <td>: 테이블 데이터(열이 늘어남) -->
<!-- <tr> 사이에 <th /> 또는 <td /> 넣고 </tr> -->
			
	<table border='1'>
		<% for (int k = 1; k <= 9; k = k + col) { %>
		<tr>
			<% for (int i = k; i < k + col && i <= 9; i++) { %>
			<td>
				<h2><%= i %>단입니다
				</h2>
				<ul>
					<%  for (int j = 1; j <= 9; j++) {
                		int result = i * j; %>
					<li>
						<%= i %> * <%= j %>  = <%= mul(i,j) %>
					</li>
					<% } %>
				</ul>
			</td>
			<% } %>
		</tr>
		<% } %>
	</table>
	주소창 뒤에 ?col=(정수) 를 입력하세요
</body>
</html>
