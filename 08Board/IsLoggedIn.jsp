<%@ page import="utils.JSFunction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("UserId") == null) { // 세션에서 "UserId" 속성이 없으면 로그인이 필요하다는 알림창을 띄우고 로그인 페이지로 이동
        JSFunction.alertLocation("로그인이 필요합니다.", "../06Session/LoginForm.jsp", out);
        return; // 현재 페이지의 처리를 중단하고 더 이상 코드를 실행하지 않음
    }
%>
