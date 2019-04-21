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
        String serverCheckcode = (String) request.getSession().getAttribute("checkcode");//从服务器端的session中取出验证码
        System.out.println(serverCheckcode);
		if(user==null) {
			//表示当前会话之中并没有存储对象，我们这里需要从数据库中检验一些东西
			user=LoginDao.LoginCheck(name, password);
			System.out.println(user.getName());
			if(val.equals(serverCheckcode)) {
				System.out.println("验证成功");
			}
			else {
				System.out.println("验证失败");
				request.setAttribute("errorVal", "验证码错误");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				return;
			}
			if(password.equals(user.getPassword())) {
				//正确
				ContentDao content=new ContentDao();
				ArrayList<Content>List=ContentDao.QueryByName(name);
				//LoginDao login = new LoginDao();
				//UserBean user1 = LoginDao.QueryByName(name); 
				//这里读出该用户的文章数
				int num=List.size();
				String n=String.valueOf(num);
				request.setAttribute("num", n);
				session.setAttribute("num", n);//加到session中
				session.setAttribute("name", name);
				session.setAttribute("login", user);
				session.setMaxInactiveInterval(3600);
				request.getRequestDispatcher("/Landing.jsp").forward(request, response);
			}
			else {
				//错了
				request.setAttribute("errorInfo", "用户名不存在或密码错误");
				System.out.println("用户名或密码错误在user=null中");
				request.getRequestDispatcher("/Login.jsp").forward(request, response);
			}
		}
		else if(user!=null) {
			if(val.equals(serverCheckcode)) {
				System.out.println("验证成功");
			}
			else {
				System.out.println("验证失败");
				request.setAttribute("errorVal", "验证码错误");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				return;
			}
			if(password.equals(user.getPassword())) {
				ContentDao content=new ContentDao();
				ArrayList<Content>List=content.QueryByName(name);
				LoginDao login = new LoginDao();
				UserBean user1 = LoginDao.QueryByName(name); 
				//这里读出该用户的文章数
				int num=List.size();
				request.setAttribute("num", num);
				session.setAttribute("num", num);//加到session中
				session.setAttribute("name", name);
				session.setAttribute("login", user);
				session.setMaxInactiveInterval(3600);
				request.getRequestDispatcher("/Landing.jsp").forward(request, response);
			}
			else {
				//错了
				request.setAttribute("errorInfo", "用户名不存在或密码错误");
				System.out.println("用户名不存在或密码错误");
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
