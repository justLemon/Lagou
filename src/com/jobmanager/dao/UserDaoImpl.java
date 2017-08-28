package com.jobmanager.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import  com.jobmanager.mapper.UserMapper;
import com.jobmanager.model.Employee;
import com.jobmanager.model.EmployeeEdu;
import com.jobmanager.model.EmployeeProject;
import com.jobmanager.model.EmployeeWokExp;
import com.jobmanager.model.User;
/**
 * DAO µœ÷≤„
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
		userMapper.addUser(user);
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
	
}
