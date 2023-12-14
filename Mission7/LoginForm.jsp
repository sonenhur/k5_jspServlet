<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>로그인 폼</title>
</head>
<body>
    <!-- 로그인 폼 페이지 -->
    <h2>로그인</h2>
    <form action="LoginProcess.jsp" method="post" name="LoginForm" onsubmit="return validateForm(this);">
        아이디: <input type="text" name="user_id" /><br />
        패스워드: <input type="password" name="user_pw" /><br />
        <input type="submit" value="로그인" /> 
    </form>
</body>
</html>
