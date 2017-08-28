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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//防止中文乱码 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//get values from register.jsp by name
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String type = request.getParameter("type");
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
		User user = userDao.findUserByName(name);
		if (user == null) {
			request.setAttribute("registerError","register Success");
			User newUser = new User();
			newUser.setUserName(name);;
			newUser.setUserPasswd(password);
			newUser.setUserType(type);
			userDao.addUser(newUser);
			request.getRequestDispatcher("login.jsp").forward(request, response);	
		}	
		else {
			request.setAttribute("registerError","用户名已经存在!");
			request.getRequestDispatcher("register.jsp").forward(request, response);
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
