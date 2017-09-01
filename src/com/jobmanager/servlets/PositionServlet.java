package com.jobmanager.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jobmanager.dao.UserDao;
import com.jobmanager.model.*;

/**
 * Servlet implementation class PositionServlet
 */
@WebServlet("/PositionServlet")
public class PositionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PositionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		User user = (User)request.getSession().getAttribute("loginUser");
		if(user == null){
			request.setAttribute("loginError","�����µ�¼!");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			return;
		} 
		String url = request.getRequestURI();
System.out.println(url);
		response.setContentType("application/json;charset=utf-8");  
		if(url.contains("position/savePosition.json")){
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	jobId = request.getParameter("id");
			String 	companyId = request.getParameter("companyId");
			String 	positionType = request.getParameter("positionType");
			String 	positionName = request.getParameter("positionName");
			String 	department = request.getParameter("department");
			String 	jobNature = request.getParameter("jobNature");
			String 	salaryMin = request.getParameter("salaryMin");
			String 	salaryMax = request.getParameter("salaryMax");
			String 	workAddress = request.getParameter("workAddress");
			String 	workYear = request.getParameter("workYear");
			String 	education = request.getParameter("education");
			String 	positionAdvantage = request.getParameter("positionAdvantage");
			String 	positionDetail = request.getParameter("positionDetail");
			String 	positionAddress = request.getParameter("positionAddress");
			String 	email = request.getParameter("email");
			Position position = new Position();
			position.setJobId(jobId);
			position.setCompanyId(companyId);
			position.setPositionType(positionType);
			position.setPositionName(positionName);
			position.setDepartment(department);
			position.setJobNature(jobNature);
			position.setSalaryMin(salaryMin);
			position.setSalaryMax(salaryMax);
			position.setWorkAddress(workAddress);
			position.setWorkYear(workYear);
			position.setEducation(education);
			position.setPositionAdvantage(positionAdvantage);
			position.setPositionDetail(positionDetail);
			position.setPositionAddress(positionAddress);
			position.setEmail(email);
            if (jobId==null || jobId.trim().equals("")){
            	userDao.addPosition(position);
            } else {
            	userDao.updatePosition(position);
            }

		
	        String res="{\"success\": true,\"content\": "  
	        		+ "\"positions.jsp\""
	        		+ "}"; 
	        outputStream.write(res.getBytes("utf-8")); 
	        outputStream.flush();  
	        outputStream.close();
		} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
