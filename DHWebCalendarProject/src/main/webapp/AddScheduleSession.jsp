<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.ScheDAO" %>
<%@ page import="DTO.ScheDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 추가 세션</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		ScheDAO scheDAO = ScheDAO.getInstance();
	
		String id = (String)session.getAttribute("memberId");
		
		int scheduleID = scheDAO.getScheduleNumber(id) + 1;
		String year = request.getParameter("scheduleYear");
		String month = request.getParameter("scheduleMonth");
		if (month.length() == 1)
			month = "0".concat(month);
		String day = request.getParameter("scheduleDay");
		if (day.length() == 1)
			day = "0".concat(day);
		String title = request.getParameter("scheduleTitle");
		String content = request.getParameter("content");
		
		ScheDTO scheDTO = new ScheDTO(id, scheduleID, title, year + month + day, content);
		
		boolean addScheduleSucess = scheDAO.addSchedule(scheDTO);
		
		if (addScheduleSucess)
		{
			out.print("<script>alert('일정 추가가 완료되었습니다.');");
			out.print("location.href='MainPage.jsp';</script>");
		}
	%>
	
	<p>완 <%= id %>
</body>
</html>