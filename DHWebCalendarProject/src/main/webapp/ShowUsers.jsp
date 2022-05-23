<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DTO.UserDTO" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 목록</title>
	<script type="text/javascript">
		function del(delId)
		{
			alert(delId);
		}
	</script>
</head>
<body>
	<table border="1">
		<tr>
			<th>id</th>
			<th>password</th>
			<th>nickname</th>
			<th>birthDay</th>
			<th>gender</th>
			<th>callNum</th>
			<th>삭제</th>
		</tr>
		<%
			UserDAO userDAO = UserDAO.getInstance();
			UserDTO[] userDTO = userDAO.getUsers();
			
			for (int i = 0; i < userDTO.length; i++)
			{
				out.print("<tr><td id=uid" + i + ">");
				out.print(userDTO[i].getId() + "</td><td>"
						+ userDTO[i].getPassword() + "</td><td>"
						+ userDTO[i].getNickname() + "</td><td>"
						+ userDTO[i].getbd() + "</td><td>"
						+ userDTO[i].getGender() + "</td><td>"
						+ userDTO[i].getCallNum() + "</td><td>"
						+ "<a href=\"javascript:del('" + userDTO[i].getId() + "');\">X</a>");
				out.print("</td></tr>");
			}
		%>
	</table>
</body>
</html>