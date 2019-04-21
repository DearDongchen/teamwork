<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<link href="a.css" rel="stylesheet" type="text/css">
</head>
<!--
<style type="text/css">
body{
	background-image:url(Image/1.jpg);
	height:600px;
	width:800px;
	background-size:80% 80%;
}
</style>
  -->
<body id="Index">
	<!-- 
	<h1>Learning Log</h1>
	<p>Learning Log helps you keep track of your learning, for any topic you're learning about</p>
	<a href="Login.jsp">登陆</a>
	<a href="Register.jsp">注册</a>
	<a href="index.jsp">退出</a>
	-->
	<div id="container">
		<ul class="menu">
			<li><a href="index.jsp"><b><span>学习笔记</span></b><em></</em></a></li>
			<li><a href="Login.jsp"><b><span>登陆</span></b><em></em></a>
			<li><a href="Register.jsp"><b><span>注册</span></b><em></em></a></li>
		</ul>
		<div id="pageHeader" style="width:100%; height:130px">
			<h1 align="center" style="Font-size:50px"><span>Learning Log</span></h1>
		</div>
		<div id="content">
			<p class="p1"><span>Register and account to make your own Learning Log, and list
			the topics you're learning about.</span></p>
			<p class="p2"><span>Whenever yout learn something new about a topic, make an entry
			Summarizing what you've learned</span></p>
		</div>
		<div>
			<img src="Image/1.jpg" style="margin:0px,5px,5px,5px" height="350px" width="800px"/> 
		</div>
	</div>
</body>
</html>