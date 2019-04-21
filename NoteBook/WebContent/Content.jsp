<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%session.setMaxInactiveInterval(3600); %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>提交页面</title>
    <style>
        body {
            background-image: url(Image/1.png);
            /* background-color:#b0c4de; */
            background-repeat: repeat-x;
            margin:0px;
            boeder:0px;
            padding:0px;
            text-align:center;
        }

        a:link {
            color: #FFFFFF;
            text-decoration: none;
        }

        /* 未访问链接*/
        a:visited {
            color: #000000;
            text-decoration: none;
        }

        /* 已访问链接 */
        a:hover {
            color: #4933c2;
            text-decoration: underline;
            font-size: 150%;
        }

        /* 鼠标移动到链接上 */

        .title {
            /* border: 1px solid black; */
            text-align: center;
            margin-top: 10px;
            position: relative;
            width: 100%;
        }

        #learn {
            font-family: verdana;
            font-size: 85px;
            color: #660066;
            content: 0px;
            padding: 0px;
            margin-top: 20px;
            margin-bottom: 0px;
            text-decoration: blink;
        }

        .input{
            float:left;
        }

        input[type=text] {
            width: 200px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 25px;
            background-color: white;
            background-position: 5px 10px;
            background-repeat: no-repeat;
            padding: 5px 5px 5px 20px;
            -webkit-transition: width 0.4s ease-in-out;
            transition: width 0.4s ease-in-out;
        }

        .biji {
            /* position: relative; */
            width:100%;
            margin-bottom: 50px;
            float: left;
        }

        .biji h1 {
            top: 50;
        }

        input[type=text]:focus {
            width: 300px;
        }

        /* div {
    background-color: lightgrey;
    width: 300px;
    border: 25px solid rgb(213, 233, 213);
    padding: 25px;
    margin: 25px;
    outline-style: dotted;
    margin-top:100px;
    } */

        #overflowTest {
            background: #4CAF50;
            color: black;
            padding: 15px;
            width: 80%;
            height: 100px;
            overflow: scroll;
            border: 1px solid #ccc;
            float: right
        }

        .textarea {
			margin-left:auto;
			margin-right:auto;
            margin-top: 20px;
            width:60%;
            /* text-align: center; */
          
            /* position: relative; */
            
            font-family: 'Times New Roman', Times, serif
        }

        #degree {
            margin-top: 10px;
            margin-bottom: 10px;
            float: right;
            display: inline-block;
        }

        .button {
            margin-left: 1000px;
            position: absolute;
            float: right;
            display: inline-block;
        }

        #Side a {
            position: absolute;
            left: -140px;
            transition: 0.3s;
            padding: 20px;
            width: 140px;
            text-decoration: none;
            font-size: 24px;
            color: white;
            border-radius: 0 8px 8px 0;
        }
        
        #Side a:hover {
            left: 0;
        }
        #Zhuye {
            top: 40px;
            background-color: #df2c14;
        }
        #Articles {
            top: 120px;
            background-color: rgb(8, 105, 76);
        }
        #Contact {
            top: 200px;
            background-color: #0f0ca1;
        }
        #Other {
            top: 280px;
            background-color: rgb(34, 30, 30)
        }

        /* 风车效果  */
        .sun {
            width: 60px;
            height: 60px;
            border-radius: 360px;
            background: white;
            right: 100px;
            top: -120px;
            position: absolute;
            animation-name: sunrise;
            animation-duration: 1s;
            animation-timing-function: ease;
            animation-iteration-count: 1;
            animation-direction: normal;
            animation-delay: .10;
            animation-play-state: running;
            animation-fill-mode: forwards;
        }

        @keyframes sunrise {

            0% {
                top: -120px;
            }

            25% {
                top: 19px;
                right: 40px;
            }

            50% {
                top: 25px;
                right: 40px;
            }

            100% {
                top: 18px;
                right: 40px;
            }

        }

        .wmd1 {
            -webkit-transform: scale(.6);
            position: absolute;
            top: 300px;
            left: 6px;
            perspective: 1000px;
        }

        .base {}

        .blades {
            width: 350px;
            height: 350px;
            left: 10%;
            top: 10%;
            z-index: 2;
            border-radius: 50%;
            position: absolute;
            margin-top: -30px;
            margin-left: 50px;

            animation: spin 6s linear infinite;
        }

        .blade1 {
            background: white;
            position: absolute;
            width: 41px;
            height: 139px;
            top: -10px;
            left: 150.5px;
            transform: rotate(0deg);
            display: inline-block;
            background:
                linear-gradient(135deg, transparent 20px, white 0),
                linear-gradient(225deg, transparent 20px, white 0),
                linear-gradient(315deg, transparent 20px, white 0),
                linear-gradient(45deg, transparent 20px, white 0);
            background-position: top left, top right, bottom right, bottom left;
            background-size: 50% 50%;
            background-repeat: no-repeat;
        }

        .blade2 {
            background: white;
            position: absolute;
            width: 41px;
            height: 139px;
            top: 105.5px;
            left: 41px;
            transform: rotate(-90deg);
            display: inline-block;
            background:
                linear-gradient(135deg, transparent 20px, white 0),
                linear-gradient(225deg, transparent 20px, white 0),
                linear-gradient(315deg, transparent 20px, white 0),
                linear-gradient(45deg, transparent 20px, white 0);
            background-position: top left, top right, bottom right, bottom left;
            background-size: 50% 50%;
            background-repeat: no-repeat;
        }

        .blade3 {
            background: white;
            position: absolute;
            width: 41px;
            height: 139px;
            top: 105.5px;
            right: 41px;
            transform: rotate(-270deg);
            display: inline-block;
            background:
                linear-gradient(135deg, transparent 20px, white 0),
                linear-gradient(225deg, transparent 20px, white 0),
                linear-gradient(315deg, transparent 20px, white 0),
                linear-gradient(45deg, transparent 20px, white 0);
            background-position: top left, top right, bottom right, bottom left;
            background-size: 50% 50%;
            background-repeat: no-repeat;
        }

        .blade4 {
            background: white;
            position: absolute;
            width: 41px;
            height: 139px;
            bottom: -10px;
            left: 150.5px;
            transform: rotate(180deg);
            display: inline-block;
            background:
                linear-gradient(135deg, transparent 20px, white 0),
                linear-gradient(225deg, transparent 20px, white 0),
                linear-gradient(315deg, transparent 20px, white 0),
                linear-gradient(45deg, transparent 20px, white 0);
            background-position: top left, top right, bottom right, bottom left;
            background-size: 50% 50%;
            background-repeat: no-repeat;
        }

        .vane1 {
            width: 1px;
            height: 350px;
            left: 175px;
            background: white;
            position: absolute;
            transform: rotate(90deg);
        }

        .vane2 {
            width: 1px;
            height: 350px;
            left: 171.5px;
            background: white;
            position: absolute;
            transform: rotate(180deg);
        }

        .base .bottom_base {
            position: absolute;
            width: 90px;
            height: 100px;
            left: 162px;
            border-right: 16px solid transparent;
            border-left: 16px solid transparent;
            border-bottom: 380px solid white;
            opacity: .8;
            z-index: -1;
            top: 42.5px;
        }

        ul {
            position: absolute;
            top: 180px;
            left: -30px;
        }

        li {
            width: 10px;
            height: 10px;
            background: white;
            padding: 2px;
            display: block;
            margin: 30px;
            box-shadow: inset 0px -2px 0px lightgray;
        }

        li:nth-child(2) {
            position: absolute;
            top: -45px;
            left: 20px;
        }

        li:nth-child(1) {
            position: absolute;
            top: 35px;
            left: 50px;
        }

        li:nth-child(3) {
            position: absolute;
            top: 75px;
            left: 50px;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(-360deg);
            }
        }

        .button1 {
            position: relative;
            top: 50px;
            right: 80px;
        }
        
        
        .a-upload {
    padding: 4px 10px;
    height: 20px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    color: #444;
    background: #eee;
    border: 1px solid #ccc;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1
}

.a-upload  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}

.a-upload:hover {
    color: #444;
    background: #eee;
    border-color: #ccc;
    text-decoration: none
}

    </style>
    <script src="prefixfree.min.js"></script>
    
    <script>
    	function changepic1(){
    		var reads=new FileReader();
    		f = document.getElementById('file').files[0];
    		reads.readAsDataURL(f);
    		reads.onload=function e(){
    			document.getElementById('show').src=this.result;
    		}
    	}
    	
    	function changepic2(){
    		document.getElementById('file').files=null;
    		document.getElementById('show').src=null;
    	}
    </script>
</head>

<body>
    <div class="main">
        <div class="title">
            <p id="learn"><b>学习笔记</b></p>
        </div>
        
        <div class="Image">
        	<div>
        		<form id="ImageForm" action="ImageServlet" method="post" enctype="multipart/form-data">
        			<input id="file" type="file" name="file" class="filepath" onchange="changepic1(this)"></input>
        			<br>
        			<img src="" id="show" width="300" height="300"><br>
        			<input type="submit" value="确定"/>${msg}
        		</form>
        		<button  onclick="changepic2(this)">撤销</button>
        	</div>
        </div>
        
        <div class="biji">
            <form id="form" action="ContentServlet" method="post">
				<div class="textarea">
                <div class="input">
                    <input placeholder="input title.." name="title" type="text" />
                </div>
                <div style="float:right;">
                    <div id="degree">
                        重要等级<select name="degree" style="display: inline; width: 60px; height: 50px">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <br>
                    </div>
                    <div id="button">
                        <input type="submit" value="提交"/>
                    </div>
                </div>
                <br><br>
                    <textarea
                        name="content" style="margin-left:auto;margin-right:auto;padding: 10px; height:500px;width: 100%; resize: none; font-size: 22px;font-family: Trebuchet MS, Helvetica, sans-serif; border:solid 1px #ffffff; border-radius:24px "></textarea>
                </div>
            </form>
        </div>
    </div>
    <div id="Side" class="sidenav">
        <!-- 自行添加链接 -->
        <a href="index.jsp" id="Zhuye">zhuye</a>
        <a href="Landing.jsp" id="Articles">Articles</a>
        <a href="Landing.jsp" id="Contact">Contact</a>
        <a href="Landing.jsp" id="Other">Other</a>
    </div>

    <div class="sun"></div>

    <div class="wmd1">
        <div class="blades">
            <div class="blade2"></div>
            <div class="blade1"></div>
            <div class="vane1"></div>
            <div class="blade3"></div>
            <div class="blade4"></div>
            <div class="vane2"></div>
        </div>
        <div class="base">
            <div class="bottom_base">
                <ul>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
        </div>

        <div class="wmd1">
            <div class="blades">
                <div class="blade2"></div>
                <div class="blade1"></div>
                <div class="vane1"></div>
                <div class="blade3"></div>
                <div class="blade4"></div>
                <div class="vane2"></div>
            </div>
            <div class="base">
                <div class="bottom_base">
                    <ul>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>

            <div class="wmd1">
                <div class="blades">
                    <div class="blade2"></div>
                    <div class="blade1"></div>
                    <div class="vane1"></div>
                    <div class="blade3"></div>
                    <div class="blade4"></div>
                    <div class="vane2"></div>
                </div>
                <div class="base">
                    <div class="bottom_base">
                        <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                    <!-- <div class = "button1">
                            <input type="submit" name="" onclick="tijiao();" id="submit" value="发表" width:50px  />
                    </div> -->
                </div>
</body>
<script type="text/javascript">
    function tijiao() {
        document.getElementById("loginForm").submit();//表单提交  
    }
</script>

</html>
