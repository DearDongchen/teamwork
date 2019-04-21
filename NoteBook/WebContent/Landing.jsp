<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%session.setMaxInactiveInterval(3600); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登陆成功</title>
</head>
<style type="text/css">
ul{
	padding:0;
	margin:0;
	list-style:none;
	border-bottom:1px dashed #aaa;
	width:20em;
}
li{
	padding:1em;
	border-top:1px dashed #aaa;
}
li a{
	display:block;
	padding-left:1.5em;
	background:url(Image/arrow3.gif) right no-repeat;
	text-decoration:none;
	font:bold 15px;
}
li a:link{
	background:url(Image/arrow3.gif) right center no-repeat;
}
li a:visited{
	background:url(Image/arrow8.gif) right center no-repeat;
}
li a:hover{
	background:url(Image/arrow4.gif) left center no-repeat;
}
body{
	background:	#F8F8FF;
}
p,span{
	font:bold 20px helvetica, arial, sans-serif;
	color:red;
	text-shadow:0 0 4px white,
		0 -5px 4px #ff3,
		2px -10px 6px #fd3,
		-2px -15px 11px #f80,
		2px -25px 18px #f20;
}

h1,h2{
	font:bold 40px helvetica, arial, sans-serif;
	color:red;
	text-shadow:0 0 4px white,
		0 -5px 4px #ff3,
		2px -10px 6px #fd3,
		-2px -15px 11px #f80,
		2px -25px 18px #f20;	
}

</style>
<body style="background:#000">
	<%
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		String date=df.format(new Date());
		session.setMaxInactiveInterval(3600);
	%>
	<div class="LandingBox">
		<!-- 标题 -->
		<h1>亲爱的<%=request.getSession().getAttribute("name") %></h1>
		<h2>您已成功登陆Learning Log</h2>
		<!-- 相关信息 -->
		<div class="Info">
			<span class="date"><%=date%></span> <span><a href="#">糖糖科技</a></span>
			<br><br>
		</div>
		<!-- 功能介绍 -->
		<div class="summary">
			<p>Learning Log可以帮助您管理您的笔记，如果您在操作过程种遇到任何问题，可以联系客服</p>
			<p>客服人员:唐一钧 &nbsp; &nbsp; &nbsp; &nbsp;联系电话:15524509248</p>
			<br><br>
		</div>
		<div class="Select">
			<h2 style="display:block">接下来请选择您的操作:</h2>
			<ul>
				<li><a href="LogList.jsp">查看笔记列表</a></li>
				<li><a href="Content.jsp">添加我的笔记</a></li>
				<li><a href="index.jsp">退出登陆</a></li>
			</ul>
		</div>
	</div>
</body>
</html>