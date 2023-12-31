<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
<%-- <jsp:include page="../Common/Link.jsp" /> --%>
	<h2>로그인 페이지</h2>
	<span style="color: red; font-size: 1.2em;">
	<%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
	</span>
	<%
	if (session.getAttribute("UserId") == null) {
	%>
	<script>
		function validateForm(form) {
			if (!form.user_id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (form.user_pw.value == "") {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
	</script>
	
	<!-- submit 누르면 action 항목 실행 -->
	<form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
		아이디 : <input type="text" name="user_id" /><br />
		패스워드 : <input type="password" name="user_pw" /><br />
		<input type="submit" value="로그인하기" /> 
	</form>
	<%
	} else { // 로그인된 상태
		%>
	<%=session.getAttribute("UserName")%>
	회원님 로그인하셨습니다.
	<br />
	<a href="../08Board/List.jsp">08페이지로</a>
	<br />
	<a href="../09PagingBoard/List.jsp">09페이지로</a>
	<br />
	<a href="Logout.jsp">[로그아웃]</a>
	<%
	}
	%>
</body>
</html>