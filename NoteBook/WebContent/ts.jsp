<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <style type="text/css">
    	html,body{
    		height: 100%;
    		width: 100%;
    	}
        .container .calculator { 
        	cursor: move;
            background-color: #FFDAB9;
            float: left;
            width: 1%;
            height: 99%;
        }
    </style>
    
    <script>
    	function Return(){
    		document.getElementById('iframe1').src="MainPage.jsp";
    	}
    </script>
</head>
<body>
	<div style="height: 5%;width: 100%; background-color:#BBFFFF">
		<button style="float:left" type="button" onclick="Return()">主页</button>
		<button style = "float: right" type="button" onclick="less()">-</button>
		<button style = "float: right" type="button" onclick="bigger()">+</button>
	</div>
	<div class="container" style="height: 95%;width: 100%;">
		<div style="float: left;height: 99%;width: 99%" name="leftIframe" id="leftIframe">
			<iframe id="iframe1" width="100%" height="100%" src="MainPage.jsp" frameborder="0" scrolling="yes"></iframe>
		</div>
		<div class="calculator" id="drag"></div>
		<!--下面糖少提供的笔记frame-->
		<div style="width: 0%;height: 100%;float: left;" name="rightFrame" id="rightFrame">
			<iframe width="100%" height="100%" src="index.jsp"  frameborder="0" scrolling="yes" ></iframe>
		</div>
	</div>
</body>
</html>

        <script>
        	function numchange(percentage, type){ //1 for up & 0 for down
			var sz = percentage.length;
			var value = percentage.substring(0, sz-1);
			value = parseInt(value);
			if(type == 0 && value >= 10){
				value = value - 10;
			}
			else if(type == 1 && value <= 90){
				value = value + 10;
			}
			value = value.toString();
			value = value + "%";
			return value;
			}
			function bigger(){
				var leftPoint = document.getElementById('leftIframe');
				var rightPoint = document.getElementById('rightFrame');
				leftPoint.style.width = numchange(leftPoint.style.width, 1);
				rightPoint.style.width = numchange(rightPoint.style.width, 0);
			}
			function less(){
				var leftPoint = document.getElementById('leftIframe');
				var rightPoint = document.getElementById('rightFrame');
				leftPoint.style.width = numchange(leftPoint.style.width, 0);
				rightPoint.style.width = numchange(rightPoint.style.width, 1);
			}
			function setsz(percentage, percentage2){
				var leftPoint = document.getElementById('leftIframe');
				var rightPoint = document.getElementById('rightFrame');
				leftPoint.style.width = percentage;
				rightPoint.style.width = percentage2;
			}
            window.onload = function() {
           
                var drag = document.getElementById('drag');
                drag.onmousedown = function(e) {
                    var e = e || window.event; //兼容ie浏览器
                    var diffX = e.clientX - drag.offsetLeft; //鼠标点击物体那一刻相对于物体左侧边框的距离=点击时的位置相对于浏览器最左边的距离-物体左边框相对于浏览器最左边的距离
                    var diffY = e.clientY - drag.offsetTop;

            
                    if(typeof drag.setCapture!='undefined'){
                        drag.setCapture();
                    }
                    document.onmousemove = function(e) {
                        var e = e || window.event; 
                        var left=e.clientX-diffX;
                        var top=e.clientY-diffY;

                        if(left<0){
                            left=0;
                        }else if(left >window.innerWidth-drag.offsetWidth){
                            left = window.innerWidth-drag.offsetWidth;
                            left = window.innerWidth;
                        }
                        if(top<0){
                            top=0;
                        }else if(top >window.innerHeight-drag.offsetHeight){
                            top = window.innerHeight-drag.offsetHeight;
                            top = window.innerHeight;
                        }
                        var leftnum = drag.style.left;
                        var sz = leftnum.length;
                        leftnum = leftnum.substring(0, sz-2);
                        leftnum = leftnum/window.innerWidth;
                        leftnum = leftnum*100;
                        leftnum = Math.floor(leftnum);
                        var rightnum = 99-leftnum;//-1
                        leftnum = leftnum+'%';
                        rightnum = rightnum+'%';
                        drag.style.left = left+ 'px';
                        setsz(leftnum, rightnum);
                        //drag.style.top = top + 'px';
                    };
                    document.onmouseup = function(e) {
                        this.onmousemove = null;
                        this.onmouseup = null; //
                        if(typeof drag.releaseCapture!='undefined'){
                            drag.releaseCapture();
                        }
                    };
                };
            };
        </script>