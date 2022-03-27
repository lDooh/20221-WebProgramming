<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>DH 캘린더 회원가입</title>
<link rel="stylesheet" href="/CSS/loginCss.css">
</head>
<body>
	<form action="SignUpTest.jsp" method="post" name="login_form">
	<fieldset class="fieldset_css">
		<legend class="bold_font">회원 가입</legend>
		ID<br>
		<input type="text" name="userID"><br>
		PW<br>
		<input type="password" name="userPW"><br>
		PW 재확인<br>
		<input type="password" name="userPW2"><br>
		닉네임<br>
		<input type="text" name="userNick"><br>
		생년월일<br>
		<input type="text" name="userBirth"><br>
		성별<br>
		<input type="radio" name="userSex">남자
		<input type="radio" name="userSex">여자<br>
		휴대전화<br>
		<input type="text" name="userPhone"><br><br>
		
		<div align="center">
			<input type="submit" value="가입">
			<input type="reset" value="취소">
		</div>
	</fieldset>
	</form>
</body>
</html>