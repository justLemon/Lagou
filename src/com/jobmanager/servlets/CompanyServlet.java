package com.jobmanager.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jobmanager.dao.UserDao;
import com.jobmanager.model.EmployeeWokExp;
import com.jobmanager.model.User;

/**
 * Servlet implementation class CompanyServlet
 */
@WebServlet("/CompanyServlet")
public class CompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		if(url.contains("company/saveProfileShortNameAndFeatures.json")){
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	companyId = request.getParameter("companyId");
			String 	companyShortName = request.getParameter("companyShortName");
			String 	companyFeatures = request.getParameter("companyFeatures");

			
System.out.println(companyId + companyShortName + companyFeatures);
			EmployeeWokExp employeeWokExp = new EmployeeWokExp();
			employeeWokExp.setUserName(user.getUserName());
			//userDao.updateEmployeeWokExpInfo(employeeWokExp);
//			/List<EmployeeWokExp> exps = userDao.findEmployeeWokExpByName(user.getUserName());
//			String detail;
//		    JSONArray arr = JSONArray.fromObject(exps);
//		    System.out.println(arr);
//			for(int i = 0; i < arr.size(); i++) {
//				JSONObject obj = arr.getJSONObject(i);
//				System.out.println(obj.toString());
//				
//			}
		
	        String res="{\"success\": true,\"content\": "  
	        		+ "{"
	        		//+ "\"workExperiences\" : " + arr.toString()
	        		+ "}}"; 
	        outputStream.write(res.getBytes("utf-8")); 
	        outputStream.flush();  
	        outputStream.close();
		} else if(url.contains("company/pasteLabelToCompany.json")) {
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	companyId = request.getParameter("companyId");
			String 	labels = request.getParameter("labels");

			
System.out.println(companyId + labels);
			EmployeeWokExp employeeWokExp = new EmployeeWokExp();
			employeeWokExp.setUserName(user.getUserName());
			//userDao.updateEmployeeWokExpInfo(employeeWokExp);
//			/List<EmployeeWokExp> exps = userDao.findEmployeeWokExpByName(user.getUserName());
//			String detail;
//		    JSONArray arr = JSONArray.fromObject(exps);
//		    System.out.println(arr);
//			for(int i = 0; i < arr.size(); i++) {
//				JSONObject obj = arr.getJSONObject(i);
//				System.out.println(obj.toString());
//				
//			}
		
	        String res="{\"success\": true,\"content\": "  
	        		+ "{"
	        		//+ "\"workExperiences\" : " + arr.toString()
	        		+ "}}"; 
	        outputStream.write(res.getBytes("utf-8")); 
	        outputStream.flush();  
	        outputStream.close();
		} else if(url.contains("company/saveProfileBaseInfo.json")) {
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	companyId = request.getParameter("companyId");
			String 	city = request.getParameter("city");
			String 	industryField = request.getParameter("industryField");	
			String 	companySize = request.getParameter("companySize");	
			String 	companyUrl = request.getParameter("companyUrl");	
System.out.println(companyId + city + industryField);
			EmployeeWokExp employeeWokExp = new EmployeeWokExp();
			employeeWokExp.setUserName(user.getUserName());
			//userDao.updateEmployeeWokExpInfo(employeeWokExp);
//			/List<EmployeeWokExp> exps = userDao.findEmployeeWokExpByName(user.getUserName());
//			String detail;
//		    JSONArray arr = JSONArray.fromObject(exps);
//		    System.out.println(arr);
//			for(int i = 0; i < arr.size(); i++) {
//				JSONObject obj = arr.getJSONObject(i);
//				System.out.println(obj.toString());
//				
//			}
		
	        String res="{\"success\": true,\"content\": "  
	        		+ "{"
	        		//+ "\"workExperiences\" : " + arr.toString()
	        		+ "}}"; 
	        outputStream.write(res.getBytes("utf-8")); 
	        outputStream.flush();  
	        outputStream.close();
		} else if(url.contains("company/saveCompanyProduct.json")) {
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	companyId = request.getParameter("companyId");
			String 	productPicUrl = request.getParameter("productPicUrl");
			String 	product = request.getParameter("product");	
			String 	productUrl = request.getParameter("productUrl");	
			String 	productProfile = request.getParameter("productProfile");	
System.out.println(companyId + productPicUrl + product);
			EmployeeWokExp employeeWokExp = new EmployeeWokExp();
			employeeWokExp.setUserName(user.getUserName());
			//userDao.updateEmployeeWokExpInfo(employeeWokExp);
//			/List<EmployeeWokExp> exps = userDao.findEmployeeWokExpByName(user.getUserName());
//			String detail;
//		    JSONArray arr = JSONArray.fromObject(exps);
//		    System.out.println(arr);
//			for(int i = 0; i < arr.size(); i++) {
//				JSONObject obj = arr.getJSONObject(i);
//				System.out.println(obj.toString());
//				
//			}
		
	        String res="{\"success\": true,\"content\": "  
	        		+ "{"
	        		//+ "\"workExperiences\" : " + arr.toString()
	        		+ "}}"; 
	        outputStream.write(res.getBytes("utf-8")); 
	        outputStream.flush();  
	        outputStream.close();
		}else if(url.contains("company/saveCompanyProfile.json")) {
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	companyId = request.getParameter("companyId");
			String 	companyProfile = request.getParameter("companyProfile");	
System.out.println(companyId + companyProfile);
			EmployeeWokExp employeeWokExp = new EmployeeWokExp();
			employeeWokExp.setUserName(user.getUserName());
			//userDao.updateEmployeeWokExpInfo(employeeWokExp);
//			/List<EmployeeWokExp> exps = userDao.findEmployeeWokExpByName(user.getUserName());
//			String detail;
//		    JSONArray arr = JSONArray.fromObject(exps);
//		    System.out.println(arr);
//			for(int i = 0; i < arr.size(); i++) {
//				JSONObject obj = arr.getJSONObject(i);
//				System.out.println(obj.toString());
//				
//			}
		
	        String res="{\"success\": true,\"content\": "  
	        		+ "{"
	        		//+ "\"workExperiences\" : " + arr.toString()
	        		+ "}}"; 
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