<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>DH Calendar</title>
	<link rel="stylesheet" href="/CSS/loginCss.css">
</head>
<body>
	<form action="#" method="post" name="loginForm">
	<fieldset class="fieldset_css">
		<legend class="bold_font">로그인</legend>
		ID<br>
		<input type="text" name="userID"><br>
		PW<br>
		<input type="password" name="userPW"><br><br>
		
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='SignUpPage.jsp'">
	</fieldset>
	</form>
</body>
</html>