<%@ page import="utils.JSFunction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% if (session.getAttribute("UserId")== null){
    	JSFunction.alertLocation("로그인이 필요합니다.", "../06Session/LogtinForm.jsp",out);
    	return;
    }
    %>