<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃...</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		session.invalidate();
	%>
	<script>
		alert("로그아웃 되었습니다.");
	</script>
	<%
		//response.sendRedirect("LoginPage.jsp");
		out.print("<script>location.href='LoginPage.jsp';</script>");
	%>
</body>
</html>