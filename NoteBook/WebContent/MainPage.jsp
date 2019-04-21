<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="utf-8"> 
<link rel="stylesheet" type="text/css" href="style/index.css">
<link rel="icon" href="ui/icon.png" type="image/x-icon">

<title>在线学习网站</title> 
</head>
<body>
<div style="width:100%;height:auto;background-image:url(ui/background-all.jpg);background-size:100% 100%">
<div style="width:100%;height:150px;">
    <div style="width:6%;height:150px;float:left">
	<br><br>
	  <img src="ui/index-0.png" width="100%" height="auto" alt="not found">
	</div>
	<div style="width:14%;height:150px;float:left;font-size:26px">
	<br><br>
	  &nbsp;在线学习网站
	</div>
	<div style="text-align:center;width:80%;height:100px;float:left">
	  
	</div>
    <div style="text-align:center;width:15%;height:50px;float:left">
	  <a href="#" id="page" onclick="changetohomepage()">首页</a>
	</div>
    <div style="text-align:center;width:15%;height:50px;float:left">
	  <a href="#" id="class" onclick="changetoclass()">课程</a>
	</div>
	<div style="text-align:center;width:15%;height:50px;float:left">
	  <a href="#" id="discussarea" onclick="changetodiscuss()">讨论区</a>
	</div>
    <div style="text-align:center;width:16%;height:50px;float:right">
	  <a href="#" style="text-decoration:none;color:#000000">登录</a>|
	  <a href="#" style="text-decoration:none;color:#000000">注册</a>
	</div>
	
</div>	


<div style="width:100%;height:auto">
    <div style="float:left;width:20%;height:500px">
		 <div id="navigation">
		    <ul class="list">
			<li class="listtitle">&nbsp;python<div class="titleopen">∧&nbsp;</div><div class="titleclose">∨&nbsp;</div></li>
            <li class="listcontent">&nbsp;1.基础语法</li>
            <li class="listcontent">&nbsp;2.多进程</li>
            <li class="listcontent">&nbsp;3.多线程</li>
            <li class="listcontent">&nbsp;4.窗口视窗</li>
            </ul>
 
            <ul class="list">
			<li class="listtitle">&nbsp;机器学习<div class="titleopen">∧&nbsp;</div><div class="titleclose">∨&nbsp;</div></li>
            <li class="listcontent">&nbsp;1.Reinforcement learning</li>
            <li class="listcontent">&nbsp;2.evolutionary algorithm</li>
            <li class="listcontent">&nbsp;3.神经网络</li>
            <li class="listcontent">&nbsp;4.通用机器学习</li>
			<li class="listcontent">&nbsp;5.计算机视觉</li>
			<li class="listcontent">&nbsp;6.机器学习实战</li>
            </ul>
 
 
           <ul class="list">
		   <li class="listtitle">&nbsp;大数据<div class="titleopen">∧&nbsp;</div><div class="titleclose">∨&nbsp;</div></li>
           <li class="listcontent">&nbsp;1</li>
           <li class="listcontent">&nbsp;2</li>
           <li class="listcontent">&nbsp;3</li>
           
           </ul>
 
           <ul class="list">
		   <li class="listtitle">&nbsp;工具<div class="titleopen">∧&nbsp;</div><div class="titleclose">∨&nbsp;</div></li>
           <li class="listcontent">&nbsp;1</li>
           <li class="listcontent">&nbsp;2</li>
           <li class="listcontent">&nbsp;3</li>
           
           </ul>
		 
		 </div>
    </div>
    <div id="homepage">       
	    <div class="wrapper">
            <div class="banner"><!-- 轮播部分 -->
            <ul class="imgList"><!-- 图片部分 -->
                <li class="imgOn"><img src="ui/1.jpg" width="100%" height="500px" alt="not found"></li>
            <li><img src="ui/2.jpg" width="100%" height="500px" alt="not found"></li>
            <li><img src="ui/3.jpg" width="100%" height="500px" alt="not found"></li>
            <li><img src="ui/4.jpg" width="100%" height="500px" alt="not found"></li>
            <li><img src="ui/5.jpg" width="100%" height="500px" alt="not found"></li>
            </ul>
            <div class="bg"></div> <!-- 底部背景层-->
            <ul class="infoList"><!-- 左下角文字信息 -->
                <li class="infoOn">puss in boots1</li>
                <li>puss in boots2</li>
                <li>puss in boots3</li>
                <li>puss in boots4</li>
                <li>puss in boots5</li>
            </ul>
            <ul class="indexList"><!-- 序号 -->
                <li class="indexOn">●</li>
                <li>●</li>
                <li>●</li>
                <li>●</li>
                <li>●</li>
            </ul>
            </div>
        </div>
	</div>
	<div id="course">
	    <div style="opacity:0.6;width:60%;height:90px;padding-left:40%;padding-top:40px;background-color:#FEF6E8;">
		    <div style="float:left;width:auto;height:auto">
			<img src="ui/course-0.png" width="50px" height="auto" alt="not found">
		    </div>
			<div style="width:80%;height:60px;float:left;font-size:24px;padding-top:5px;">&nbsp;精品好课</div>
		</div>
		<div class="coursedetail">
		    <img src="ui/course-1.jpg" width="100%" height="auto" alt="not found">
			<div class="word"><br>python入门</div>
		</div>
		<div class="coursedetail">
		    <img src="ui/course-2.jpg" width="100%" height="auto" alt="not found">
			<div class="word"><br>机器学习</div>
		</div>
		<div class="coursedetail">
		    <img src="ui/course-3.jpg" width="100%" height="auto" alt="not found">
			<div class="word"><br>人工智能</div>
		</div>
	</div>
	<div id="discuss">
	    <div style="opacity:0.6;width:60%;height:90px;padding-left:40%;padding-top:40px;background-color:#FEF6E8;">
		    <div style="float:left;width:auto;height:auto">
			<img src="ui/discuss-0.png" width="50px" height="auto" alt="not found">
		    </div>
			<div style="width:80%;height:60px;float:left;font-size:24px;padding-top:5px;">&nbsp;讨论区</div>
		</div>
		<div class="coursedetail">
		    <img src="ui/discuss-1.jpg" width="100%" height="auto" alt="not found">
			<div class="word"><br>python工程师</div>
		</div>
		<div class="coursedetail">
		    <img src="ui/discuss-2.png" width="100%" height="auto" alt="not found">
			<div class="word"><br>数据分析师</div>
		</div>
		<div class="coursedetail">
		    <img src="ui/discuss-3.png" width="100%" height="auto" alt="not found">
			<div class="word"><br>机器学习工程师</div>
		</div>
	</div>
    <div style="float:right;width:20%;height:500px">  	
        <div id="find">
		    <ul class="list">
			<li class="listtitle" style="text-align:center">&nbsp;发现</li>
            </ul>
 
            <ul class="list">
			<li class="listtitle">&nbsp;快速链接<div class="titleopen">∧&nbsp;</div><div class="titleclose">∨&nbsp;</div></li>
            <li class="listcontent">&nbsp;<a href="#">谷歌</a></li>
            <li class="listcontent">&nbsp;<a href="https://www.baidu.com">百度</a></li>
            <li class="listcontent">&nbsp;<a href="https://www.sohu.com">搜狐</a></li>
            </ul>
 
 
           <ul class="list">
		   <li class="listtitle">&nbsp;优秀文档<div class="titleopen">∧&nbsp;</div><div class="titleclose">∨&nbsp;</div></li>
           <li class="listcontent">&nbsp;1</li>
           <li class="listcontent">&nbsp;2</li>
           <li class="listcontent">&nbsp;3</li>
           
           </ul>
 
           <ul class="list">
		   <li class="listtitle">&nbsp;学习资料<div class="titleopen">∧&nbsp;</div><div class="titleclose">∨&nbsp;</div></li>
           <li class="listcontent">&nbsp;1</li>
           <li class="listcontent">&nbsp;2</li>
           <li class="listcontent">&nbsp;3</li>
           
           </ul>
		 
		 </div>
    </div>
	<!--清除浮动-->
	<div style="height:0px;clear: both;overflow:hidden;"></div>  
</div>

<div style="opacity:0.6;width:100%;height:40px;text-align:center;padding-top:20px;background-color:#FEF6E8">
      版权所有&copy;python学习网站
</div>
</div>

<script type="text/javascript" src="style/index.js"></script>
</body>

</html>

