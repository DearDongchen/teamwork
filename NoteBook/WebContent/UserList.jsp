<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.model.Content" %>
<%@ page import="com.model.UserBean" %>
<%@ page import="com.Dao.ContentDao" %>
<%@ page import="com.Dao.ManagerDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div width="98%" align="center">
		<h2>所有用户信息</h2>
	</div>
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
		<tr>
			<td bgcolor="#FFFFFF">用户id</td>
			<td bgcolor="#FFFFFF">用户名称</td>
			<td bgcolor="#FFFFFF">用户密码</td>
		</tr>
		<%//这里是用来显示用户信息的
			ArrayList<UserBean>user_list=ManagerDao.QueryAll();
			for(UserBean user:user_list)
			{
		%>	 
		
				<tr align="center">
					<td bgcolor="#FFFFFF"><%= user.getId()%></td>
					<td bgcolor="#FFFFFF"><%= user.getName()%></td>
					<td bgcolor="#FFFFFF"><%= user.getPassword()%></td>
					<td bgcolor="#FFFFFF"><a href="MDealServlet?id=<%=String.valueOf(user.getId())%>&name=<%=String.valueOf(user.getName())%>">删除</a></td>
				</tr>
				<%
			}
				%>
		</table>
</body>
</html>