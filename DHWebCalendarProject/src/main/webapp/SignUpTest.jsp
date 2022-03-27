<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 테스트</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("userID");
		String pw = request.getParameter("userPW");
		String nick = request.getParameter("userNick");
		String birth = request.getParameter("userBirth");
		String sex = request.getParameter("userSex");
		String phone = request.getParameter("userPhone");
	%>
	<p>아이디: <%= id %>
	<p>비밀번호: <%= pw %>
	<p>닉네임: <%= nick %>
	<p>생년월일: <%= birth %>
	<p>성별: <%= sex %>
	<p>휴대전화: <%= phone %>
</body>
</html>