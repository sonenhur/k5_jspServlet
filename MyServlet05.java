package edu.pnu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/myservlet05")
public class MyServlet05 extends HttpServlet {
private static final long serialVersionUID = 1L;
@Override
public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException {
System.out.println("MyServlet05");
resp.setContentType("text/html; charset=utf-8");
PrintWriter out = resp.getWriter();
out.println("<h2>이것은 서블릿에서 출력하는 문서입니다.</h2>");
out.println("<h3>잘 보이면 성공~</h3>");
out.println("<body>\r\n"
		+ "	<table style=\"border: 1px\">\r\n"
		+ "		<tr>\r\n"
		+ "			<td>번호</td>\r\n"
		+ "			<td>나라</td>\r\n"
		+ "			<td>수도</td>\r\n"
		+ "			<td>인구</td>\r\n"
		+ "		</tr>\r\n"
		+ "		<tr>\r\n"
		+ "			<td>1</td>\r\n"
		+ "			<td>대한민국</td>\r\n"
		+ "			<td>서울</td>\r\n"
		+ "			<td>1000만</td>\r\n"
		+ "		</tr>\r\n"
		+ "		<tr>\r\n"
		+ "			<td>2</td>\r\n"
		+ "			<td>미국</td>\r\n"
		+ "			<td>워싱턴</td>\r\n"
		+ "			<td>70만</td>\r\n"
		+ "		</tr>\r\n"
		+ "		<tr>\r\n"
		+ "			<td>3</td>\r\n"
		+ "			<td>일본</td>\r\n"
		+ "			<td>도쿄</td>\r\n"
		+ "			<td>1400만</td>\r\n"
		+ "		</tr>\r\n"
		+ "		<tr>\r\n"
		+ "			<td>4</td>\r\n"
		+ "			<td>중국</td>\r\n"
		+ "			<td>베이징</td>\r\n"
		+ "			<td>2100만</td>\r\n"
		+ "		</tr>\r\n"
		+ "	</table>\r\n"
		+ "</body>");
out.close();
}
}