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
 * Servlet implementation class ImageServlet
 */
@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserBean user1=new UserBean();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	//�������ϴ����µĲ���,�������ϴ��ļ��Ĳ���
    	String path=null;
    	FileItemFactory factory = new DiskFileItemFactory();
    	HttpSession session = request.getSession();
    	UserBean user=(UserBean)session.getAttribute("login");
    	//�����ļ��ϴ�������
    	ServletFileUpload upload = new ServletFileUpload(factory);
    	
    	//��ʼ����������Ϣ
    	List<FileItem> items = null;
    	try {
    		items =  upload.parseRequest(request);
    	}
    	catch(FileUploadException e) {
    		e.printStackTrace();
    	}
    	
    	//������������Ϣ�����ж�
    	Iterator iter = items.iterator();
    	while(iter.hasNext()) {
    		FileItem item =(FileItem)iter.next();
    		//��Ϣλ��ͨ��ʽ
    		if(item.isFormField()) {
    			String fieldName = item.getFieldName();
    			String value = item.getString();
    			request.setAttribute(fieldName, value);
    		}
    		//��ϢΪ�ļ���ʽ
    		else {
    			String fileName = item.getName();
    			System.out.println(fileName);
    			int index=fileName.lastIndexOf("\\");
    			String str1=fileName.substring(index+1);
    			index=str1.indexOf(".");
    			String str2=str1.substring(0,index);
    			fileName = str2+System.currentTimeMillis()+str1.substring(index);
    			System.out.println(fileName);
    			request.setAttribute("realFileName", fileName);
    			@SuppressWarnings("deprecation")
				String basePath = request.getRealPath("/images");
    			File file = new File(basePath,fileName);
    			path=file.getPath();
    			System.out.println(path);
    			try {
    				item.write(file);
    			}
    			catch(Exception e) {
    				e.printStackTrace();
    			}
    		}
    		request.setAttribute("msg", "ͼƬ�ϴ��ɹ�!");
    		if(user!=null) {
    			System.out.println(user.getId());
    			path=path.replace('\\', '/');
    			int index=path.lastIndexOf('/'); 
    			path="http://localhost:8080/NoteBook/images/"+path.substring(index);
    			System.out.println(path);
    			Img image = new Img(user.getId(),path);
    			ImgDao.AddImage(image);
    			request.getRequestDispatcher("/Content.jsp").forward(request, response);
    			session.setAttribute("login", user);
    			user1=user;
    		}
    		else {
    			user=user1;
    			Img image = new Img(user.getId(),path);
    			ImgDao.AddImage(image);
    			request.getRequestDispatcher("/Content.jsp").forward(request, response);
    			session.setAttribute("login", user);
    			user1=user;
    		}
    	}
	}
}
