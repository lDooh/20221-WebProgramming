<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일정 추가</title>
	<link rel="stylesheet" href="/CSS/loginCss.css">
	<script type="text/javascript">
		function checkAddSche() {
			var f = document.addScheForm;
			
			var regExpTitle = /^.{2,10}$/;
			var regExpContent = /^.{2,90}$/;
			
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
	%>
	<form action="#" method="post" name="addScheForm" onsubmit="return checkAddSche()">
	<fieldset class="fieldset_css">	
		<legend>일정 추가</legend>
		<select name="scheduleYear">
			<option value="choice">년</option>
			<%
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
				for (int i = 1; i <= lastday; i++)
				{
					out.print("<option value = " + i +  ">" + i + "</option>");
				}
			%>
		</select><br><br>
		제목&nbsp;<input type="text" name="scheTitle"><br><br>
		<textarea name="content" cols="30" rows="3">
		</textarea><br>
		<div align="center">
			<input type="submit" value="추가">
			<input type="button" value="취소">
		</div>
	</fieldset>
	</form>
</body>
</html>