package com.service;

import com.model.Content;
import com.Dao.ContentDao;
import com.model.UserBean;

import com.Dao.LoginDao;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession();
		UserBean user=(UserBean)session.getAttribute("login");
		String name=request.getParameter("username");
		String password=request.getParameter("password");
		String val=request.getParameter("val");
		System.out.println(val);
        String serverCheckcode = (String) request.getSession().getAttribute("checkcode");//�ӷ������˵�session��ȡ����֤��
        System.out.println(serverCheckcode);
		if(user==null) {
			//��ʾ��ǰ�Ự֮�в�û�д洢��������������Ҫ�����ݿ��м���һЩ����
			user=LoginDao.LoginCheck(name, password);
			System.out.println(user.getName());
			if(val.equals(serverCheckcode)) {
				System.out.println("��֤�ɹ�");
			}
			else {
				System.out.println("��֤ʧ��");
				request.setAttribute("errorVal", "��֤�����");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				return;
			}
			if(password.equals(user.getPassword())) {
				//��ȷ
				ContentDao content=new ContentDao();
				ArrayList<Content>List=ContentDao.QueryByName(name);
				//LoginDao login = new LoginDao();
				//UserBean user1 = LoginDao.QueryByName(name); 
				//����������û���������
				int num=List.size();
				String n=String.valueOf(num);
				request.setAttribute("num", n);
				session.setAttribute("num", n);//�ӵ�session��
				session.setAttribute("name", name);
				session.setAttribute("login", user);
				session.setMaxInactiveInterval(3600);
				request.getRequestDispatcher("/Landing.jsp").forward(request, response);
			}
			else {
				//����
				request.setAttribute("errorInfo", "�û��������ڻ��������");
				System.out.println("�û��������������user=null��");
				request.getRequestDispatcher("/Login.jsp").forward(request, response);
			}
		}
		else if(user!=null) {
			if(val.equals(serverCheckcode)) {
				System.out.println("��֤�ɹ�");
			}
			else {
				System.out.println("��֤ʧ��");
				request.setAttribute("errorVal", "��֤�����");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				return;
			}
			if(password.equals(user.getPassword())) {
				ContentDao content=new ContentDao();
				ArrayList<Content>List=content.QueryByName(name);
				LoginDao login = new LoginDao();
				UserBean user1 = LoginDao.QueryByName(name); 
				//����������û���������
				int num=List.size();
				request.setAttribute("num", num);
				session.setAttribute("num", num);//�ӵ�session��
				session.setAttribute("name", name);
				session.setAttribute("login", user);
				session.setMaxInactiveInterval(3600);
				request.getRequestDispatcher("/Landing.jsp").forward(request, response);
			}
			else {
				//����
				request.setAttribute("errorInfo", "�û��������ڻ��������");
				System.out.println("�û��������ڻ��������");
				request.getRequestDispatcher("/Login.jsp").forward(request, response);
			}
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
