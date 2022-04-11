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
		<!--  TODO: 유저 정보, 세션 유지 시간(실시간), 로그아웃 버튼 -->
	</div>
</body>
</html>