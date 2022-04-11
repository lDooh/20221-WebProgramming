<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인...</title>
</head>
<body>
	<%
		String u_id = request.getParameter("userID");
		String u_pw = request.getParameter("userPW");
		
		// TODO: DB 연동 전 임시 ID & PW
		if (u_id.equals("imsiid") && u_pw.equals("qwer1234!"))
		{
			session.setAttribute("memberId", u_id);
			session.setAttribute("memberPw", u_pw);
			
			session.setMaxInactiveInterval(60 * 15);	// 세션 유효시간 15분 설정
			
			out.println("세션 생성<br>");
		}
		else
		{
			out.println("세션 생성 실패");
		}
	%>
	
</body>
</html>