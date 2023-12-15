package edu.pnu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/gugudandir")
public class gugudanDir extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("gugudanDir");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<html> <head> <title>구구단 출력</title> </head> <body>");

		String dir = req.getParameter("dir");
		if (dir == null) {
			dir = "ver";
		}
		out.println("<table>");
		out.println("<tr>");

		if (dir.equals("ver")) {
			for (int num = 2; num < 10; num++) {
				out.println("<h2>" + num + "단입니다</h2>");
				out.println("<ul>");
				for (int i = 1; i < 10; i++) {
					int result = num * i;
					out.println("<li>" + num + " * " + i + " = " + result + "</li>");
				}
				out.println("</ul>");
			}
		}

		else if (dir.equals("hor")){
			for (int num = 2; num < 10; num++) {
				out.println("<td>");
				out.println("<h2>" + num + "단입니다</h2>");
				out.println("<ul>");
				for (int i = 1; i < 10; i++) {
					int result = num * i;
					out.println("<li>" + num + " * " + i + " = " + result + "</li>");
				}
				out.println("</ul>");
				out.println("</td>");
			}
		}
		else out.println("ver이나 hor만 지원합니다");
		
		out.println("</tr>");
		out.println("</table>");
		out.println("</body></html>");
		out.close();
	}
}
