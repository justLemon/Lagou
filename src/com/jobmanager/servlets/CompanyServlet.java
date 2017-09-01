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
			CompanyNameForm companyNameForm = new CompanyNameForm();
			companyNameForm.setCompanyId(companyId);
			companyNameForm.setCompanyShortName(companyShortName);
			companyNameForm.setCompanyFeatures(companyFeatures);
			userDao.updateShortNameAndFeatures(companyNameForm);
			
			Company company = userDao.findCompanyById(Integer.parseInt(companyId));
			JSONObject obj = JSONObject.fromObject(company);
System.out.println(obj.toString());

		
	        String res="{\"success\": true,\"content\": "  
	        		+ obj.toString()
	        		+ "}"; 
	        outputStream.write(res.getBytes("utf-8")); 
	        outputStream.flush();  
	        outputStream.close();
		} else if(url.contains("company/pasteLabelToCompany.json")) {
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	companyId = request.getParameter("companyId");
			String 	labels = request.getParameter("labels");
			CompanyLabelForm companyLabelForm = new CompanyLabelForm();
			companyLabelForm.setCompanyId(companyId);
			companyLabelForm.setLabels(labels);
			userDao.updateLabels(companyLabelForm);
			
			Company company = userDao.findCompanyById(Integer.parseInt(companyId));
			JSONObject obj = JSONObject.fromObject(company);
			System.out.println(obj.toString());

			
	        String res="{\"success\": true,\"content\": "  
	        		+ obj.toString()
	        		+ "}"; 
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
		    CompanyBaseInfoForm companyBaseInfoForm = new CompanyBaseInfoForm();
		    companyBaseInfoForm.setCompanyId(companyId);
		    companyBaseInfoForm.setCity(city);
		    companyBaseInfoForm.setIndustryField(industryField);
		    companyBaseInfoForm.setCompanySize(companySize);
		    companyBaseInfoForm.setCompanyUrl(companyUrl);
		    userDao.updateBaseInfo(companyBaseInfoForm);
		    
			Company company = userDao.findCompanyById(Integer.parseInt(companyId));
			JSONObject obj = JSONObject.fromObject(company);
			System.out.println(obj.toString());

			
	        String res="{\"success\": true,\"content\": "  
	        		+ obj.toString()
	        		+ "}"; 
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
			CompanyProductForm companyProductForm = new CompanyProductForm();
			companyProductForm.setCompanyId(companyId);
			companyProductForm.setProductPicUrl(productPicUrl);
			companyProductForm.setProduct(product);
			companyProductForm.setProductUrl(productUrl);
			companyProductForm.setProductProfile(productProfile);
			userDao.updateProductInfo(companyProductForm);
			
			Company company = userDao.findCompanyById(Integer.parseInt(companyId));
			JSONObject obj = JSONObject.fromObject(company);
			System.out.println(obj.toString());

			
	        String res="{\"success\": true,\"content\": "  
	        		+ obj.toString()
	        		+ "}"; 
	        outputStream.write(res.getBytes("utf-8")); 
	        outputStream.flush();  
	        outputStream.close();
		}else if(url.contains("company/saveCompanyProfile.json")) {
			ServletOutputStream outputStream = response.getOutputStream(); 
			WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
			String 	companyId = request.getParameter("companyId");
			String 	companyProfile = request.getParameter("companyProfile");	
			CompanyProfileForm companyProfileForm = new CompanyProfileForm();
			companyProfileForm.setCompanyId(companyId);
			companyProfileForm.setCompanyProfile(companyProfile);
			userDao.updateProfile(companyProfileForm);
			
			Company company = userDao.findCompanyById(Integer.parseInt(companyId));
			JSONObject obj = JSONObject.fromObject(company);
			System.out.println(obj.toString());

			
	        String res="{\"success\": true,\"content\": "  
	        		+ obj.toString()
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
