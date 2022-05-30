<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DTO.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정</title>
	<script type="text/javascript">
		function checkModify() {
			var f = document.modifyForm;
			
			var regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
			var regExpNick = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{3,15}$/;
			
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
		}
	</script>
</head>
<body>
	<%
		String modifyID = request.getParameter("modifyID");
		// out.println(modifyID);
		
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO = userDAO.getUserDTO(modifyID);
	%>
	
	<form action="ModifySession.jsp" method="post" name="modifyForm" onsubmit="return checkModify()">
		<fieldset class="fieldset_css">
		<legend class="bold_font">회원 가입</legend>
		ID<br>
		<input type="text" name="userID" value="<%=userDTO.getId()%>" readonly><br>
		PW<br>
		<input type="password" name="userPW" value="<%=userDTO.getPassword()%>"><br>
		PW 재확인<br>
		<input type="password" name="userPW2" value="<%=userDTO.getPassword()%>"><br>
		닉네임<br>
		<input type="text" name="userNick" value="<%=userDTO.getNickname()%>"><br>
		생년월일<br>
		<input type="text" name="userBirth" placeholder="8자리 숫자 입력" value="<%=userDTO.getbd()%>"><br>
		관리자 여부<br>
		<input type="radio" name="managerRadio" value="notManager">사용자
		<input type="radio" name="managerRadio" value="yesManager">관리자
		<br><br>
		
		<div align="center">
			<input type="submit" value="수정">
			<input type="reset" value="취소">
		</div>
	</fieldset>
	</form>
</body>
</html>