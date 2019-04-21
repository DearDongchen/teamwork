package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.Content;
import com.Dao.ContentDao;
/**
 * Servlet implementation class DealServlet
 */
@WebServlet("/DealServlet")
public class DealServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DealServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("���ڽ���DealServlet");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int id=Integer.parseInt(request.getParameter("id"));
		int type=Integer.parseInt(request.getParameter("type"));
		if(type==1) {
			//���ﴦ��鿴����
			Content article=ContentDao.QueryByID(id);
			request.setAttribute("article", article);
			request.getRequestDispatcher("Article.jsp").forward(request, response);
		}
		else if(type==2) {
			//�������ɾ������
			boolean flag=ContentDao.DelId(id);
			if(flag==true) {
				System.out.println("ɾ�����ݳɹ�!");
				request.getRequestDispatcher("LogList.jsp").forward(request,response);
			}
			else {
				System.out.println("ɾ��ʧ�ܣ���Ҫ������");
			}
		}
		else {
			//pass
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
