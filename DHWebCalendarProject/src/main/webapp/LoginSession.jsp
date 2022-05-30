<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DTO.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인...</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String u_id = request.getParameter("userID");
		String u_pw = request.getParameter("userPW");
		
		UserDAO userDAO = UserDAO.getInstance();
		
		int i = userDAO.signIn(u_id, u_pw);
		out.print("i=" + i + ", id: " + u_id + ", pw: " + u_pw + "<br>");
		
		if (i == 1)
		{
			UserDTO userDTO = userDAO.getUserDTO(u_id);
			
			// 세션에 ID 정보 저장
			session.setAttribute("memberId", u_id);
			session.setAttribute("nickname", userDTO.getNickname());
			
			session.setMaxInactiveInterval(60 * 15);	// 세션 유효시간 15분 설정
			
			out.println("세션 생성<br>");
			
			if (userDTO.getManager())
				response.sendRedirect("ShowUsers.jsp");
			else
				response.sendRedirect("MainPage.jsp");
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