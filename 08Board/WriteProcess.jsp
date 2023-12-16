<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>

<%
// 폼에서 전송된 값 받기
String title = request.getParameter("title");
String content = request.getParameter("content");

// 폼값을 BoardDTO 객체에 저장
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setUser_id(session.getAttribute("UserId").toString());

// DAO 객체를 생성하고 게시물 등록 수행
BoardDAO dao = new BoardDAO(application);
int iResult = dao.insertWrite(dto);
dao.close();

// 등록 결과에 따라 페이지 이동 또는 알림 처리
if (iResult == 1) {
    // 등록 성공 시 목록 페이지로 이동
    response.sendRedirect("List.jsp");
} else {
    // 등록 실패 시 알림창을 띄우고 이전 페이지로 이동
    JSFunction.alertBack("글쓰기에 실패했습니다.", out);
}
%>
