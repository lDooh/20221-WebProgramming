<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.ScheDAO" %>
<%@ page import="DTO.ScheDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일정 삭제 세션</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String id = (String)session.getAttribute("memberId");
		String deleteID = request.getParameter("deleteID");
		
		ScheDAO scheDAO = ScheDAO.getInstance();
		int count = scheDAO.deleteSche(id, deleteID);
		
		if (count == 1)
		{
			out.print("<script>alert('일정 삭제가 완료되었습니다.');");
			out.print("location.href='MainPage.jsp';</script>");
		}
	%>
</body>
</html>