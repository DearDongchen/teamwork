package com.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.Dao.ContentDao;
import com.Dao.ImgDao;
import com.model.Content;
import com.model.Img;
import com.model.UserBean;

/**
 * Servlet implementation class ContentServlet
 */
@WebServlet("/ContentServlet")
public class ContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserBean user1;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//下面是自写方法
    	request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("utf-8");
    	HttpSession session =request.getSession();
    	String title=request.getParameter("title");
    	String degree=request.getParameter("degree");
    	String article=request.getParameter("content");
    	UserBean user=(UserBean)session.getAttribute("login");
    	if(user!=null) {
    		session.setAttribute("login", user);
    		user1=user;
    	}
    	else {
    		user=user1;
    		session.setAttribute("login", "user");
    	}
    	Content content=new Content(user.getName(),title,article,degree);
    	boolean flag=ContentDao.AddContent(content);
    	if(!flag) {
    		request.setAttribute("ContentError", "用户添加文章失败!");
    		System.out.println("用户添加文章失败!");
    		request.getRequestDispatcher("/Content.jsp").forward(request, response);
    	}
    	else {
    		ArrayList<Content> List=ContentDao.QueryByName(user.getName());
    		int num=List.size();
    		String n=String.valueOf(num);
    		session.setAttribute("num", n);
    		request.setAttribute("num",n);
    		request.setAttribute("ContentCorrect", "用户添加文章成功!");
    		System.out.println("用户添加文章成功!");
    		request.setAttribute("msg", "用户添加文章成功!");
    		request.getRequestDispatcher("/Content.jsp").forward(request, response);
    	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
