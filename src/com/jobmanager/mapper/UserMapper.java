package com.jobmanager.mapper;

import java.util.List;

import com.jobmanager.model.*;
/**
 * Mapperӳ����
 * @author qcb
 * @time 2017.7.30
 */
public interface UserMapper {
	public User selectUserByName(String userName);
	public void addUser(User user);
	
	public void addPosition(Position position);
	public void updatePosition(Position position);
	
	public void addNewCompany(String userName);
	public Company selectCompanyByName(String userName);
	public Company selectCompanyById(int companyId);
	public void updateShortNameAndFeatures(CompanyNameForm companyNameForm);
	public void updateLabels(CompanyLabelForm companyLabelForm);
	public void updateBaseInfo(CompanyBaseInfoForm companyBaseInfoForm);
	public void updateProductInfo(CompanyProductForm companyProductForm);
	public void updateProfile(CompanyProfileForm companyProfileForm);
	
	
	public void updateBasciInfo(Employee employee);
	public Employee findEmployeeByName(String userName);
	public void updateJobInfo(Employee employee);
	public void updatePersonInfo(Employee employee);
	
	public List<EmployeeEdu> findEmployeeEduByName(String name);
	public void updateEmployeeEduInfo(EmployeeEdu employee);
	public void deleteEmployeeEduById(int id);
	
	public List<EmployeeProject> findEmployeeProjectByName(String name);
	public void updateEmployeeProjectInfo(EmployeeProject employee);
	public void deleteEmployeeProjectById(int id);
	
	public List<EmployeeWokExp> findEmployeeWokExpByName(String name);
	public void updateEmployeeWokExpInfo(EmployeeWokExp employee);
	public void deleteEmployeeWokExpById(int id);
}
