<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import='common.JDBConnect' %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 등록 폼</title>
</head>
<body>

    <!-- 회원 등록 폼 페이지 -->
    <h2>회원 등록</h2>
    <span style="color: red; font-size: 1.2em;">
        <%=request.getAttribute("InsertErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
    </span>
    <%
    if (session.getAttribute("UserId") == null) {
    %>
    
    <!-- 클라이언트 측에서 유효성을 검사하는 JavaScript 함수 -->
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
            if (form.user_name.value == "") {
                alert("이름을 입력하세요.");
                return false;
            }
        }
    </script>

    <!-- 회원 등록 폼 -->
    <form action="InsertProcess.jsp" method="post" name="InsertFrm" onsubmit="return validateForm(this);">
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="password" name="user_pw" /><br />
        이름 : <input type="text" name="user_name" /><br />
        <input type="submit" value="등록" /> 
    </form>
    <%
    } else { // 로그인된 상태
        %>
    <!-- 로그인된 상태에서는 회원 등록 폼 대신 사용자 정보를 보여줌 -->
    <%=session.getAttribute("UserName")%>
    회원등록했습니다.
    <br />
    <a href="Logout.jsp">[로그아웃]</a>
    <%
    }
    %>
</body>
</html>