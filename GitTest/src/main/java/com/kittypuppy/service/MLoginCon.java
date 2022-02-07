package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.MemberDAO;
import com.kittypuppy.model.MemberDTO;

public class MLoginCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberDAO dao = new MemberDAO();

		String nick = dao.memberLogin(id, pw);

		if (nick != null) {
			System.out.println("�α��� ����!");

			HttpSession session = request.getSession();
			session.setAttribute("nick", nick);
			response.sendRedirect("#");//���� �ǵ� ����

		} else {
			// �α��� ���� �˸�â ��� �� main.jsp�� �̵��ϱ�!
			// *JoinCon else�� ����

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�α��� ����..!');");
			out.print("location.href= 'main_jstl.jsp';");// �α��������� ����
			out.print("</script>");
		}
	}

}