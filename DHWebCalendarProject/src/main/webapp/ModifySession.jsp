<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DTO.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보 수정 중...</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("userID");
		String pw = request.getParameter("userPW");
		String nick = request.getParameter("userNick");
		String birth = request.getParameter("userBirth");
		String manager = request.getParameter("managerRadio");
		
		StringBuffer bd = new StringBuffer(birth);
		bd.insert(4, "-");
		bd.insert(7, "-");
		
		boolean isManager = false;
		if (manager.equals("yesManager"))
			isManager = true;
		else
			isManager = false;
		
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO = userDAO.getUserDTO(id);
		
		userDTO.setPassword(pw);
		userDTO.setNickname(nick);
		userDTO.setbd(bd.toString());
		userDTO.setManager(isManager);
		
		userDAO.modifyUser(userDTO);
		
		response.sendRedirect("ShowUsers.jsp");
	%>
</body>
</html>