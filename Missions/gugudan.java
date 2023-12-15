package edu.pnu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/gugudan")
public class gugudan extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("gugudan");
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println("<html> <head> <title>구구단 출력</title> </head> <body>");

        String snum = req.getParameter("num");
        int num = 2;

		if (snum != null) {
		try {
			num = Integer.parseInt(snum);
		} catch (Exception e) {
			out.println("주소창의 ?num= 뒤에 정수를 입력하세요");
			return;
		} 
		}

        out.println("<h2>" + num + "단입니다</h2>");
        for (int i = 1; i <= 9; i++) {
            int result = num * i;
            out.println("<ul>" + num + " * " + i + " = " + result + "</ul>");
        }

        out.println("</body></html>");
        out.close();
    }
}
