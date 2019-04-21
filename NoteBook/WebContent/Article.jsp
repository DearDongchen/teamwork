<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.Content"  %>
<%@ page import="com.Dao.ImgDao" %>
<%@ page import="com.model.Img" %>
<%@ page import="com.model.UserBean" %>
<%@ page import="java.util.*" %>
<%session.setMaxInactiveInterval(3600); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    body {background-image:url(Image/1.png);}
    </style>
</head>
<body>
	<%
		Content content=(Content)request.getAttribute("article");
		session.setMaxInactiveInterval(3600);
	%>
	<ul>
		<li background:red>
			标&nbsp;题:<%=content.getTitle() %>
		</li>
		<li>
			发&nbsp;布&nbsp;时&nbsp;间:<%=content.getSendTime() %>
		</li>
		<li>
			发&nbsp;布&nbsp;者:<%=content.getName() %>
		</li>
		<li>
			发&nbsp;布&nbsp;等&nbsp;级:<%=content.getDegree() %>
		</li>
		<li>
			<div>
				图&nbsp:片:
				<%
					HttpSession s=request.getSession();
			  		UserBean user = (UserBean)s.getAttribute("login");
			  		if(user!=null){
			  			int id=user.getId();
			  			ArrayList<Img>images=ImgDao.QueryByUserId(id);
			  			if(images==null || images.size()<1){
			  				out.println("不好意思，图片不存在");
			  			}
			  			else{
				  			for(Img image:images){
				%>
				  				<img src="<%=image.getPath()%>"  width="200" height="200"/>
				<%   		}
				  	}
			  	}
				
			    %>
			</div>
		</li>
		<li>
			笔记内容:<textarea
                        name="content" style="margin-left:auto;margin-right:auto;padding: 10px; height:500px;width: 100%; resize: none; font-size: 22px;font-family: Trebuchet MS, Helvetica, sans-serif; border:solid 1px #ffffff; border-radius:24px ">
				<%=content.getContent() %>
			</textarea>
		</li>
	</ul>
	<a href="Landing.jsp" >退出</a>
</body>
</html>