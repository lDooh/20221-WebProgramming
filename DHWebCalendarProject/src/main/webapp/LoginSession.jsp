<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인...</title>
</head>
<body>
	<%
		String u_id = request.getParameter("userID");
		String u_pw = request.getParameter("userPW");
		
		UserDAO userDAO = UserDAO.getInstance();
		
		int i = userDAO.signIn(u_id, u_pw);
		out.print("i=" + i + ", id: " + u_id + ", pw: " + u_pw + "<br>");
		
		if (i == 1)
		{
			session.setAttribute("memberId", u_id);
			session.setAttribute("memberPw", u_pw);
			
			session.setMaxInactiveInterval(60 * 15);	// 세션 유효시간 15분 설정
			
			out.println("세션 생성<br>");
			//response.sendRedirect("MainPage.jsp");
			response.sendRedirect("ShowUsers.jsp");
		}
		else if (i == 0)
		{
			out.println("<script>alert('비밀번호 틀림');</script>");
			out.print("<script>location.href='LoginPage.jsp';</script>");
		}
		else if (i == -1)
		{
			out.println("<script>alert('없는 ID');</script>");
			out.print("<script>location.href='LoginPage.jsp';</script>");
		}
		else
		{
			out.println("세션 생성 실패");
		}
	%>
	
</body>
</html>