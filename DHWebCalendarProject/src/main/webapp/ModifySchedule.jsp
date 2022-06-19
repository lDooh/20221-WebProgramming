<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="DAO.ScheDAO" %>
<%@ page import="DTO.ScheDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일정 수정 페이지</title>
	<link rel="stylesheet" href="./CSS/loginCss.css">
	<script type="text/javascript">
		function checkAddSche() {
			var f = document.addScheForm;
			
			var regExpTitle = /^.{2,10}$/;
			var regExpContent = /^.{2}$/;
			
			if (!regExpTitle.test(f.scheTitle.value))
			{
				alert("일정 제목은 2~10자로 입력해주세요.");
				f.scheTitle.focus();
				return false;
			}
			if (!regExpTitle.test(f.content.value))
			{
				alert("일정 내용은 2자 이상 입력해주세요.");
				f.content.focus();
				return false;
			}
		}
	</script>
</head>
<body>
	<%
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();	// 1~31
		int day = now.getDayOfMonth();		// 1~12
		int dow = now.getDayOfWeek().getValue();	// 월요일1, 화요일2~
		
		now = now.of(year, month,1);
		int lastday = now.lengthOfMonth();		// 이번달 말일
		int sDow = now.getDayOfWeek().getValue();
		
		request.setCharacterEncoding("UTF-8");		
		String id = (String)session.getAttribute("memberId");
		String scheduleID = request.getParameter("modifyID");
		
		ScheDAO scheDAO = ScheDAO.getInstance();
		ScheDTO scheDTO = scheDAO.getScheduleDTO(id, scheduleID);
	%>
	<form action="ModifyScheduleSession.jsp?scheID=<%=scheduleID%>" method="post" name="modifyScheForm" onsubmit="return checkAddSche()">
	<fieldset class="fieldset_css">	
		<legend>일정 수정</legend>
		<select name="scheduleYear">
			<option value="choice">년</option>
			<%
				// TODO: 일정 날짜 콤보박스에서 select한 상태로
				// 10년 전부터 10년(9년) 후까지 일정 추가 가능
				for (int i = year - 10; i < year + 10; i++)
				{
					out.print("<option value = " + i +  ">" + i + "</option>");
				}
			%>
		</select>
		
		<select name="scheduleMonth">
			<option value = "choice">월</option>
			<%
			for (int i = 1; i <= 12; i++)
			{
				out.print("<option value = " + i +  ">" + i + "</option>");
			}
			%>
		</select>
		
		<select name="scheduleDay">
			<option value="choice">일</option>
			<%
				// TODO: 선택한 년, 월에 맞춰서 일수 출력하기
				for (int i = 1; i <= lastday; i++)
				{
					out.print("<option value = " + i +  ">" + i + "</option>");
				}
			%>
		</select><br><br>
		제목&nbsp;<input type="text" name="scheduleTitle" value="<%=scheDTO.getTitle()%>"><br><br>
		<textarea name="content" cols="30" rows="3">
		<%=scheDTO.getContent() %>
		</textarea><br>
		<div align="center">
			<input type="submit" value="수정">
			<input type="button" value="취소" onclick="location.href='MainPage.jsp'">
		</div>
	</fieldset>
	</form>
</body>
</html>