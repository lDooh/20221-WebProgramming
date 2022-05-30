<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DTO.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>유저 검색</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String u_nick = request.getParameter("searchNick");
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO[] userDTO = userDAO.getUsersByNick(u_nick);
	%>
	
	
		<%
			if (userDTO != null && userDTO.length != 0)
			{
				out.print("<table border='1'><tr><th>id</th><th>password</th><th>nickname</th><th>birthDay</th><th>gender</th><th>callNum</th><th>manager</th><th>수정</th><th>삭제</th></tr>");
				
				for (int i = 0; i < userDTO.length; i++)
				{
					out.print("<tr><td id=uid" + i + ">");
					out.print(userDTO[i].getId() + "</td><td>"
							+ userDTO[i].getPassword() + "</td><td>"
							+ userDTO[i].getNickname() + "</td><td>"
							+ userDTO[i].getbd() + "</td><td>"
							+ userDTO[i].getGender() + "</td><td>"
							+ userDTO[i].getCallNum() + "</td><td>"
							+ userDTO[i].getManager() + "</td><td>"
							+ "<a href=ModifyUser.jsp?modifyID=" + userDTO[i].getId() + ">□</a></td><td>"
							+ "<a href=DeleteUser.jsp?deleteID=" + userDTO[i].getId() + ">X</a>");
					out.print("</td></tr>");
				}
				
				out.print("</table");
			}
			else
				out.println("<script>document.write('유저가 존재하지 않습니다.')</script");
		%>
</body>
</html>