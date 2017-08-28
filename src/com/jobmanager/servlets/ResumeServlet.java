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
import com.jobmanager.model.*;

/**
 * Servlet implementation class ResumeServlet
 */
@WebServlet("/ResumeServlet")
public class ResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResumeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		//防止中文乱码 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		User user = (User)request.getSession().getAttribute("loginUser");
		if(user == null){
			request.setAttribute("loginError","请重新登录!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		} 


		String url = request.getRequestURI();
		response.setContentType("application/json;charset=utf-8");  
		
		if(url.contains("/resume/basic.json")){
			resumeBasic(request,response,user);
		}
		else if(url.contains("/resume/expect.json")){
			resumeExpect(request,response,user);
		}else if(url.contains("/resume/intro.json")){
	        resumeInfo(request,response,user);
		}else if(url.contains("/workExperience/save.json")){
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	companyName = request.getParameter("companyName");
			String 	positionName = request.getParameter("positionName");
			String 	startYear = request.getParameter("startYear");
			String 	startMonth = request.getParameter("startMonth");
			String 	endYear = request.getParameter("endYear");
			String 	endMonth = request.getParameter("endMonth");
			EmployeeWokExp employeeWokExp = new EmployeeWokExp();
			employeeWokExp.setUserName(user.getUserName());
			employeeWokExp.setCompanyName(companyName);
			employeeWokExp.setPositionName(positionName);
			employeeWokExp.setStartMonth(startMonth);
			employeeWokExp.setStartYear(startYear);
			employeeWokExp.setEndMonth(endMonth);
			employeeWokExp.setEndYear(endYear);
			userDao.updateEmployeeWokExpInfo(employeeWokExp);
			List<EmployeeWokExp> exps = userDao.findEmployeeWokExpByName(user.getUserName());
			String detail;
		    JSONArray arr = JSONArray.fromObject(exps);
		    System.out.println(arr);
			for(int i = 0; i < arr.size(); i++) {
				JSONObject obj = arr.getJSONObject(i);
				System.out.println(obj.toString());
				
			}
		
	        String res="{\"success\": true,\"content\": "  
	        		+ "{"
	        		+ "\"workExperiences\" : " + arr.toString()
	        		+ "}}"; 
	        outputStream.write(res.getBytes("utf-8")); 
	        outputStream.flush();  
	        outputStream.close();
		}else if(url.contains("/projectExperience/save.json")){
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	projectName = request.getParameter("projectName");
			String 	positionName = request.getParameter("positionName");
			String 	startYear = request.getParameter("startYear");
			String 	startMonth = request.getParameter("startMonth");
			String 	endYear = request.getParameter("endYear");
			String 	endMonth = request.getParameter("endMonth");
			String 	projectRemark = request.getParameter("projectRemark");
			EmployeeProject employeeProject = new EmployeeProject();
			employeeProject.setUserName(user.getUserName());
			employeeProject.setProjectName(projectName);
			employeeProject.setPositionName(positionName);
			employeeProject.setStartYear(startYear);
			employeeProject.setStartMonth(startMonth);
			employeeProject.setEndYear(endYear);
			employeeProject.setEndMonth(endMonth);
			employeeProject.setProjectRemark(projectRemark);
			userDao.updateEmployeeProjectInfo(employeeProject);
			
			List<EmployeeProject> exps = userDao.findEmployeeProjectByName(user.getUserName());
			String detail;
		    JSONArray arr = JSONArray.fromObject(exps);
		    System.out.println(arr);
		    JSONObject obj = JSONObject.fromObject(employeeProject);
//			for(int i = 0; i < arr.size(); i++) {
//				JSONObject obj = arr.getJSONObject(i);
//				System.out.println(obj.toString());
//				
//			}
			
	        String res="{\"success\": true, \"code\": 3 ,\"content\": "  
	        		+ "{"
	        		+ "\"projectExperience\" : " + obj.toString()
	        		+ "}}"; 
	        outputStream.write(res.getBytes("utf-8")); 
	        outputStream.flush();  
	        outputStream.close();
		}else if(url.contains("/educationExperience/save.json")){
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	schoolName = request.getParameter("schoolName");
			String 	education = request.getParameter("education");
			String 	startYear = request.getParameter("startYear");
			String 	endYear = request.getParameter("endYear");
			String 	professional = request.getParameter("professional");
			EmployeeEdu employeeEdu = new EmployeeEdu();
			employeeEdu.setUserName(user.getUserName());
			employeeEdu.setSchoolName(schoolName);
			employeeEdu.setEducation(education);
			employeeEdu.setStartYear(startYear);
			employeeEdu.setEndYear(endYear);
			employeeEdu.setProfessional(professional);
			userDao.updateEmployeeEduInfo(employeeEdu);
			
			List<EmployeeEdu> exps = userDao.findEmployeeEduByName(user.getUserName());
			String detail;
		    JSONArray arr = JSONArray.fromObject(exps);
		    System.out.println(arr);
			for(int i = 0; i < arr.size(); i++) {
				JSONObject obj = arr.getJSONObject(i);
				System.out.println(obj.toString());
				
			}
			
	        String res="{\"success\": true, \"content\": "  
	        		+ "{"
	        		+ "\"educationExperiences\" : " + arr.toString()
	        		+ "}}";
	        outputStream.write(res.getBytes("utf-8")); 
	        outputStream.flush();  
	        outputStream.close();
		}else if(url.contains("/workExperience/delExp.json")){
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	id = request.getParameter("id");
			userDao.deleteEmployeeWokExpById(Integer.parseInt(id));
			
            List<EmployeeWokExp> exps = userDao.findEmployeeWokExpByName(user.getUserName());
		    JSONArray arr = JSONArray.fromObject(exps);
		    System.out.println(arr);
			
	        String res="{\"success\": true, \"code\": 3 ,\"content\": "  
	        		+ "{"
	        		+ "\"workExperiences\" : " + arr.toString()
	        		+ "}}";  
	        outputStream.write(res.getBytes("utf-8"));         
	        outputStream.flush();  
	        outputStream.close();
	        
		}else if(url.contains("/projectExperience/delProject.json")){
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	id = request.getParameter("id");
            userDao.deleteEmployeeProjectById(Integer.parseInt(id));
			
            List<EmployeeProject> exps = userDao.findEmployeeProjectByName(user.getUserName());
		    JSONArray arr = JSONArray.fromObject(exps);
		    System.out.println(arr);
			
	        String res="{\"success\": true, \"code\": 3 ,\"content\": "  
	        		+ "{"
	        		+ "\"projectExperiences\" : " + arr.toString()
	        		+ "}}"; 
 
	        outputStream.write(res.getBytes("utf-8"));         
	        outputStream.flush();  
	        outputStream.close();
	        
		}else if(url.contains("/educationExperience/delEdu.json")){
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	id = request.getParameter("id");
			userDao.deleteEmployeeEduById(Integer.parseInt(id));
			
            List<EmployeeEdu> edus = userDao.findEmployeeEduByName(user.getUserName());
		    JSONArray arr = JSONArray.fromObject(edus);
		    System.out.println(arr);
			
	        String res="{\"success\": true, \"code\": 3 ,\"content\": "  
	        		+ "{"
	        		+ "\"educationExperiences\" : " + arr.toString()
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
		doGet(request, response);
	}

	private void resumeBasic(HttpServletRequest request, HttpServletResponse response,User user)throws ServletException, IOException {
		ServletOutputStream outputStream = response.getOutputStream(); 
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
		String 	name = request.getParameter("name");
		String 	sex = request.getParameter("sex"); 
		String 	highestEducation = request.getParameter("highestEducation");
		String 	workYear = request.getParameter("workYear");
		String 	status = request.getParameter("status");
		String 	email = request.getParameter("email");
		String 	phone = request.getParameter("phone");
		String 	type = request.getParameter("type");
		Employee employee = new Employee();
		employee.setUserName(user.getUserName());
		employee.setSex(sex);
		employee.setName(name);
		employee.setHighestEducation(highestEducation);
		employee.setWorkYear(workYear);
		employee.setStatus(status);
		employee.setEmail(email);
		employee.setPhone(phone);
		employee.setType(type);
		userDao.updateBasciInfo(employee);
		System.out.println(name + sex + highestEducation+ workYear+ status+email);
        String res="{\"success\": true,\"content\": "
        		+ "{\"resume\": {"
        		+ "}," 
        		+ "\"infoCompleteScore\": 45" 
        		+ "}}"; 
        outputStream.write(res.getBytes("utf-8")); 
        outputStream.flush();  
        outputStream.close();
	}

	private void resumeExpect(HttpServletRequest request, HttpServletResponse response,User user)throws ServletException, IOException {
		ServletOutputStream outputStream = response.getOutputStream(); 
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
		String 	city = request.getParameter("city");
		String 	positionType = request.getParameter("positionType");
		String 	positionName = request.getParameter("positionName");
		String 	salarys = request.getParameter("salarys");
		Employee employee = new Employee();
		employee.setUserName(user.getUserName());
		employee.setCity(city);
		employee.setPositionName(positionName);
		employee.setPositionType(positionType);
		employee.setSalarys(salarys);
		userDao.updateJobInfo(employee);
		System.out.println(city + positionType+ positionName + salarys );
        String res="{\"success\": true,\"content\": {\"resume\": {}," +
        		"\"infoCompleteScore\": 45" +
                "}}"; //json字符串要写成"{'name':'tom'}"的形式，里面的key和value也要加''写成字符串的形式  
        outputStream.write(res.getBytes("utf-8")); 
        outputStream.flush();  
        outputStream.close();
	}


	
	private void resumeInfo(HttpServletRequest request, HttpServletResponse response,User user)throws ServletException, IOException {
		ServletOutputStream outputStream = response.getOutputStream(); 
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
		String 	myRemark = request.getParameter("myRemark");
		Employee employee = new Employee();
		employee.setUserName(user.getUserName());
		employee.setMyRemark(myRemark);
		userDao.updatePersonInfo(employee);
        String res="{\"success\": true,\"content\": "
        		+ "{\"resume\": {"
        		  + "\"myRemark\" :\" " + myRemark
        		+ "\"}," 
        		+ "\"infoCompleteScore\": 45" 
        		+ "}}"; 
        outputStream.write(res.getBytes("utf-8")); 
        outputStream.flush();  
        outputStream.close();
	}
}
