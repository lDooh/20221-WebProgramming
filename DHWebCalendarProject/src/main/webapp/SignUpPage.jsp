<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DH 캘린더 회원가입</title>
	<link rel="stylesheet" href="/CSS/loginCss.css">
	<script type="text/javascript">
		function checkSignUp() {
			var f = document.loginForm;
			
			var regExpId = /^[a-zA-Z0-9]{4,20}$/;
			var regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
			var regExpNick = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{3,15}$/;
			
			if (!regExpId.test(f.userID.value))
			{
				alert("아이디는 영문 대/소문자와 숫자 4~20자리를 입력해주세요.");
				f.userID.focus();
				return false;
			}
			
			if (!regExpPw.test(f.userPW.value))
			{
				alert("비밀번호는 8자리~16자리 숫자, 영문, 특수문자를 1개 이상 포함해주세요.");
				f.userPW.focus();
				return false;
			}
			if (f.userPW.value != f.userPW2.value)
			{
				alert("비밀번호가 일치하지 않습니다.");
				f.userPW2.focus();
				return false;
			}
			
			if (!regExpNick.test(f.userNick.value)) {
				alert("닉네임은 특수문자 금지 3~15자 이내로 입력해주세요.");
				f.userNick.focus();
				return false;
			}
			
			if (isNaN(f.userBirth.value) || (f.userBirth.value.length != 8))
			{
				alert("6자리 숫자로 생년월일을 입력해 주세요.");
				f.userBirth.focus();
				return false;
			}
			
			if (document.querySelector('input[name="userGender"]:checked') == null)
			{
				alert("성별을 선택해 주세요.");				
				return false;
			}
			
			if (f.mobileCarrier.value == "choice")
			{
				alert("통신사를 선택해 주세요.");
				f.mobileCarrier.focus();
				return false;
			}
			if (!/^[0-9]{3}$/.test(f.phone1.value) || 
					!/^[0-9]{4}$/.test(f.phone2.value) || 
					!/^[0-9]{4}$/.test(f.phone3.value))
			{
				alert("올바른 번호를 입력해 주세요.");
				f.phone1.focus();
				return false;
			}
		}
	</script>
</head>
<body>
	<form action="SignUpSession.jsp" method="post" name="loginForm" onsubmit="return checkSignUp()">
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
		<input type="text" name="userBirth" placeholder="8자리 숫자 입력"><br>
		성별<br>
		<input type="radio" name="userGender" value="남자">남자
		<input type="radio" name="userGender" value="여자">여자<br>
		휴대전화<br>
		<select name="mobileCarrier" class="carrier_css">
			<option value="choice">선택</option>
			<option value="SKT">SKT</option>
			<option value="KT">KT</option>
			<option value="LGU+">LGU+</option>
		</select>
		<input type="text" maxlength="3" size="3" name="phone1">
		<input type="text" maxlength="4" size="4" name="phone2">
		<input type="text" maxlength="4" size="4" name="phone3"><br><br>
		
		<div align="center">
			<input type="submit" value="가입">
			<input type="reset" value="취소">
		</div>
	</fieldset>
	</form>
</body>
</html>