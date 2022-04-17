<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DH Calendar</title>
	<link rel="stylesheet" href="/CSS/loginCss.css">
</head>
<body>
	<%
		String u_id = (String)session.getAttribute("memberId");
		String u_pw = (String)session.getAttribute("memberPw");
	%>
	<div class="info">
		<div>
			<p>회원정보</p>
			<p><%= u_id %></p>
		</div>
		<form method="post" action="LogoutSession.jsp">
			<input type="submit" value="로그아웃" onClick="logoutFunc()">
		</form>
	</div>
</body>
</html>