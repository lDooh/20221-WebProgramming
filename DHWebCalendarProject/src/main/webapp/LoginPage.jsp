<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DH Calendar</title>
	<link rel="stylesheet" href="/CSS/loginCss.css">
	<script type="text/javascript">
		function checkSignIn() {
			var f = document.login_form;
			
			var regExpId = /^[a-zA-Z0-9]{4,20}$/;
			var regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
			
			if (!regExpId.test(f.userID.value))
			{
				alert("올바른 아이디를 입력해주세요.");
				f.userID.focus();
				return false;
			}
			
			if (!regExpPw.test(f.userPW.value))
			{
				alert("올바른 비밀번호를 입력해 주세요.");
				f.userPW.focus();
				return false;
			}
		}
	</script>
</head>
<body>
	<form action="LoginSession.jsp" method="post" name="login_form" onsubmit="return checkSignIn()">
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