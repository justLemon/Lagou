package com.jobmanager.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jobmanager.dao.UserDao;
import com.jobmanager.model.User;
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
		//防止中文乱码 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//get values from register.jsp by name
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
		User user = userDao.findUserByName(name);
		if (user == null) {
			request.setAttribute("loginError","用户不存在!");
			request.getRequestDispatcher("login.jsp").forward(request, response);	
		}
		else if (name.equals(user.getUserName()) && password.equals(user.getUserPasswd())) {
			HttpSession session =  request.getSession();
			session.setAttribute("loginUser", user);
			request.setAttribute("loginError","login success");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}	
		else {
			request.setAttribute("loginError","用户名或密码错误，请重新输入!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
