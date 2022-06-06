<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.UserDTO" %>
<%@ page import="DAO.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 테스트</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("userID");
		String pw = request.getParameter("userPW");
		String nick = request.getParameter("userNick");
		String birth = request.getParameter("userBirth");
		String gender = request.getParameter("userGender");
		String carrier = request.getParameter("mobileCarrier");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");

		if (gender.equals("남자"))
			gender = "m";
		else
			gender = "f";
		
		UserDTO userDTO = new UserDTO(id, pw, nick, birth, gender, phone1 + phone2 + phone3);
		UserDAO userDAO = UserDAO.getInstance();
		boolean signUpSucess = userDAO.signUp(userDTO);
		
		if (signUpSucess)
		{
			out.print("<script>alert('회원가입이 완료되었습니다.');");
			out.print("location.href='LoginPage.jsp';</script>");
		}
	%>
	
	<p>아이디: <%= id %>
	<p>비밀번호: <%= pw %>
	<p>닉네임: <%= nick %>
	<p>생년월일: <%= birth %>
	<p>성별: <%= gender %>
	<p>휴대전화: <%= carrier %> <%= phone1 %>-<%= phone2 %>-<%= phone3 %>
</body>
</html>