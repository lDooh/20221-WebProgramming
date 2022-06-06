<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DH Calendar</title>
	<link rel="stylesheet" href="/CSS/loginCss.css">
</head>
<body>
	<%
		String id = (String)session.getAttribute("memberId");
		String nickname = (String)session.getAttribute("nickname");
		
		if (id == null)
			out.print("<script>location.href='LoginPage.jsp';</script>");
		
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();	// 1~31
		int day = now.getDayOfMonth();		// 1~12
		int dow = now.getDayOfWeek().getValue();	// 월요일1, 화요일2~
	%>
	<div class="info">
		<div>
			<p>회원정보</p>
			<p><%= nickname %></p>
		</div>
		<form method="post" action="LogoutSession.jsp">
			<input type="submit" value="로그아웃">
		</form>
	</div>
	<div class="cal">
		<table class="calBorder">
			<tr>
				<th colspan="7" class="calBorder cal"><%=year%>년 <%=month%>월</th>
			</tr>
			<tr>
				<td class="calBorder cal">일</td>
				<td class="calBorder cal">월</td>
				<td class="calBorder cal">화</td>
				<td class="calBorder cal">수</td>
				<td class="calBorder cal">목</td>
				<td class="calBorder cal">금</td>
				<td class="calBorder cal">토</td>
			</tr>
			<tr>
			<%
				now = now.of(year, month,1);
				int lastday = now.lengthOfMonth();		// 이번달 말일
				int sDow = now.getDayOfWeek().getValue();
				
				// 1일 위치 맞추기
				for (int i = 0; i < sDow % 7; i++)
				{
					out.print("<td class='calBorder cal'></td>");
				}
				sDow += 1;
				
				// 1일부터 말일까지 출력
				for (int i = 1; i <= lastday; i++, sDow++)
				{
					out.print("<td class='calBorder cal'>" + i + "</td>");
					
					// 토요일 출력 후 줄바꿈
					if (sDow % 7 == 0)
					{
						out.print("</tr><tr>");
					}
				}
			%>
			</tr>
		</table>
		<br>
		<div align="center">
			<input type="button" value="일정 추가" onclick="location.href='AddSchedule.jsp'">
		</div>
	</div>
</body>
</html>
