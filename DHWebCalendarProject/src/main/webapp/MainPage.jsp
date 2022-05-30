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
		String u_id = (String)session.getAttribute("memberId");
		String u_nickname = (String)session.getAttribute("nickname");
		
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();	// 1~31
		int day = now.getDayOfMonth();		// 1~12
		int dow = now.getDayOfWeek().getValue();	// 월요일1, 화요일2~
	%>
	<div class="info">
		<div>
			<p>회원정보</p>
			<p><%= u_nickname %></p>
		</div>
		<form method="post" action="LogoutSession.jsp">
			<input type="submit" value="로그아웃">
		</form>
	</div>
	<div class="cal">
		<table class="calBorder">
			<tr>
				<th colspan="7" class="calBorder"><%=year%>년 <%=month%>월</th>
			</tr>
			<tr>
				<td class="calBorder">일</td>
				<td class="calBorder">월</td>
				<td class="calBorder">화</td>
				<td class="calBorder">수</td>
				<td class="calBorder">목</td>
				<td class="calBorder">금</td>
				<td class="calBorder">토</td>
			</tr>
			<tr>
			<%
				now = now.of(year, month,1);
				int lastday = now.lengthOfMonth();		// 이번달 말일
				int sDow = now.getDayOfWeek().getValue();
				
				// 1일 위치 맞추기
				for (int i = 0; i < sDow % 7; i++)
				{
					out.print("<td class='calBorder'></td>");
				}
				sDow += 1;
				
				// 1일부터 말일까지 출력
				for (int i = 1; i <= lastday; i++, sDow++)
				{
					out.print("<td class='calBorder'>" + i + "</td>");
					
					// 토요일 출력 후 줄바꿈
					if (sDow % 7 == 0)
					{
						out.print("</tr><tr>");
					}
				}
			%>
			</tr>
		</table>

		<input type="button" value="일정 추가" onclick="location.href='addSchedule.jsp'">		
	</div>
</body>
</html>
