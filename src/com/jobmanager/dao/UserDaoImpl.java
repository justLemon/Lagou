package com.jobmanager.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import  com.jobmanager.mapper.UserMapper;
import com.jobmanager.model.Company;
import com.jobmanager.model.CompanyBaseInfoForm;
import com.jobmanager.model.CompanyLabelForm;
import com.jobmanager.model.CompanyNameForm;
import com.jobmanager.model.CompanyProductForm;
import com.jobmanager.model.CompanyProfileForm;
import com.jobmanager.model.Employee;
import com.jobmanager.model.EmployeeEdu;
import com.jobmanager.model.EmployeeProject;
import com.jobmanager.model.EmployeeWokExp;
import com.jobmanager.model.Position;
import com.jobmanager.model.User;
/**
 * DAOʵ�ֲ�
 * @author qcb
 * @time 2017.7.30
 */
@Component
public class UserDaoImpl implements UserDao{
    @Autowired
	private UserMapper userMapper;
	@Override
	public User findUserByName(String name) {
		User user = userMapper.selectUserByName(name);
		 return user; 
	}
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		if(user.getUserType().equals("0")){
			userMapper.addUser(user);
		} else{
			userMapper.addUser(user);
			userMapper.addNewCompany(user.getUserName());
		}
		
	}
	@Override
	public void updateBasciInfo(Employee employee) {
		// TODO Auto-generated method stub
		userMapper.updateBasciInfo(employee);
	}
	@Override
	public Employee findEmployeeByName(String name) {
		Employee employee = userMapper.findEmployeeByName(name);
		return employee;
	}
	@Override
	public void updateJobInfo(Employee employee) {
		// TODO Auto-generated method stub
		userMapper.updateJobInfo(employee);
	}
	@Override
	public void updatePersonInfo(Employee employee) {
		// TODO Auto-generated method stub
		userMapper.updatePersonInfo(employee);
	}
	@Override
	public List<EmployeeEdu> findEmployeeEduByName(String name) {
		// TODO Auto-generated method stub
		return userMapper.findEmployeeEduByName(name);
	}
	@Override
	public void updateEmployeeEduInfo(EmployeeEdu employee) {
		// TODO Auto-generated method stub
		userMapper.updateEmployeeEduInfo(employee);
	}
	@Override
	public List<EmployeeProject> findEmployeeProjectByName(String name) {
		// TODO Auto-generated method stub
		return userMapper.findEmployeeProjectByName(name);
	}
	@Override
	public void updateEmployeeProjectInfo(EmployeeProject employee) {
		// TODO Auto-generated method stub
		userMapper.updateEmployeeProjectInfo(employee);
	}
	@Override
	public List<EmployeeWokExp> findEmployeeWokExpByName(String name) {
		// TODO Auto-generated method stub
		return userMapper.findEmployeeWokExpByName(name);
	}
	@Override
	public void updateEmployeeWokExpInfo(EmployeeWokExp employee) {
		// TODO Auto-generated method stub
		userMapper.updateEmployeeWokExpInfo(employee);
	}
	@Override
	public void deleteEmployeeEduById(int id) {
		// TODO Auto-generated method stub
		userMapper.deleteEmployeeEduById(id);
	}
	@Override
	public void deleteEmployeeProjectById(int id) {
		// TODO Auto-generated method stub
		userMapper.deleteEmployeeProjectById(id);
	}
	@Override
	public void deleteEmployeeWokExpById(int id) {
		// TODO Auto-generated method stub
		userMapper.deleteEmployeeWokExpById(id);
	}
	@Override
	public Company findCompanyByUserName(String userName) {
		// TODO Auto-generated method stub
		return userMapper.selectCompanyByName(userName);
	}
	@Override
	public Company findCompanyById(int companyId) {
		// TODO Auto-generated method stub
		return userMapper.selectCompanyById(companyId);
	}
	@Override
	public void updateShortNameAndFeatures(CompanyNameForm companyNameForm) {
		// TODO Auto-generated method stub
		userMapper.updateShortNameAndFeatures(companyNameForm);
	}
	@Override
	public void updateLabels(CompanyLabelForm companyLabelForm) {
		// TODO Auto-generated method stub
		userMapper.updateLabels(companyLabelForm);
	}
	@Override
	public void updateBaseInfo(CompanyBaseInfoForm companyBaseInfoForm) {
		// TODO Auto-generated method stub
		userMapper.updateBaseInfo(companyBaseInfoForm);
	}
	@Override
	public void updateProductInfo(CompanyProductForm companyProductForm) {
		// TODO Auto-generated method stub
		userMapper.updateProductInfo(companyProductForm);
	}
	@Override
	public void updateProfile(CompanyProfileForm companyProfileForm) {
		// TODO Auto-generated method stub
		userMapper.updateProfile(companyProfileForm);
	}
	@Override
	public void addPosition(Position position) {
		// TODO Auto-generated method stub
		userMapper.addPosition(position);
		
	}
	@Override
	public void updatePosition(Position position) {
		// TODO Auto-generated method stub
		userMapper.updatePosition(position);
	}
	
}
