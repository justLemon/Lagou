package com.jobmanager.dao;

import java.util.List;

import com.jobmanager.model.*;
/**
 * DAO�ӿڲ�
 * @author qcb
 * @time 2017.7.30
 */
public interface UserDao {
	/**
	 * �����û�ID��ѯ�û���Ϣ
	 * @param id
	 * @return
	 */
	public User findUserByName(String name);
	public void addUser(User user);
	
	public void addPosition(Position position);
	public void updatePosition(Position position);
	
	public Company findCompanyByUserName(String userName);
	public Company findCompanyById(int companyId);
	public void updateShortNameAndFeatures(CompanyNameForm companyNameForm);
	public void updateLabels(CompanyLabelForm companyLabelForm);
	public void updateBaseInfo(CompanyBaseInfoForm companyBaseInfoForm);
	public void updateProductInfo(CompanyProductForm companyProductForm);
	public void updateProfile(CompanyProfileForm companyProfileForm);
	
	public void updateBasciInfo(Employee employee);
	public Employee findEmployeeByName(String name);
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
