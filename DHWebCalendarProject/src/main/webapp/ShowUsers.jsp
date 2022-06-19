<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DTO.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 목록</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("memberId");
		int pageNum;
		
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO[] userDTO = userDAO.getUsers();
		
		// 페이지 번호 받아오기
		if (request.getParameter("pageNum") == null)
		{
			pageNum = 1;
		}
		else
		{
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			if (pageNum <= 0)
			{
				pageNum = 1;
			}
			if (pageNum * 5 > userDTO.length)
			{
				pageNum = userDTO.length % 5 + 1;
			}
		}
		
		// 세션이 없으면 로그인 페이지로 이동
		if (id == null)
			out.print("<script>location.href='LoginPage.jsp';</script>");
		else	// 관리자 계정이 아니라면 메인 페이지로 이동
			if (!userDAO.getUserDTO(id).getManager())
				out.print("<script>location.href='MainPage.jsp';</script>");
	%>
	
	<table border="1">
		<tr>
			<th>num</th>
			<th>id</th>
			<th>password</th>
			<th>nickname</th>
			<th>birthDay</th>
			<th>gender</th>
			<th>callNum</th>
			<th>manager</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
			if (userDTO != null)
				for (int i = 0; i < 5; i++)
				{
					int j = i + (pageNum - 1) * 5;
					if (j < userDTO.length)
					{
						out.print("<tr><td id=uid" + j + ">");
						out.print(j + 1 + "</td><td>"
								+ userDTO[j].getId() + "</td><td>"
								+ userDTO[j].getPassword() + "</td><td>"
								+ userDTO[j].getNickname() + "</td><td>"
								+ userDTO[j].getbd() + "</td><td>"
								+ userDTO[j].getGender() + "</td><td>"
								+ userDTO[j].getCallNum() + "</td><td>"
								+ userDTO[j].getManager() + "</td><td>"
								+ "<a href=ModifyUser.jsp?modifyID=" + userDTO[j].getId() + ">□</a></td><td>"
								+ "<a href=DeleteUser.jsp?deleteID=" + userDTO[j].getId() + ">X</a>");
						out.print("</td></tr>");
					}
				}
		%>
	</table>
	<a href="ShowUsers.jsp?pageNum=<%=1%>">처음</a>
	<a href="ShowUsers.jsp?pageNum=<%=pageNum - 1%>">이전</a>
	<a href="ShowUsers.jsp?pageNum=<%=pageNum + 1%>">다음</a>
	<a href="ShowUsers.jsp?pageNum=<%=userDTO.length % 5 + 1%>">마지막</a><br>
	<%
		for (int i = 0; i < userDTO.length % 5 + 1; i++)
		{
			out.print("<a href=ShowUsers.jsp?pageNum=" + (i + 1) +  ">" + (i + 1) + "</a>&nbsp;&nbsp;");
		}
	%>
	<br>
	<form action="SearchUser.jsp" method="post" name="searchForm">
		<input type="radio" name="searchType" value="searchByID">ID
		<input type="radio" name="searchType" value="searchByNickname">nickname
		<input type="radio" name="searchType" value="searchByCallNum">callNum<br><br>
		<input type="text" name="searchNick">&nbsp;
		<input type="submit" value="검색"> 
	</form>
	<br>
	<input type="button" value="로그아웃" onClick="location.href='LogoutSession.jsp'">
</body>
</html>