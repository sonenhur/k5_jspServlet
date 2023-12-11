package edu.pnu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/myservlet02")
public class MyServlet02 extends HttpServlet {
private static final long serialVersionUID = 1L;
@Override
public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException {
System.out.println("MyServlet02");
resp.setContentType("text/plain; charset=utf-8");
PrintWriter out = resp.getWriter();
out.println("이것은 서블릿에서 출력하는 문서입니다.");
out.println("잘 보이면 성공");
out.close();
}
}