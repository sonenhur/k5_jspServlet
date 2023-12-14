<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import='common.JDBConnect'%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 처리</title>
</head>
<body>
    <%
    // JDBConnect 객체 생성 및 초기화
    JDBConnect jdbc = new JDBConnect();

    try {
        // 사용자가 입력한 아이디와 패스워드
        String userId = request.getParameter("user_id");
        String userPwd = request.getParameter("user_pw");

        // 웹 애플리케이션 초기 파라미터로부터 데이터베이스 정보 가져오기
        String MySQLDriver = application.getInitParameter("MySQLDriver");
        String MySQLURL = application.getInitParameter("MySQLURL");
        String MySQLId = application.getInitParameter("MySQLId");
        String MySQLPwd = application.getInitParameter("MySQLPwd");

        // MemberDAO 객체 생성 및 초기화
        MemberDAO dao = new MemberDAO(MySQLDriver, MySQLURL, MySQLId, MySQLPwd);

        // MemberDTO를 통해 사용자 정보 가져오기
        MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);

        // DAO 연결 종료
        dao.close();

        // 로그인 성공시
        boolean isLoginSuccess = (memberDTO != null)
        && (memberDTO.getId().equals(userId) && memberDTO.getPass().equals(userPwd));

        if (isLoginSuccess) {
            // 세션에 로그인 정보 설정
            session.setAttribute("isLogIn", true);
            session.setAttribute("UserId", memberDTO.getId());
            session.setAttribute("UserName", memberDTO.getName());
            response.sendRedirect("LoginSuccess.jsp");
        } else {
            // 로그인 실패 시
            session.setAttribute("isLogIn", false);
            response.sendRedirect("LoginFail.jsp");
        }

    } catch (Exception e) {
        // 예외 처리
        e.printStackTrace();
        out.println("로그인 실패");
        response.sendRedirect("LoginFail.jsp");
    } finally {
        // JDBConnect 객체 닫기
        jdbc.close();
    }
    %>
</body>
</html>
