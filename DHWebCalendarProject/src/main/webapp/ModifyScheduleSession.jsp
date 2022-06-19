<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.ScheDAO" %>
<%@ page import="DTO.ScheDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일정 수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");		
		String id = (String)session.getAttribute("memberId");
		String scheduleID = request.getParameter("scheID");
		
		String year = request.getParameter("scheduleYear");
		String month = request.getParameter("scheduleMonth");
		if (month.length() == 1)
			month = "0".concat(month);
		String day = request.getParameter("scheduleDay");
		if (day.length() == 1)
			day = "0".concat(day);
		String title = request.getParameter("scheduleTitle");
		String content = request.getParameter("content");
		
		ScheDAO scheDAO = ScheDAO.getInstance();
		ScheDTO scheDTO = scheDAO.getScheduleDTO(id, scheduleID);
		
		scheDTO.setTitle(title);
		scheDTO.setScheduleDate(year + month + day);
		scheDTO.setContent(content);
		
		int count = scheDAO.modifySche(scheDTO);
		
		if (count == 1)
		{
			out.print("<script>alert('일정 수정이 완료되었습니다.');");
			out.print("location.href='MainPage.jsp';</script>");
		}
	%>
</body>
</html>