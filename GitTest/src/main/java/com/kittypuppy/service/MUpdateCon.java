package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.MemberDAO;
import com.kittypuppy.model.MemberDTO;

public class MUpdateCon implements iCommand {
	MemberDAO dao = new MemberDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pw = request.getParameter("pw");
		String picAddress = request.getParameter("picAddress");
		String nick = request.getParameter("nick");
		String sex = request.getParameter("sex");
		String birth = request.getParameter("birth");
		String address = request.getParameter("address");
		String profile = request.getParameter("profile");
		String isAnimal = request.getParameter("isAnimal");

		int cnt = dao.membertUpdate(new MemberDTO(null, pw, picAddress, nick, sex, birth, address, profile, isAnimal));

		if (cnt > 0) {
			response.sendRedirect("mypage.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�Խñ� ���� ����');");
			out.print("location.href='mypage.jsp';");
			out.print("</script>");
		}
	}

}