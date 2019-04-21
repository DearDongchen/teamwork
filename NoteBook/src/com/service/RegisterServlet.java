package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.UserBean;
import com.Dao.LoginDao;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String name=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		UserBean user=LoginDao.QueryByName(name);
		if(name==user.getName()) {
			request.setAttribute("NAME", "对不起，该用户名已经存在");
			System.out.println("对不起，该用户名已经存在");
			request.getRequestDispatcher("Register.jsp").forward(request, response);
		}
		else if(name.equals("") || password.equals("")) {
			request.setAttribute("errorInfo", "注册不能为空");
			System.out.println("注册不能为空");
			request.getRequestDispatcher("Register.jsp").forward(request, response);
		}
		else {
			LoginDao.AddUser(new UserBean(0,name,password,email));
			response.sendRedirect(request.getContextPath()+"/Login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
