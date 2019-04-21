<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.model.Content" %>
<%@ page import="com.model.UserBean" %>
<%@ page import="com.Dao.ContentDao" %>
<%session.setMaxInactiveInterval(3600); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="float:left">
		<a href="Landing.jsp">回到Landing</a>
	</div>
	<div width="98%" align="center">
		<h2>所有笔记信息</h2>
	</div>
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
		<tr>
			<td bgcolor="#FFFFFF">标题</td>
			<td bgcolor="#FFFFFF">重要程度</td>
			<td bgcolor="#FFFFFF">发送时间</td>
		</tr>
		<% //这里是用来获取图书集合的
			UserBean user=(UserBean)session.getAttribute("login");
			if(user!=null){
				String name=user.getName();
				ArrayList<Content>List=ContentDao.QueryByName(name);
				if(List==null || List.size()<1){
					out.print("<tr><td bgcolor='#FFFFFF' colspan='6' >不好意思，您还每添加任何笔记信息!</td></tr>");
				}
				else{
					for(Content log: List){
		%>
						<tr align="center">
							<td bgcolor="#FFFFFF"><%=log.getTitle()%></td>
							<td bgcolor="#FFFFFF"><%=log.getDegree()%></td>
							<td bgcolor="#FFFFFF"><%=log.getSendTime() %></td>
							<td bgcolor="#FFFFFF"><a href="DealServlet?id=<%=String.valueOf(log.getId())%>&type=1">查看</a></td>
							<td bgcolor="#FFFFFF"><a href="DealServlet?id=<%=String.valueOf(log.getId())%>&type=2">删除</a></td>
						</tr>
					<% 
						}
					}
				
				}
					%>		 
		</table>
</body>
</html>