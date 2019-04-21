<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
<link href="a.css" rel="stylesheet" type="text/css">
<link href="NewFile.css" rel="stylesheet" type="text/css">
</head>
<script src="https://cdn.bootcss.com/blueimp-md5/2.10.0/js/md5.js"></script>
<script>
	function check(){
		n=document.getElementById('username');
		p1=document.getElementById('inputpassword');
		p2=document.getElementById('inputpassword2');
		r1=/^[0-9a-zA-Z]{3,10}$/;
		r2=/^.{6,20}$/;
		if(r1.test(n.value)&&p1.value===p2.value && r2.test(p1.value)){
			alert(1);
			var md5_pwd=document.getElementById('md5-password');
			alert(md5_pwd.value);
			md5_pwd.value=md5(p1.value);
			alert(md5_pwd.value);
			return true;
		}
		else{
			alert('用户名和密码格式不正确!');
			return false;
		}
	}
</script>
<body>
	<div id="container">
		<ul class="menu">
			<li><a href="index.jsp"><b><span>学习笔记</span></b><em></</em></a></li>
			<li><a href="Login.jsp"><b><span>登陆</span></b><em></em></a>
			<li><a href="Register.jsp"><b><span>注册</span></b><em></em></a></li>
		</ul>
		<div class="user_login">
			<div class="content">
				<form action="RegisterServlet" method="post" onsubmit="return check()">
					<div class="frm_cont username">
						<label for="user_name">用户名:</label><br>
						<input type="text" id="username" name="username" placeholder="用户名必须是3-10位英文字母或数字"/>
					</div>
					<div class="frm_cont userPsw">
						<label for="psw">密  码:</label><br>
						<input type="password" id="inputpassword" name="inputpassword" placeholder="密码必须是6-20位"/>
					</div>
					<div>
						<input type="hidden" id="md5-password" name="password">
					</div>
					<div class="frm_cont usrPsw2">
						<label for="psw2">再次输入:</label><br>
						<input type="password"  id="inputpassword2" name="password2"  placeholder="再次输入密码"/>
					</div>
					<div class="frm_cont usrPsw2">
						<label for="em">E-mail:</label><br>
						<input type="text" name="email" id="email" placeholder="输入邮箱"/>
					</div>
					<div class="btns">
						<input type="submit" id="button" value="注册"/>
					</div>
				</form>
			</div>
			<div>
				<img src="Image/1.jpg" style="margin:0px,5px,5px,5px" height="350px" width="800px"/> 
			</div>
		</div>
	</div>
</body>
</html>